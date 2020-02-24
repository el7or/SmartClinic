import { Component, OnInit, ViewChild } from '@angular/core';
import { Location } from '@angular/common';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

@Component({
  selector: 'examination',
  templateUrl: './examination.component.html',
  styleUrls: ['./examination.component.scss']
})
export class ExaminationComponent implements OnInit {
  formLoading:boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diseaseSummary: string="ضغط - سكر - حمل";
  complaintSummary:string="صداع - آلام الركبة";

  examinations: any[] = [{ name: "", isNameValid: true, note: "" }];
  examinationsNames: string[] = ["تورم بالجسم", "طفح جلدي"];

  constructor(public location:Location) { }

  ngOnInit() {
  }

  onAddNewItemToList(complaintName) {
    this.examinationsNames.push(complaintName);
  }

  // =====> on add new request to form from button:
  onAddExamination() {
    this.examinations.push({
      name: "",
      isNameValid: true,
      period: ""
    });
  }

  // =====> on remove row from requests:
  onRemoveExamination(index) {
    this.examinations.splice(index, 1);
  }

  onDeleteExamination(){
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

}
