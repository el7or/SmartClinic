import { NgForm } from '@angular/forms';
import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';

import { Question } from '../../../settings/settings.model';
import { SettingsService } from '../../../settings/settings.service';

@Component({
  selector: 'questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent implements OnInit {
  formLoading = false;
  questionsList: Question[];

  constructor(public location:Location,private settingService: SettingsService) { }

  ngOnInit() {
    this.questionsList = this.settingService.getQuestionSetting();
  }

  onSubmitQuest(form:NgForm){
console.log(form);
  }

}
