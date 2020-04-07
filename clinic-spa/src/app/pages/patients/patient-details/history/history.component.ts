import { PatientHistory } from './history.model';
import { HistoryService } from './history.service';
import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { Location } from '@angular/common';

@Component({
  selector: 'history',
  templateUrl: './history.component.html',
  styleUrls: ['./history.component.scss']
})
export class HistoryComponent implements OnInit {
  formLoading:boolean = false;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  patientHistory:PatientHistory;

  constructor(private historyService:HistoryService ,public location:Location) { }

  ngOnInit() {
    this.patientHistory = this.historyService.getPatientHistory();
  }

  onSubmit(){
    this.formLoading = true;
    this.historyService.setPatientHistory(this.patientHistory);
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
