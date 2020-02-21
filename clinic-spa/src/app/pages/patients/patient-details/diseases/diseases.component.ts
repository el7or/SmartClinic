import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";

import { Disease } from "../../../settings/settings.model";
import { SettingsService } from "../../../settings/settings.service";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "diseases",
  templateUrl: "./diseases.component.html",
  styleUrls: ["./diseases.component.scss"]
})
export class DiseasesComponent implements OnInit {
  formLoading = false;
  questionsList: Disease[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.questionsList = this.settingService.getDiseasesSetting();
  }

  onSubmitQuest(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
