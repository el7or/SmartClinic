import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BsLocaleService } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";
import { ActivatedRoute } from "@angular/router";

import { SettingsService } from "./../../settings/settings.service";
import { BookingsService } from "./../bookings.service";
import { LanggService } from "./../../../shared/services/langg.service";
import { BookingDetailsComponent } from "../booking-details/booking-details.component";
import { PaymentSummaryComponent } from "../../finance/payment-summary/payment-summary.component";

@Component({
  selector: "bookings-list",
  templateUrl: "./bookings-list.component.html",
  styleUrls: ["./bookings-list.component.scss"]
})
export class BookingsListComponent implements OnInit {
  formLoading: boolean = false;
  currentDay?: Date = new Date();
  bookingsList: any[];
  autoCompleteList: any[] = [];
  tableLoading = false;
  weekendDays: number[];
  totalCost:number;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(
    private bookingService: BookingsService,
    public langgService: LanggService,
    private settingService: SettingsService,
    private localeService: BsLocaleService,
    private dialogService: NbDialogService,
    private route: ActivatedRoute
  ) {
    // =====> localize datepicker:
    this.localeService.use(langgService.locale);
  }

  ngOnInit() {
    // =====> check  param:date:
    this.route.paramMap.subscribe(paramMap => {
      const paramDate = new Date(paramMap.get("date"));
      // =====> if param has date to set it in datepicker value:
      if (paramMap.has("date") && !isNaN(paramDate.getTime())) {
        this.currentDay = paramDate;
      }
      // =====> if no param set datepicker to first day in current month:
      else {
        const firstDay = new Date(
          new Date().getFullYear(),
          new Date().getMonth(),
          1
        );
        this.currentDay = firstDay;
      }
    });

    // =====> get bookings list for today:
    this.bookingsList = this.bookingService.getBookingsListToday(new Date());
    this.totalCost = this.bookingsList.reduce((acc,booking) => acc + booking.cost, 0);

    // =====> combine name with mobile to autocomplete search:
    this.bookingsList.forEach(booking => {
      this.autoCompleteList.push({
        id: booking.id,
        nameMobile: booking.mobile + " - " + booking.name
      });
    });

    // =====> get weekends to disable it:
    this.weekendDays = this.settingService.getWeekEndsDays();
  }

  // =====> get bookings in previous day:
  onPrevDay(day: Date) {
    this.tableLoading = true;
    setTimeout(() => {
      if (this.currentDay == null) {
        this.currentDay == new Date(new Date().setDate(day.getDate() - 1));
      } else {
        this.currentDay = new Date(this.currentDay.setDate(day.getDate() - 1));
      }
      this.tableLoading = false;
    }, 1000);
  }

  // =====> get bookings in next day:
  onNextDay(day) {
    this.tableLoading = true;
    setTimeout(() => {
      if (this.currentDay == null) {
        this.currentDay == new Date(new Date().setDate(day.getDate() + 1));
      } else {
        this.currentDay = new Date(this.currentDay.setDate(day.getDate() + 1));
      }
      this.tableLoading = false;
    }, 1000);
  }

  // =====> on choose from datepicker:
  onChooseBookingsDate(form: NgForm) {
    this.tableLoading = true;
    setTimeout(() => {
      // =====> load new data:
      this.tableLoading = false;
    }, 1000);
  }

  // =====> on click on new booking or edit booking:
  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        patientName: "محمد أحمد السيد",
        isNewBookings: bookingId == 0 ? true : false
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  // =====> on click on delete booking:
  onDeleteBooking() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  onOpenPaymentSummary(patientId: number) {
    this.dialogService.open(PaymentSummaryComponent, {
      context: {
        patientDetails: "ملخص حالة الدفع:"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }
}
