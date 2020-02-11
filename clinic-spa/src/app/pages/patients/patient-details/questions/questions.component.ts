import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';

@Component({
  selector: 'questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent implements OnInit {
  formLoading = false;

  constructor(public location:Location) { }

  ngOnInit() {
  }

  onSubmitQuest(){

  }

}
