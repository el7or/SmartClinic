import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';

@Component({
  selector: 'patient-details',
  templateUrl: './patient-details.component.html',
  styleUrls: ['./patient-details.component.scss']
})
export class PatientDetailsComponent implements OnInit {
  isNewPatient = false;
  pageHeader:string;
  patientName:string;
  tabNumber:number = 1;

  constructor(private route: ActivatedRoute, public location:Location) { }

  ngOnInit() {
    this.route.paramMap.subscribe(paramMap => {
    // =====> check if new patient or details of old patient:
      const patientId = paramMap.get('id');
      if (patientId=='new') {
        this.isNewPatient = true;
        this.pageHeader = 'Add New Patient';
        this.patientName = '';
      }
      else{
        this.isNewPatient = false;
        this.pageHeader = 'Patient Profile';
        this.patientName = "أحمد محمد علي";
      }

      // =====> check query param for tab:
       this.tabNumber = +this.route.snapshot.queryParamMap.get('tab');
    });
  }

}
