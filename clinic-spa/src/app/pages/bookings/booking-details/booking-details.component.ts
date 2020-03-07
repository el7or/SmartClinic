import { Subscription } from "rxjs";
import {
  FormGroup,
  FormControl,
  Validators,
  AbstractControl
} from "@angular/forms";
import {
  Component,
  OnInit,
  Input,
  ViewChild,
  OnDestroy,
  ChangeDetectorRef
} from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { AuthService } from "./../../../auth/auth.service";
import { BookingNew, BookingEdit } from "./../bookings.model";
import { SettingsService } from "./../../settings/settings.service";
import { BookingsService } from "./../bookings.service";
import {
  BookingServicePrice,
  BookingTypePrice
} from "../../settings/settings.model";

@Component({
  selector: "booking-details",
  templateUrl: "./booking-details.component.html",
  styleUrls: ["./booking-details.component.scss"]
})
export class BookingDetailsComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  todayDate: Date = new Date();
  ChoosenDate: Date = null;
  bookingDetails: BookingEdit;
  form: FormGroup;
  bookingTypeValues: BookingTypePrice[];
  bookingServiceValues: BookingServicePrice[];
  weekendDays: number[];
  bookingTimeMin: Date;
  bookingTimeMax: Date;
  bookingTypePrice: number = 0;
  bookingServicesPrice = 0;

  @Input() bookId: number;
  @Input() patientId: string;
  @Input() patientName: string;

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;

  typeChangesSubs: Subscription;
  discountChangesSubs: Subscription;

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private bookingService: BookingsService,
    private settingService: SettingsService,
    private authService: AuthService,
    private localeService: BsLocaleService,
    private cdr: ChangeDetectorRef
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    // =====> get bookings settings:
    this.getSettings();

    // =====> create reactive form:
    this.createForm();
  }

  ngOnDestroy() {
    if (this.typeChangesSubs) this.typeChangesSubs.unsubscribe();
    if (this.discountChangesSubs) this.discountChangesSubs.unsubscribe();
  }

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
      discount: new FormControl(null, {
        validators: [
          Validators.min(0),
          (control: AbstractControl) =>
            Validators.max(this.bookingTypePrice + this.bookingServicesPrice)(
              control
            )
        ]
      }),
      discountNote: new FormControl(null, {
        validators: []
      }),
      paid: new FormControl(null, {
        validators: [Validators.min(0)]
      })
    });

    // =====> get booking details if edit existing booking:
    let bookingDetails: BookingEdit;
    if (this.bookId) {
      bookingDetails = this.bookingService.getBookingDetailsById(this.bookId);
    }

    // =====> initial values to form:
    this.form.setValue({
      date: !this.bookId
        ? this.bookingService.getChosenbookingDate()
        : bookingDetails.date,
      time: !this.bookId ? this.bookingTimeMin : bookingDetails.time,
      type: !this.bookId ? 1 : bookingDetails.typeId,
      services: !this.bookId ? [] : bookingDetails.servicesIds,
      discount: !this.bookId ? 0 : bookingDetails.discount,
      discountNote: !this.bookId ? "" : bookingDetails.discountNote,
      paid: !this.bookId ? 0 : bookingDetails.paid
    });

    // =====> add chosen type & services prices to total price:
    this.bookingTypePrice = this.bookingTypeValues.find(
      t => t.id == this.form.value.type
    ).price;
    this.bookingServicesPrice = this.bookingServiceValues
      .filter(s => this.form.value.services.some(i => i == s.id))
      .reduce((acc, service) => acc + service.price, 0);
  }

  getSettings(): void {
    // =====> get booking types values and services values from setting:
    this.bookingTypeValues = this.settingService.getBookingTypePrices();
    this.bookingServiceValues = this.settingService.getBookingServicePrices();

    // =====> get setting for weekends to disable it in datepicker:
    this.weekendDays = this.settingService.getWeekEndsDays();

    // =====> get setting for min & max booking period to disable another times in datepicker:
    this.bookingTimeMin = this.settingService.bookingTimeFrom;
    this.bookingTimeMax = this.settingService.bookingTimeTo;
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChooseBookingDate(event) {
    //console.log(event);
  }

  // =====> check if choosen booking time is already taken in same date:
  onChooseBookingTime(event) {
    //console.log(input);
    if (new Date(event).getHours() == 5 && new Date(event).getMinutes() == 0) {
      this.form.get("time").setErrors({ duplicateTime: true });
    } else {
      this.form.get("time").setErrors(null);
    }
  }

  onChangeType(typeId) {
    // =====> check expired date for consult:
    if (typeId == 2) {
      this.expiredSwal.fire();
    }
    // =====> if type is "Just Service" make service control is required:
    if (typeId == 3) {
      this.form.get("services").setValidators(Validators.required);
      this.form.get("services").updateValueAndValidity();
    } else {
      this.form.get("services").setValidators(null);
      this.form.get("services").setValidators(null);
      this.form.get("services").updateValueAndValidity();
    }
    // =====> add chosen type price to total price:
    this.bookingTypePrice = this.bookingTypeValues.find(
      t => t.id == this.form.value.type
    ).price;
  }

  // =====> add chosen services price to total price:
  onChangeService(services: number[]) {
    this.bookingServicesPrice = this.bookingServiceValues
      .filter(s => services.some(i => i == s.id))
      .reduce((acc, service) => acc + service.price, 0);
  }

  // =====> check if discount > 0 make discount note is required:
  onChangeDiscount(val) {
    if (val > 0) {
      this.form.get("discountNote").setValidators(Validators.required);
      this.form.get("discountNote").updateValueAndValidity();
    }
    else{
      this.form.get("discountNote").setValidators(null);
      this.form.get("discountNote").updateValueAndValidity();
    }
    this.cdr.detectChanges();
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
          discount: this.form.value.discount,
          discountNote: this.form.value.discountNote,
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
          discount: this.form.value.discount,
          discountNote: this.form.value.discountNote,
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
