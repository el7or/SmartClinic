import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { FormGroup, FormControl, Validators } from "@angular/forms";
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { SettingsService } from "./../settings.service";

@Component({
  selector: "clinic-setting",
  templateUrl: "./clinic-setting.component.html",
  styleUrls: ["./clinic-setting.component.scss"]
})
export class ClinicSettingComponent implements OnInit {
  formLoading: boolean = false;
  form: FormGroup;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    // =====> create reactive form:
    this.form = new FormGroup({
      workdays: new FormControl(null, {
        validators: [Validators.required]
      }),
      sortBookings: new FormControl(null, {
        validators: [Validators.required]
      })
    });
    this.form.setValue({
      workdays: this.settingService.workdays,
      sortBookings: 'manual'
    })
  }

  onSaveSetting() {
    this.settingService.saveSetting(this.form.value.workdays,this.form.value.sortBookings);
    this.doneSwal.fire();
  }
}
