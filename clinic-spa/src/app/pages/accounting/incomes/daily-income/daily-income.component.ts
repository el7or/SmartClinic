import { AuthService } from './../../../../auth/auth.service';
import { AccountingService } from "./../../accounting.service";
import { Component, OnInit } from "@angular/core";
import { Subscription } from "rxjs";
import { BsLocaleService } from "ngx-bootstrap";

import { LanggService } from "../../../../shared/services/langg.service";
import { DateTimeService } from "../../../../shared/services/date-time.service";
import { AlertService } from "../../../../shared/services/alert.service";
import { IncomeList, GetIncomeList } from "../../accounting.model";

@Component({
  selector: "daily-income",
  templateUrl: "./daily-income.component.html",
  styleUrls: ["./daily-income.component.scss"],
})
export class DailyIncomeComponent implements OnInit {
  formLoading = false;
  currentDay?: Date = new Date();
  paymentsList: IncomeList[];
  autoCompleteList: any[] = [];
  weekendDays: number[];
  totalPaid: number;

  getSubs: Subscription;

  constructor(
    private accountingService: AccountingService,
    public langgService: LanggService,
    private localeService: BsLocaleService,
    private dateTimeService: DateTimeService,
    private alertService: AlertService,
    public authService:AuthService
  ) {
    // =====> localize datepicker:
    this.localeService.use(langgService.locale);
  }

  ngOnInit() {
    this.getPaymentsListByDate(this.currentDay);
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
  }

  // =====> get payments in previous day:
  onPrevDay(day: Date) {
    this.formLoading = true;
    if (this.currentDay == null) {
      this.currentDay == new Date(new Date().setDate(day.getDate() - 1));
      this.getPaymentsListByDate(this.currentDay);
    } else {
      this.currentDay = new Date(this.currentDay.setDate(day.getDate() - 1));
      this.getPaymentsListByDate(this.currentDay);
    }
  }

  // =====> get payments in next day:
  onNextDay(day) {
    this.formLoading = true;
    if (this.currentDay == null) {
      this.currentDay == new Date(new Date().setDate(day.getDate() + 1));
      this.getPaymentsListByDate(this.currentDay);
    } else {
      this.currentDay = new Date(this.currentDay.setDate(day.getDate() + 1));
      this.getPaymentsListByDate(this.currentDay);
    }
  }

  // =====> on choose from datepicker:
  onChoosePaymentsDate(date) {
    if (!this.formLoading) {
      this.formLoading = true;
      this.currentDay = date;
      this.getPaymentsListByDate(date);
    }
  }

  // =====> get payments list for chosen date:
  getPaymentsListByDate(date: Date) {
    if (this.getSubs) {
      this.getSubs.unsubscribe();
    }
    this.getSubs = this.accountingService
      .getIncomesListByDate(this.dateTimeService.dateWithoutTime(date))
      .subscribe(
        (res: GetIncomeList) => {
          this.paymentsList = res.paymentsList;
          if (this.paymentsList) {
            this.totalPaid = res.paymentsList.reduce(
              (acc, booking) => acc + booking.paid,
              0
            );
          }
          // =====> get weekends to disable it:
          this.weekendDays = res.weekEnds;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
