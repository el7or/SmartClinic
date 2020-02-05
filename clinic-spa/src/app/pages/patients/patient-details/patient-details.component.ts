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

  constructor(private route: ActivatedRoute, protected location:Location) { }

  ngOnInit() {
    // =====> check if new patient or details of old patient:
    this.route.paramMap.subscribe(paramMap => {
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
      /* if (!paramMap.has('id')) {
        this.location.back();
        console.log('back');
        return;
      } */
    });
  }

}
