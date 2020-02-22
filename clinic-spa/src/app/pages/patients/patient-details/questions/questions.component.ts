import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';

@Component({
  selector: 'questions',
  templateUrl: './questions.component.html',
  styleUrls: ['./questions.component.scss']
})
export class QuestionsComponent implements OnInit {
  formLoading:boolean = false;
  diseaseSummary: string="ضغط - سكر - حمل";
  complaintSummary:string="صداع - آلام الركبة";

  constructor(public location:Location) { }

  ngOnInit() {
  }

}
