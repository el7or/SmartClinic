import { Subscription } from "rxjs";
import { DateTimeService } from "./../../../shared/services/date-time.service";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BsLocaleService } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";
import { ActivatedRoute, Router } from "@angular/router";

import { BookingsService } from "./../bookings.service";
import { LanggService } from "./../../../shared/services/langg.service";
import { BookingDetailsComponent } from "../booking-details/booking-details.component";
import { BookingList, GetBookingList } from "../bookings.model";
import { AlertService } from "../../../shared/services/alert.service";
import { AuthService } from "../../../auth/auth.service";
import { UserRole } from "../../../auth/auth.model";

@Component({
  selector: "bookings-list",
  templateUrl: "./bookings-list.component.html",
  styleUrls: ["./bookings-list.component.scss"],
})
export class BookingsListComponent implements OnInit, OnDestroy {
  formLoading = false;
  currentDay?: Date = new Date();
  bookingsList: BookingList[];
  autoCompleteList: any[] = [];
  weekendDays: number[];
  totalPaid: number;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("cancelSwal", { static: false }) cancelSwal: SwalComponent;

  routeSubs: Subscription;
  getListSubs: Subscription;
  cancelBookSubs: Subscription;

  constructor(
    private bookingService: BookingsService,
    public langgService: LanggService,
    private localeService: BsLocaleService,
    private dialogService: NbDialogService,
    private dateTimeService: DateTimeService,
    private alertService: AlertService,
    private authService: AuthService,
    private router: Router,
    private route: ActivatedRoute
  ) {
    // =====> localize datepicker:
    this.localeService.use(langgService.locale);
  }

  ngOnInit() {
    this.formLoading = true;
    // =====> check  param:date:
    this.routeSubs = this.route.paramMap.subscribe((paramMap) => {
      const paramDate = new Date(paramMap.get("date"));
      // =====> if param has date to set it in datepicker value:
      if (paramMap.has("date") && !isNaN(paramDate.getTime())) {
        this.currentDay = paramDate;
        this.getBookingListByDate(this.currentDay);
      }
      // =====> if no param set datepicker to first day in current month:
      else {
        const firstDay = new Date(
          new Date().getFullYear(),
          new Date().getMonth(),
          1
        );
        this.currentDay = firstDay;
        this.getBookingListByDate(this.currentDay);
      }
    });
  }
  ngOnDestroy() {
    this.getListSubs.unsubscribe();
    this.routeSubs.unsubscribe();
    if (this.cancelBookSubs) this.cancelBookSubs.unsubscribe();
  }

  // =====> get bookings in previous day:
  onPrevDay(day: Date) {
    this.formLoading = true;
    if (this.currentDay == null) {
      this.currentDay == new Date(new Date().setDate(day.getDate() - 1));
      this.getBookingListByDate(this.currentDay);
    } else {
      this.currentDay = new Date(this.currentDay.setDate(day.getDate() - 1));
      this.getBookingListByDate(this.currentDay);
    }
  }

  // =====> get bookings in next day:
  onNextDay(day) {
    this.formLoading = true;
    if (this.currentDay == null) {
      this.currentDay == new Date(new Date().setDate(day.getDate() + 1));
      this.getBookingListByDate(this.currentDay);
    } else {
      this.currentDay = new Date(this.currentDay.setDate(day.getDate() + 1));
      this.getBookingListByDate(this.currentDay);
    }
  }

  // =====> on choose from datepicker:
  onChooseBookingsDate(date) {
    if (!this.formLoading) {
      this.formLoading = true;
      this.currentDay = date;
      this.getBookingListByDate(date);
    }
  }

  // =====> get bookings list for chosen date:
  getBookingListByDate(date: Date) {
    if (this.getListSubs) {
      this.getListSubs.unsubscribe();
    }
    this.getListSubs = this.bookingService
      .getBookingsListByDate(this.dateTimeService.dateWithoutTime(date))
      .subscribe(
        (res: GetBookingList) => {
          this.bookingsList = res.bookingsList;
          this.totalPaid = res.bookingsList.filter(b => !b.isCanceled).reduce((acc, booking) => acc + booking.paid, 0);
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

  // =====> on click on new booking or edit booking:
  onBook(bookingId, patientId: string) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: bookingId,
        patientId: patientId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }

  // =====> on click on cancel booking:
  onDeleteBooking(bookId: number) {
    this.cancelSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.cancelBookSubs = this.bookingService
          .cancelBooking(bookId)
          .subscribe(
            () => {
              let canceledBooking= this.bookingsList.find(
                (v) => v.bookId == bookId
              );
              canceledBooking.isCanceled = true;
              this.totalPaid = this.totalPaid - canceledBooking.paid;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (error) => {
              console.error(error);
              this.alertService.alertError();
              this.formLoading = false;
            }
          );
      }
    });
  }

  // =====> on click file patient in table:
  onOpenFilePatient(codeId: number) {
    if (this.authService.roleName != UserRole.Employee) {
      this.router.navigate(["/pages/patients/details/" + codeId + "/record"]);
    } else {
      this.router.navigate(["/pages/patients/details/" + codeId + "/basic"]);
    }
  }

  /* onOpenPaymentSummary(patientId: number) {
    this.dialogService.open(PaymentSummaryComponent, {
      context: {
        patientDetails: "ملخص حالة الدفع:"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: true,
      closeOnEsc: true
    });
  } */
}
