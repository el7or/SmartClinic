import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BsLocaleService, TypeaheadMatch } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";

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
  noResultAutoComplete: boolean = false;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    private bookingService: BookingsService,
    protected langgService: LanggService,
    private localeService: BsLocaleService,
    private dialogService: NbDialogService
  ) {
    // =====> localize datepicker:
    this.localeService.use(langgService.locale);
  }

  ngOnInit() {
    // =====> get bookings list for today:
    this.bookingsList = this.bookingService.getBookingsListToday(new Date());

    // =====> combine name with mobile to autocomplete search:
    this.bookingsList.forEach(booking => {
      this.autoCompleteList.push({
        id: booking.id,
        nameMobile: booking.mobile + " - " + booking.name
      });
    });
  }

  // =====> get bookings in previous day:
  onPrevDay(day: Date) {
    this.tableLoading = true;
    setTimeout(() => {
      if (this.currentDay == null) {
       this.currentDay ==  new Date(new Date().setDate(day.getDate() - 1))
      }
      else{
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
       this.currentDay ==  new Date(new Date().setDate(day.getDate() + 1))
      }
      else{
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

  // =====> on select from autocomplete:
  onSelectAutocomplete(event: TypeaheadMatch) {
    this.tableLoading = true;
    setTimeout(() => {
      this.currentDay = null;
      this.bookingsList = this.bookingsList.filter(
        booking => booking.id == event.item.id
      );
      this.tableLoading = false;
    }, 1000);
  }

  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        patientDetails: "محمد أحمد السيد",
        isNewBookings: bookingId==0? true:false
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

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
      hasBackdrop: true
    });
  }
}
