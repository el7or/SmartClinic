import { Component, OnInit, OnDestroy } from '@angular/core';
import { MonthProfit } from '../../accounting.model';
import { Subscription } from 'rxjs';
import { AccountingService } from '../../accounting.service';
import { AlertService } from '../../../../shared/services/alert.service';

@Component({
  selector: 'monthly-profit',
  templateUrl: './monthly-profit.component.html',
  styleUrls: ['./monthly-profit.component.scss']
})
export class MonthlyProfitComponent implements OnInit ,OnDestroy {
  formLoading = false;
  monthProfits: MonthProfit[];

  getSubs: Subscription;

  constructor(
    private accountingService: AccountingService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.accountingService
      .getMonthProfits()
      .subscribe(
        (res: MonthProfit[]) => {
          this.monthProfits = res;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
  }

}
