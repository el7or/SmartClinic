import { SettingsService } from './../settings.service';
import { Component, OnInit } from "@angular/core";
import { Location } from '@angular/common';
import { FormGroup, FormControl, Validators } from '@angular/forms';

@Component({
  selector: "clinic-setting",
  templateUrl: "./clinic-setting.component.html",
  styleUrls: ["./clinic-setting.component.scss"]
})
export class ClinicSettingComponent implements OnInit {
  formLoading: boolean = false;
  form: FormGroup;

  constructor(public location:Location, private settingService:SettingsService) {}

  ngOnInit() {
    this.form = new FormGroup({
      workdays: new FormControl(null, {
        validators: [Validators.required]
      })
    });
  }

  onSaveSetting(){
    this.settingService.saveSetting(this.form.value.workdays);
    this.location.back();
  }
}
