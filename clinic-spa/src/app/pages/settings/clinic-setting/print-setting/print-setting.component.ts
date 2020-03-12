import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { PrintInfo } from '../../settings.model';
import { SettingsService } from "../../settings.service";

@Component({
  selector: "print-setting",
  templateUrl: "./print-setting.component.html",
  styleUrls: ["./print-setting.component.scss"]
})
export class PrintSettingComponent implements OnInit {
  formLoading: boolean = false;
  printInfoSetting: PrintInfo;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingsService: SettingsService
  ) {}

  ngOnInit() {
    this.printInfoSetting = this.settingsService.printInfo;
  }

  onSubmit(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
    this.settingsService.printInfo = this.printInfoSetting;
    this.formLoading = false;
    this.doneSwal.fire();
    }, 1000);
  }
}
