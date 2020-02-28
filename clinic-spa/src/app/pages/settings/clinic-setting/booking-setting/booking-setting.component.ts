import { Component, OnInit, ViewChild } from "@angular/core";
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { SettingsService } from "../../settings.service";

@Component({
  selector: "booking-setting",
  templateUrl: "./booking-setting.component.html",
  styleUrls: ["./booking-setting.component.scss"]
})
export class BookingSettingComponent implements OnInit {
  formLoading: boolean = false;
  form: FormGroup;
  bookingTimeFromData: Date;
  bookingTimeToData: Date;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    // =====> create reactive form:
    this.createForm();
  }

  createForm() {
    this.form = new FormGroup({
      workdays: new FormControl(null, {
        validators: [Validators.required]
      }),
      sortBookings: new FormControl(null, {
        validators: [Validators.required]
      }),
      bookingTimeFrom: new FormControl(null, {
        validators: [Validators.required]
      }),
      bookingTimeTo: new FormControl(null, {
        validators: [Validators.required]
      }),
      bookPeriod: new FormControl(null, {
        validators: [Validators.required]
      })
    });
    this.form.setValue({
      workdays: this.settingService.workdays,
      sortBookings: this.settingService.sortBookingsBy,
      bookingTimeFrom: this.settingService.bookingTimeFrom,
      bookingTimeTo: this.settingService.bookingTimeTo,
      bookPeriod: this.settingService.bookingPeriod
    });
  }

  onSaveSetting() {
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveBookingSetting(this.form.value);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
