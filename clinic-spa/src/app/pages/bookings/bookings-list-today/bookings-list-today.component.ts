import { SettingsService } from "./../../settings/settings.service";
import {
  Component,
  OnInit,
  ViewChild,
  AfterViewInit,
  ChangeDetectorRef
} from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { CdkDragDrop, moveItemInArray } from "@angular/cdk/drag-drop";

import { BookingsService } from "./../bookings.service";
import { BookingDetailsComponent } from "../booking-details/booking-details.component";
import { PaymentSummaryComponent } from "../../finance/payment-summary/payment-summary.component";

@Component({
  selector: "bookings-list-today",
  templateUrl: "./bookings-list-today.component.html",
  styleUrls: ["./bookings-list-today.component.scss"]
})
export class BookingsListTodayComponent implements OnInit, AfterViewInit {
  bookingsList: any[];
  today: Date = new Date();
  nextBooking: number;
  sortBookingsBy: string;
  sortBookingsByText: string;
  totalCost:number;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    private bookingService: BookingsService,
    private dialogService: NbDialogService,
    private settingService: SettingsService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {
    // =====> get list bookings in today (come from DB with sorting depends on setting):
    this.bookingsList = this.bookingService.getBookingsListToday(new Date());
    this.totalCost = this.bookingsList.reduce((acc,booking) => acc + booking.cost, 0);

    // =====> (will reomve after create DB):
    this.sortBookingsBy = this.settingService.sortBookingsBy;

    // =====> reorder list of bookings depends on value of 'sortBookingsBy':
    this.sortBookings(this.sortBookingsBy);
  }

  ngAfterViewInit() {
    this.cd.detectChanges();
  }

  // =====> on add new booking or edit booking:
  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        patientDetails: "محمد أحمد السيد",
        isNewBookings: bookingId == 0 ? true : false
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  // =====> on delete booking:
  onDeleteBooking() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  // =====> on drag drop row in table if order setting is 'Manual':
  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.bookingsList, event.previousIndex, event.currentIndex);
    // =====> reorder array after deag drop:
    this.sortBookings(this.sortBookingsBy);
  }

  // =====> on click on info for payment:
  onOpenPaymentSummary(patientId: number) {
    this.dialogService.open(PaymentSummaryComponent, {
      context: {
        patientDetails: "ملخص حالة الدفع:"
      },
      autoFocus: true,
      hasBackdrop: true
    });
  }

  // =====> on change attend checkbox:
  onChangeAttend(booking) {
    this.bookingsList
      .filter(b => b.id == booking.id)
      .map(b => {
        b.attendTime = new Date();
      });
    this.sortBookings(this.sortBookingsBy);
  }

  // =====> on change enter checkbox:
  onChangeEnter(booking) {
    this.bookingsList
      .filter(b => b.id == booking.id)
      .map(b => {
        b.entryTime = new Date();
        if (!b.attendTime) {
          b.attendTime = b.entryTime;
        }
      });
    this.sortBookings(this.sortBookingsBy);
  }

  // =====> reorder list of bookings:
  sortBookings(by: string) {
    switch (by) {
      case "byAttend":
        this.bookingsList
          .sort(
            (a, b) =>
              +b.isEnter - +a.isEnter ||
              +b.isAttend - +a.isAttend ||
              +a.attendTime - +b.attendTime
          )
          .map((item, index) => (item.seq = index + 1));
        this.sortBookingsByText = "According to the Attendance";
        break;
      case "byTime":
        this.bookingsList
          .sort((a, b) => +b.isEnter - +a.isEnter || +a.time - +b.time)
          .map((item, index) => (item.seq = index + 1));
        this.sortBookingsByText = "According to the Booking Time";
        break;
      case "manual":
        this.bookingsList
          .sort((a, b) => +b.isEnter - +a.isEnter)
          .map((item, index) => (item.seq = index + 1));
        this.sortBookingsByText = "Manual";
        break;
    }
    this.setNextBooking();
  }

  // =====> set label to first attend booking:
  setNextBooking() {
    this.nextBooking = this.bookingsList.findIndex(
      booking => booking.isAttend && !booking.isEnter
    );
  }
}
