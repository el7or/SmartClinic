import { SettingsService } from './../../settings/settings.service';
import { BookingsService } from './../bookings.service';
import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BookingServicePrice, BookingTypePrice } from '../../settings/settings.model';

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

  bookingDoctorData;
  bookingDateData;
  bookingTimeData;
  bookingTimeMin;
  bookingTimeMax;
  bookingTypeData;
  bookingServiceData;
  weekendDays: number[];
  bookingTypeValues:BookingTypePrice[];
  bookingServiceValues:BookingServicePrice[];

  bookingTypePrice:number = 0;
  bookingServicePrice = 0;

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private bookingService: BookingsService,
    private settingService: SettingsService,
    private localeService: BsLocaleService
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

    // =====> get booking types and services from setting:
    this.bookingTypeValues = this.settingService.getBookingTypePrices();
    this.bookingServiceValues = this.settingService.getBookingServicePrices();

    // =====> get weekends to disable it in datepicker:
    this.weekendDays = this.settingService.getWeekEndsDays();

    // =====> get min & max booking period to disable another times in datepicker:
    this.bookingTimeData = this.bookingTimeMin = this.settingService.bookingTimeFrom;
    this.bookingTimeMax = this.settingService.bookingTimeTo;
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


  onChangeType(type) {
    // =====> check expired date for consult:
    if (type == "consult") {
      this.expiredSwal.fire();
    }
    // =====> add chosen type price to total price:
    this.bookingTypePrice = this.bookingTypeValues.find(t => t.type==type).price;
  }

  onChangeService(service){
    // =====> add chosen services price to total price:
    this.bookingServicePrice= this.bookingServiceValues.find(t => t.service==service).price;
  }

  // =====> on submit new booking:
  onAddBooking(form: NgForm) {
    console.log(form.value);
    this.doneSwal.fire();
    this.dialogRef.close();
  }
}
