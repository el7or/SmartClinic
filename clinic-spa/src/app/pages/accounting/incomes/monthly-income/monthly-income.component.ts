import { Component, OnInit } from "@angular/core";
import { Subscription } from 'rxjs';

import { AccountingService } from '../../accounting.service';
import { AlertService } from '../../../../shared/services/alert.service';
import { MonthIncome } from '../../accounting.model';

@Component({
  selector: "monthly-income",
  templateUrl: "./monthly-income.component.html",
  styleUrls: ["./monthly-income.component.scss"],
})
export class MonthlyIncomeComponent implements OnInit {
  formLoading = false;
  currentDay?: Date = new Date();
  monthPayments: MonthIncome[];

  getSubs: Subscription;

  constructor(
    private accountingService: AccountingService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.accountingService
      .getMonthIncomes()
      .subscribe(
        (res: MonthIncome[]) => {
          this.monthPayments = res;
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
