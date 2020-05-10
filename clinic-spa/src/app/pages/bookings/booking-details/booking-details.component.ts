import { Subscription } from "rxjs";
import { map } from "rxjs/operators";
import {
  FormGroup,
  FormControl,
  Validators,
  AbstractControl,
} from "@angular/forms";
import { Component, OnInit, Input, ViewChild, OnDestroy } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import {
  BookingNew,
  BookingEdit,
  GetBookingDetails,
  BookingSetting,
  BookingDetails,
  BookingChangeDate,
} from "./../bookings.model";
import { BookingsService } from "./../bookings.service";
import { AlertService } from '../../../shared/services/alert.service';

@Component({
  selector: "booking-details",
  templateUrl: "./booking-details.component.html",
  styleUrls: ["./booking-details.component.scss"],
})
export class BookingDetailsComponent implements OnInit, OnDestroy {
  form: FormGroup;
  formLoading: boolean = false;
  todayDate: Date = new Date();
  bookingSetting: BookingSetting;
  bookingDetails: BookingDetails;
  bookingTypePrice = 0;
  bookingServicesPrice = 0;
  bookingDiscountPrice = 0;

  @Input() bookId: number;
  @Input() patientId: string;

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;

  getBookSubs: Subscription;
  getChangeDateSubs: Subscription;

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private bookingService: BookingsService,
    private alertService: AlertService,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.formLoading = true;
    // =====> get booking settings & data:
    this.getBookSubs = this.bookingService
      .getBookingDetails(
        this.patientId,
        this.bookId,
        this.bookingService.chosenBookingDate
      )
      .pipe(
        map((res: GetBookingDetails) => {
          this.bookingSetting = res.bookingSetting;
          return res.bookingDetails;
        })
      )
      .subscribe((res: BookingDetails) => {
        this.bookingDetails = res;

        // =====> create reactive form:
        this.form = new FormGroup({
          date: new FormControl(null, {
            validators: [Validators.required],
          }),
          time: new FormControl(null, {
            validators: [Validators.required],
          }),
          type: new FormControl(null, {
            validators: [Validators.required],
          }),
          services: new FormControl(null, {
            validators: [],
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
                )(control),
            ],
          }),
        });

        // =====> initial values for reactive form:
        this.form.setValue({
          date: !this.bookId
            ? this.bookingService.chosenBookingDate
            : this.bookingDetails.bookingDateTime,
          time: !this.bookId
            ? this.bookingSetting.clinicDayTimeFrom
            : this.bookingDetails.bookingDateTime,
          type: !this.bookId ? 1 : this.bookingDetails.bookingTypeId,
          services: !this.bookId ? [] : this.bookingDetails.bookingServicesIds,
          discount: !this.bookId ? 0 : this.bookingDetails.bookingDiscountId,
          paid: !this.bookId ? 0 : this.bookingDetails.bookingPayments,
        });

        // =====> add chosen type & services prices & discount price to total price:
        this.bookingTypePrice = this.bookingSetting.clinicBookingTypes.find(
          (t) => t.id == this.form.value.type
        ).price;
        if (this.bookId) {
          this.bookingServicesPrice = this.bookingSetting.clinicBookingServices
            .filter((s) => this.form.value.services.some((i) => i == s.id))
            .reduce((acc, service) => acc + service.price, 0);

          const discount = this.bookingSetting.clinicBookingDiscounts.find(
            (t) => t.id == this.form.value.discount
          );
          this.bookingDiscountPrice = discount.isPercent
            ? ((this.bookingTypePrice + this.bookingServicesPrice) *
                discount.price) /
              100
            : discount.price;
        }
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      });
  }
  ngOnDestroy() {
    this.getBookSubs.unsubscribe();
    if (this.getChangeDateSubs) this.getChangeDateSubs.unsubscribe();
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChangeBookingDate(date) {
    this.formLoading = true;
    this.getChangeDateSubs = this.bookingService
      .getBookingChangeDate(this.patientId, date)
      .subscribe((res: BookingChangeDate) => {
        this.bookingSetting.clinicDayTimeFrom = res.clinicDayTimeFrom;
        this.bookingSetting.clinicDayTimeTo = res.clinicDayTimeTo;
        this.bookingSetting.doctorAllBookingSameDay = res.doctorAllBookingSameDay;
        this.form.patchValue({ time: res.clinicDayTimeFrom });

        /* // =====> set next time if new booking:
        if (!this.bookId) {
          const lastTimeBooked = this.bookingSetting.doctorAllBookingSameDay[
            this.bookingSetting.doctorAllBookingSameDay.length - 1
          ].time;
          let nextAvailableTime = new Date(lastTimeBooked);
          nextAvailableTime.setMinutes(
            lastTimeBooked.getMinutes() +
              this.bookingSetting.clinicBookingPeriod
          );
          this.form.patchValue({
            time: nextAvailableTime,
          });
        } */
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      });
  }

  // =====> check if choosen booking time is already taken in same date:
  onChangeBookingTime(event) {
    if (new Date(event).getHours() == 9 && new Date(event).getMinutes() == 0) {
      this.form.get("time").setErrors({ duplicateTime: true });
    } else {
      this.form.get("time").setErrors(null);
    }
  }

  onChangeType(typeId) {
    /* const type = this.bookingSetting.bookingTypePrices.find(t => t.id == typeId)
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
    ).price; */
  }

  onChangeService(services: number[]) {
    /* // =====> add chosen services price to total price:
    this.bookingServicesPrice = this.bookingSetting.bookingServicePrices
      .filter(s => services.some(i => i == s.id))
      .reduce((acc, service) => acc + service.price, 0); */
  }

  // =====> add chosen discount price to total price:
  onChangeDiscount(discountId) {
    /* const discount = this.bookingSetting.bookingDiscountPrices.find(
      t => t.id == discountId
    );
    this.bookingDiscountPrice = discount.isPercent
      ? ((this.bookingTypePrice + this.bookingServicesPrice) * discount.price) /
        100
      : discount.price; */
  }

  // =====> on submit new booking:
  onAddBooking() {
    /* this.formLoading = true;
    // =====> if new booking:
    if (!this.bookId) {
      const newBooking: BookingNew = {
        patientId: this.patientCodeId,
        clinicId: this.authService.clinicId,
        doctorId: this.authService.doctorId,
        date: this.form.value.date,
        time: this.form.value.time,
        typeId: this.form.value.type,
        servicesIds: this.form.value.services,
        discountId: this.form.value.discount,
        paid: this.form.value.paid,
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
        paid: this.form.value.paid,
      };
      this.bookingService.updateBooking(EditedBooking);
    }
    this.doneSwal.fire();
    this.formLoading = false;
    this.dialogRef.close(); */
  }
}
