import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";

import { Question } from "../../../settings/settings.model";
import { SettingsService } from "../../../settings/settings.service";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "questions",
  templateUrl: "./questions.component.html",
  styleUrls: ["./questions.component.scss"]
})
export class QuestionsComponent implements OnInit {
  formLoading = false;
  questionsList: Question[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.questionsList = this.settingService.getQuestionSetting();
  }

  onSubmitQuest(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
