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

  constructor(private route: ActivatedRoute, protected location:Location) { }

  ngOnInit() {
    this.route.paramMap.subscribe(paramMap => {
      const patientId = paramMap.get('id');
      if (patientId=='new') {
        this.isNewPatient = true;
      }
      else{
        this.isNewPatient = false;
      }
      /* if (!paramMap.has('id')) {
        this.location.back();
        console.log('back');
        return;
      } */
    });
  }

}
