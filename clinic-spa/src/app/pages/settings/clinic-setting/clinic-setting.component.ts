import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { SettingsService } from "./../settings.service";

@Component({
  selector: "clinic-setting",
  templateUrl: "./clinic-setting.component.html",
  styleUrls: ["./clinic-setting.component.scss"]
})
export class ClinicSettingComponent implements OnInit {
  formLoading: boolean = false;
  form: FormGroup;
  bookingTimeFromData:Date;
  bookingTimeToData:Date;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    // =====> create reactive form:
    this.createForm();
  }

  createForm(){
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
      diagnose: new FormControl(null, {
        validators: [Validators.required, Validators.min(0)]
      }),
      isDiagnose: new FormControl(null),
      consult: new FormControl(null, {
        validators: [Validators.required, Validators.min(0)]
      }),
      isConsult: new FormControl(null),
      urgentDiagnos: new FormControl(null, {
        validators: [Validators.required, Validators.min(0)]
      }),
      isUrgentDiagnos: new FormControl(null),
      xRay: new FormControl(null, {
        validators: [Validators.required,Validators.min(0)]
      }),
      isXRay: new FormControl(null),
      analsis: new FormControl(null, {
        validators: [Validators.required,Validators.min(0)]
      }),
      isAnalsis: new FormControl(null),
      sonar: new FormControl(null, {
        validators: [Validators.required,Validators.min(0)]
      }),
      isSonar: new FormControl(null),
      laserSession: new FormControl(null, {
        validators: [Validators.required,Validators.min(0)]
      }),
      isLaserSession: new FormControl(null),
    });
    this.form.setValue({
      workdays: this.settingService.workdays,
      sortBookings: "manual",
      bookingTimeFrom:this.settingService.bookingTimeFrom,
      bookingTimeTo:this.settingService.bookingTimeTo,
      diagnose: 0,
      isDiagnose: true,
      consult: 0,
      isConsult: true,
      urgentDiagnos: 0,
      isUrgentDiagnos: true,
      xRay: 0,
      isXRay: true,
      analsis: 0,
      isAnalsis: true,
      sonar: 0,
      isSonar: true,
      laserSession: 0,
      isLaserSession: true,
    });
  }

  onSaveSetting() {
    this.formLoading = true;
    setTimeout(() => {
    this.settingService.saveClinicSetting(
      this.form.value.workdays,
      this.form.value.sortBookings,
      this.form.value.bookingTimeFrom,
      this.form.value.bookingTimeTo
    );
    this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
