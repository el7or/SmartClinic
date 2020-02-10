import { SettingsService } from './../../settings/settings.service';
import { BookingsService } from './../bookings.service';
import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "booking-details",
  templateUrl: "./booking-details.component.html",
  styleUrls: ["./booking-details.component.scss"]
})
export class BookingDetailsComponent implements OnInit {
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;
  @Input() patientDetails: string;
  @Input() isNewBookings: boolean;
  formLoading = false;
  bookingDateLoading = false;
  todayDate: Date = new Date();
  ChoosenDate = null;
  bookingHasDiscount = false;

  bookingDoctorData;
  bookingDateData;
  bookingTimeData;
  bookingTypeData;
  weekendDays: number[];
  bookingServiceData:any[];

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private localeService: BsLocaleService,
    private bookingService: BookingsService,
    private settingService: SettingsService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.bookingDateData = this.bookingService.getChosenbookingDate();
    if (this.isNewBookings) {
    } else {
      this.bookingDoctorData = '1'
      //this.bookingDateData = new Date();
      this.bookingTimeData = new Date();
      this.bookingTypeData = '1'
    }

    // =====> get weekends to disable it in datepicker:
    this.weekendDays = this.settingService.getWeekEndsDays();
  }

  // =====> on submit new booking:
  onAddBooking(form: NgForm) {
    console.log(form.value);
    this.doneSwal.fire();
    this.dialogRef.close();
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChooseBookingDate(input: NgForm) {
    //console.log(input);
    this.ChoosenDate = input.value;
  }

  // =====> check if choosen booking time is already taken in same date:
  onChooseBookingTime(input: NgForm) {
    //console.log(input);
    if (
      new Date(input.value).getHours() == 5 &&
      new Date(input.value).getMinutes() == 0
    ) {
      input.control.setErrors({ duplicateTime: true });
    } else {
      input.control.setErrors(null);
    }
  }

  onChangeType(input: NgForm) {
    if (input.value == "2") {
      this.expiredSwal.fire();
    }
  }

  // =====> check if discount in range of amount:
  onChangeDiscount(input: NgForm) {
    if (input.value > 50 || input.value < 0) {
      input.control.setErrors({ outRange: true });
    } else {
      input.control.setErrors(null);
      input.value > 0
        ? (this.bookingHasDiscount = true)
        : (this.bookingHasDiscount = false);
    }
  }
}
