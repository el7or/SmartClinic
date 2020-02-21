import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { SettingsService } from "../../settings.service";
import { Disease } from '../../settings.model';

@Component({
  selector: "diseases-setting",
  templateUrl: "./diseases-setting.component.html",
  styleUrls: ["./diseases-setting.component.scss"]
})
export class DiseasesSettingComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  diseasesList: Disease[];

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.diseasesList = this.settingService.getDiseasesSetting();
  }

  onSaveSetting(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveDiseasesSetting(this.diseasesList);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
