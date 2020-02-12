import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { SettingsService } from "../../settings.service";
import { Question } from '../../settings.model';

@Component({
  selector: "questions-setting",
  templateUrl: "./questions-setting.component.html",
  styleUrls: ["./questions-setting.component.scss"]
})
export class QuestionsSettingComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  questionsList: Question[];

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.questionsList = this.settingService.getQuestionSetting();
  }

  onSaveSetting(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveQuestionSetting(this.questionsList);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
