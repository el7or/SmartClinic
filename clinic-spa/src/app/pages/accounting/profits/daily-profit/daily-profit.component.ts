import { Component, OnInit, OnDestroy } from '@angular/core';
import { Subscription } from 'rxjs';
import { AccountingService } from '../../accounting.service';
import { AlertService } from '../../../../shared/services/alert.service';
import { DayProfit } from '../../accounting.model';

@Component({
  selector: 'daily-profit',
  templateUrl: './daily-profit.component.html',
  styleUrls: ['./daily-profit.component.scss']
})
export class DailyProfitComponent implements OnInit ,OnDestroy {
  formLoading = false;
  dayProfits: DayProfit[];

  getSubs: Subscription;

  constructor(
    private accountingService: AccountingService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.accountingService
      .getDailyProfits()
      .subscribe(
        (res: DayProfit[]) => {
          this.dayProfits = res;
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
