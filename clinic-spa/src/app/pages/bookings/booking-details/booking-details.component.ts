import { Subscription } from "rxjs";
import {
  FormGroup,
  FormControl,
  Validators,
  AbstractControl
} from "@angular/forms";
import { Component, OnInit, Input, ViewChild, OnDestroy } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { AuthService } from "./../../../auth/auth.service";
import { BookingNew, BookingEdit, BookingBrief } from "./../bookings.model";
import { SettingsService } from "./../../settings/settings.service";
import { BookingsService } from "./../bookings.service";
import {
  BookingSetting
} from "../../settings/settings.model";

@Component({
  selector: "booking-details",
  templateUrl: "./booking-details.component.html",
  styleUrls: ["./booking-details.component.scss"]
})
export class BookingDetailsComponent implements OnInit, OnDestroy {
  form: FormGroup;
  formLoading: boolean = false;
  todayDate: Date = new Date();
  bookingDetails: BookingEdit;
  bookingSetting: BookingSetting;
  bookingTypePrice: number = 0;
  bookingServicesPrice = 0;
  bookingDiscountPrice = 0;
  bookingsBriefList: BookingBrief[];

  @Input() bookId: number;
  @Input() patientId: string;
  @Input() patientName: string;

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private bookingService: BookingsService,
    private settingService: SettingsService,
    private authService: AuthService,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    // =====> get bookings settings:
    //this.bookingSetting = this.settingService.getBookingSetting();

    // =====> create reactive form:
    this.createForm();
  }

  ngOnDestroy() {}

  createForm() {
    this.form = new FormGroup({
      date: new FormControl(null, {
        validators: [Validators.required]
      }),
      time: new FormControl(null, {
        validators: [Validators.required]
      }),
      type: new FormControl(null, {
        validators: [Validators.required]
      }),
      services: new FormControl(null, {
        validators: []
      }),
      discount: new FormControl(),
      paid: new FormControl(null, {
        validators: [
          Validators.min(0),
          (control: AbstractControl) =>
            Validators.max(
              this.bookingTypePrice +
                this.bookingServicesPrice -
                this.bookingDiscountPrice
            )(control)
        ]
      })
    });

    // =====> get booking details if edit existing booking:
    if (this.bookId) {
      this.bookingDetails = this.bookingService.getBookingDetailsById(
        this.bookId
      );
    }

    // =====> initial values to form:
    this.form.setValue({
      date: !this.bookId
        ? this.bookingService.getChosenbookingDate()
        : this.bookingDetails.date,
      time: !this.bookId
        ? this.bookingSetting.bookingTimeFrom
        : this.bookingDetails.time,
      type: !this.bookId ? 1 : this.bookingDetails.typeId,
      services: !this.bookId ? [] : this.bookingDetails.servicesIds,
      discount: !this.bookId ? 0 : this.bookingDetails.discountId,
      paid: !this.bookId ? 0 : this.bookingDetails.paid
    });

    // =====> add chosen type & services prices & discount price to total price:
    this.bookingTypePrice = this.bookingSetting.bookingTypePrices.find(
      t => t.id == this.form.value.type
    ).price;
    this.bookingServicesPrice = this.bookingSetting.bookingServicePrices
      .filter(s => this.form.value.services.some(i => i == s.id))
      .reduce((acc, service) => acc + service.price, 0);
    const discount = this.bookingSetting.bookingDiscountPrices.find(
      t => t.id == this.form.value.discount
    );
    if(this.bookId){
    this.bookingDiscountPrice = discount.isPercent
      ? ((this.bookingTypePrice + this.bookingServicesPrice) * discount.price) /
        100
      : discount.price;
    }
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChooseBookingDate(date) {
    this.bookingsBriefList = this.bookingService.getBookingsBriefByDate(date);
    // =====> set next time if new booking:
    if (!this.bookId) {
      const lastTimeBooked = this.bookingsBriefList[
        this.bookingsBriefList.length - 1
      ].time;
      let nextAvailableTime = new Date(lastTimeBooked);
      nextAvailableTime.setMinutes(
        lastTimeBooked.getMinutes() + this.bookingSetting.bookingPeriod
      );
      this.form.patchValue({
        time: nextAvailableTime
      });
    }
  }

  // =====> check if choosen booking time is already taken in same date:
  onChooseBookingTime(event) {
    if (new Date(event).getHours() == 9 && new Date(event).getMinutes() == 0) {
      this.form.get("time").setErrors({ duplicateTime: true });
    } else {
      this.form.get("time").setErrors(null);
    }
  }

  onChangeType(typeId) {
    const type = this.bookingSetting.bookingTypePrices.find(t => t.id == typeId)
      .type;
    // =====> check expired date for consult:
    if (type == "consult") {
      this.expiredSwal.fire();
    }
    // =====> if type is "Just Service" make service control is required:
    if (type == "justService") {
      this.form.get("services").setValidators(Validators.required);
      this.form.get("services").updateValueAndValidity();
    } else {
      this.form.get("services").clearValidators();
      this.form.get("services").updateValueAndValidity();
    }
    // =====> add chosen type price to total price:
    this.bookingTypePrice = this.bookingSetting.bookingTypePrices.find(
      t => t.id == this.form.value.type
    ).price;
  }

  onChangeService(services: number[]) {
    // =====> add chosen services price to total price:
    this.bookingServicesPrice = this.bookingSetting.bookingServicePrices
      .filter(s => services.some(i => i == s.id))
      .reduce((acc, service) => acc + service.price, 0);
  }

  // =====> add chosen discount price to total price:
  onChangeDiscount(discountId) {
    const discount = this.bookingSetting.bookingDiscountPrices.find(
      t => t.id == discountId
    );
    this.bookingDiscountPrice = discount.isPercent
      ? ((this.bookingTypePrice + this.bookingServicesPrice) * discount.price) /
        100
      : discount.price;
  }

  // =====> on submit new booking:
  onAddBooking() {
    this.formLoading = true;
    setTimeout(() => {
      // =====> if new booking:
      if (!this.bookId) {
        const newBooking: BookingNew = {
          patientId: this.patientId,
          clinicId: this.authService.clinicId,
          doctorId: this.authService.doctorId,
          date: this.form.value.date,
          time: this.form.value.time,
          typeId: this.form.value.type,
          servicesIds: this.form.value.services,
          discountId: this.form.value.discount,
          paid: this.form.value.paid
        };
        this.bookingService.addNewBooking(newBooking);
      }
      // =====> if update booking:
      else {
        const EditedBooking: BookingEdit = {
          bookId: this.bookId,
          date: this.form.value.date,
          time: this.form.value.time,
          typeId: this.form.value.type,
          servicesIds: this.form.value.services,
          discountId: this.form.value.discount,
          paid: this.form.value.paid
        };
        this.bookingService.updateBooking(EditedBooking);
      }
      this.doneSwal.fire();
      this.formLoading = false;
      this.dialogRef.close();
    }, 1000);
  }
}
