import { Component, OnInit, ViewChild } from "@angular/core";
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { SettingsService } from "../../settings.service";
import { BookingSetting } from '../../settings.model';

@Component({
  selector: "booking-setting",
  templateUrl: "./booking-setting.component.html",
  styleUrls: ["./booking-setting.component.scss"]
})
export class BookingSettingComponent implements OnInit {
  formLoading: boolean = false;
  form: FormGroup;
  bookingSetting:BookingSetting;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    // =====> get current booking setting:
    this.bookingSetting = this.settingService.getBookingSetting();

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
      bookingPeriod: new FormControl(null, {
        validators: [Validators.required]
      })
    });
    this.form.setValue({
      workdays: this.bookingSetting.workdays,
      sortBookings: this.bookingSetting.sortBookings,
      bookingTimeFrom: this.bookingSetting.bookingTimeFrom,
      bookingTimeTo: this.bookingSetting.bookingTimeTo,
      bookingPeriod: this.bookingSetting.bookingPeriod
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
