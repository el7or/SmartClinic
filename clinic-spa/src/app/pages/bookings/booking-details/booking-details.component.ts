import { Router } from "@angular/router";
import { Subscription } from "rxjs";
import { map } from "rxjs/operators";
import { FormGroup, FormControl, Validators } from "@angular/forms";
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
  PrevBookingDue,
} from "./../bookings.model";
import { BookingsService } from "./../bookings.service";
import { AlertService } from "../../../shared/services/alert.service";
import { AuthService } from "../../../auth/auth.service";
import { DateTimeService } from "./../../../shared/services/date-time.service";

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
  prevBookingsDues?: PrevBookingDue[];
  bookingTypePrice = 0;
  bookingServicesPrice = 0;
  bookingDiscountPrice = 0;
  isUserChangedDate = false;
  isHasBookingSameDay: any;
  isAnyPrevDueInvalid = false;

  @Input() bookId: number;
  @Input() patientId: string;

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;
  @ViewChild("existSwal", { static: false }) existSwal: SwalComponent;

  getBookSubs: Subscription;
  getChangeDateSubs: Subscription;
  newBookSubs: Subscription;
  editBookSubs: Subscription;

  constructor(
    public dialogRef: NbDialogRef<BookingDetailsComponent>,
    private bookingService: BookingsService,
    private alertService: AlertService,
    private localeService: BsLocaleService,
    private authService: AuthService,
    private dateTimeService: DateTimeService,
    private router: Router
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));

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
        validators: [Validators.required, Validators.min(0)],
      }),
    });
  }

  ngOnInit() {
    this.formLoading = true;
    // =====> get booking settings & data:
    this.getBookSubs = this.bookingService
      .getBookingDetails(
        this.patientId,
        this.bookId,
        this.dateTimeService.dateWithoutTime(
          this.bookingService.chosenBookingDate
        )
      )
      .pipe(
        map((res: GetBookingDetails) => {
          this.bookingSetting = res.bookingSetting;
          this.bookingSetting.clinicDayTimeFrom = new Date(
            this.bookingSetting.clinicDayTimeFrom
          );
          this.bookingSetting.clinicDayTimeTo = new Date(
            this.bookingSetting.clinicDayTimeTo
          );
          this.prevBookingsDues = res.prevBookingsDues;

          return res.bookingDetails;
        })
      )
      .subscribe(
        (res: BookingDetails) => {
          this.bookingDetails = res;

          // =====> initial values for reactive form:
          this.form.setValue({
            date: !this.bookId
              ? this.bookingService.chosenBookingDate
              : new Date(this.bookingDetails.bookingDateTime),
            time: !this.bookId
              ? new Date(this.bookingSetting.clinicDayTimeFrom)
              : new Date(this.bookingDetails.bookingDateTime),
            type: !this.bookId
              ? this.bookingSetting.clinicBookingTypes[0].id
              : this.bookingDetails.bookingTypeId,
            services: !this.bookId
              ? []
              : this.bookingDetails.bookingServicesIds,
            discount: !this.bookId ? 0 : this.bookingDetails.bookingDiscountId,
            paid: 0,
          });

          setTimeout(() => {
            this.form
              .get("date")
              .patchValue(
                !this.bookId
                  ? this.bookingService.chosenBookingDate
                  : new Date(this.bookingDetails.bookingDateTime)
              );
            this.form
              .get("type")
              .patchValue(
                !this.bookId
                  ? this.bookingSetting.clinicBookingTypes[0].id
                  : this.bookingDetails.bookingTypeId
              );
            this.form
              .get("services")
              .patchValue(
                !this.bookId ? [] : this.bookingDetails.bookingServicesIds
              );
            this.form
              .get("discount")
              .patchValue(
                !this.bookId ? 0 : this.bookingDetails.bookingDiscountId
              );
          }, 0);

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
            if (discount) {
              this.bookingDiscountPrice = discount.isPercent
                ? ((this.bookingTypePrice + this.bookingServicesPrice) *
                    discount.price) /
                  100
                : discount.price;
            }
            if (this.bookingDetails.isCanceled) {
              this.form.controls["date"].disable();
              this.form.controls["time"].disable();
              this.form.controls["type"].disable();
              this.form.controls["services"].disable();
              this.form.controls["discount"].disable();
              this.form.controls["paid"].disable();
            }
          } else {
            // =====> set next availabel time:
            this.bookingSetting.doctorAllBookingSameDay.forEach((booking) => {
              if (
                this.dateTimeService.isTimesEqual(
                  new Date(this.form.value.time),
                  new Date(booking.time)
                ) &&
                booking.bookId != this.bookId
              ) {
                const nextAvailTime = new Date(
                  new Date(booking.time).getTime() +
                    this.bookingSetting.clinicBookingPeriod * 60000
                );
                this.form.patchValue({ time: nextAvailTime });
              }
            });

            // =====> check if same patient has booking in same day:
            this.isHasBookingSameDay = this.bookingSetting.doctorAllBookingSameDay.find(
              (b) => b.patientId == this.patientId
            );
            if (this.isHasBookingSameDay) {
              this.existSwal.fire();
            }
          }
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
  ngOnDestroy() {
    this.getBookSubs.unsubscribe();
    if (this.getChangeDateSubs) this.getChangeDateSubs.unsubscribe();
    if (this.newBookSubs) this.newBookSubs.unsubscribe();
    if (this.editBookSubs) this.editBookSubs.unsubscribe();
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChangeBookingDate(date) {
    if (!this.formLoading) {
      this.formLoading = true;
      this.getChangeDateSubs = this.bookingService
        .getBookingChangeDate(
          this.patientId,
          this.dateTimeService.dateWithoutTime(date)
        )
        .subscribe(
          (res: BookingChangeDate) => {
            this.bookingSetting.clinicDayTimeFrom = new Date(
              res.clinicDayTimeFrom
            );
            this.bookingSetting.clinicDayTimeTo = new Date(res.clinicDayTimeTo);
            this.bookingSetting.doctorAllBookingSameDay =
              res.doctorAllBookingSameDay;

            // =====> if update booking for first load data:
            if (
              this.bookId &&
              this.dateTimeService.isDatesEqual(
                date,
                new Date(this.bookingDetails.bookingDateTime)
              )
            ) {
              const bookingTime = new Date(
                2020,
                0,
                1,
                new Date(this.bookingDetails.bookingDateTime).getHours(),
                new Date(this.bookingDetails.bookingDateTime).getMinutes(),
                0
              );
              this.form.patchValue({ time: bookingTime });
            } else {
              this.form.patchValue({ time: res.clinicDayTimeFrom });
              // =====> set next availabel time:
              res.doctorAllBookingSameDay.forEach((booking) => {
                if (
                  this.dateTimeService.isTimesEqual(
                    new Date(this.form.value.time),
                    new Date(booking.time)
                  ) &&
                  booking.bookId != this.bookId
                ) {
                  const nextAvailTime = new Date(
                    new Date(booking.time).getTime() +
                      this.bookingSetting.clinicBookingPeriod * 60000
                  );
                  this.form.patchValue({ time: nextAvailTime });
                }
              });
            }

            // =====> check if same patient has booking in same day:
            if (
              !this.bookId ||
              !this.dateTimeService.isDatesEqual(
                date,
                new Date(this.bookingDetails.bookingDateTime)
              )
            ) {
              this.isHasBookingSameDay = res.doctorAllBookingSameDay.find(
                (b) => b.patientId == this.patientId
              );
              if (this.isHasBookingSameDay) {
                this.existSwal.fire();
              }
            }

            // =====> disable edit date or time if patient enter:
            if (this.bookId && this.bookingDetails.isEnter) {
              this.form.controls["date"].disable();
              this.form.controls["time"].disable();
            }
            this.form.get("date").clearValidators();
            this.form.get("date").updateValueAndValidity();
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

  // =====> check if choosen booking time is already taken in same date:
  onChangeBookingTime(event) {
    if (!this.formLoading) {
      this.bookingSetting.doctorAllBookingSameDay.every((booking, i) => {
        if (
          this.dateTimeService.isTimesEqual(event, new Date(booking.time)) &&
          booking.bookId != this.bookId
        ) {
          this.form.get("time").setErrors({ duplicateTime: true });
          return false;
        } else {
          this.form.get("time").setErrors(null);
          const currentBook = this.bookingSetting.doctorAllBookingSameDay.find(
            (b) => b.bookId == this.bookId
          );
          if (currentBook) {
            currentBook.time = event;
          }
          return true;
        }
      });
      this.bookingSetting.doctorAllBookingSameDay.sort(
        (a, b) => new Date(a.time).getTime() - new Date(b.time).getTime()
      );
    }
  }

  onChangeType(typeId) {
    //this.form.patchValue({ paid: 0 });
    const type = this.bookingSetting.clinicBookingTypes.find(
      (t) => t.id == typeId
    ).type;

    // =====> check expired date for consult:
    if (type == "استشارة" && this.bookingSetting.patientLastBookingDate) {
      const daysFromLastDiagnose = this.dateTimeService.subtractDays(
        this.bookingSetting.patientLastBookingDate,
        this.form.value.date
      );
      if (daysFromLastDiagnose > this.bookingSetting.clinicConsultExpiration) {
        this.expiredSwal.fire();
        /* this.form.get("type").patchValue(this.bookingSetting.clinicBookingTypes[0].id); */
      }
    }

    // =====> if type is "Just Service" make service control is required:
    if (type == "خدمة فقط") {
      this.form.get("services").setValidators(Validators.required);
      this.form.get("services").updateValueAndValidity();
    } else {
      this.form.get("services").clearValidators();
      this.form.get("services").updateValueAndValidity();
    }
    // =====> add chosen type price to total price:
    this.bookingTypePrice = this.bookingSetting.clinicBookingTypes.find(
      (t) => t.id == this.form.value.type
    ).price;
  }

  onChangeService(services: number[]) {
    // =====> add chosen services price to total price:
    this.bookingServicesPrice = this.bookingSetting.clinicBookingServices
      .filter((s) => services.some((i) => i == s.id))
      .reduce((acc, service) => acc + service.price, 0);
  }

  // =====> add chosen discount price to total price:
  onChangeDiscount(discountId) {
    const discount = this.bookingSetting.clinicBookingDiscounts.find(
      (t) => t.id == discountId
    );
    this.bookingDiscountPrice = discount.isPercent
      ? ((this.bookingTypePrice + this.bookingServicesPrice) * discount.price) /
        100
      : discount.price;
  }

  // =====> on submit new booking:
  onAddBooking() {
    this.formLoading = true;
    // =====> if new booking:
    if (!this.bookId) {
      this.addNewBooking();
    }
    // =====> if update booking:
    else {
      this.updateBooking();
    }
  }
  addNewBooking() {
    const newBooking: BookingNew = {
      patientId: this.patientId,
      doctorId: this.authService.doctorId,
      bookingDateTime: this.dateTimeService.mergDateTime(
        new Date(this.form.value.date),
        new Date(this.form.value.time)
      ),
      typeId: this.form.value.type,
      servicesIds: this.form.value.services,
      discountId: this.form.value.discount,
      paid: this.form.value.paid,
      prevBookingsDues: this.prevBookingsDues,
    };
    this.newBookSubs = this.bookingService.addNewBooking(newBooking).subscribe(
      () => {
        const currentRoute = this.router.url;
        this.doneSwal.fire();
        this.formLoading = false;
        this.dialogRef.close();
        this.router
          .navigateByUrl("/pages", { skipLocationChange: true })
          .then(() => this.router.navigate([currentRoute]));
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  updateBooking() {
    const editedBooking: BookingEdit = {
      bookingId: this.bookId,
      doctorId: this.authService.doctorId,
      bookingDateTime: this.dateTimeService.mergDateTime(
        this.bookingDetails.isEnter
          ? new Date(this.bookingDetails.bookingDateTime)
          : new Date(this.form.value.date),
        this.bookingDetails.isEnter
          ? new Date(this.bookingDetails.bookingDateTime)
          : new Date(this.form.value.time)
      ),
      typeId: this.form.value.type,
      servicesIds: this.form.value.services,
      discountId: this.form.value.discount,
      paid: this.form.value.paid,
      prevBookingsDues: this.prevBookingsDues,
    };
    this.editBookSubs = this.bookingService
      .updateBooking(editedBooking)
      .subscribe(
        () => {
          const currentRoute = this.router.url;
          this.doneSwal.fire();
          this.formLoading = false;
          this.dialogRef.close();
          this.router
            .navigateByUrl("/pages", { skipLocationChange: true })
            .then(() => this.router.navigate([currentRoute]));
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
