import { Component, OnInit } from '@angular/core';
import { Location } from '@angular/common';

@Component({
  selector: 'patient-details',
  templateUrl: './patient-details.component.html',
  styleUrls: ['./patient-details.component.scss']
})
export class PatientDetailsComponent implements OnInit {
  tabs: any[] = [
    {
      title: 'المعلومات الأساسية',
      route: '/pages/patient-detail/1',
      icon:'search-outline',
    },
    {
      title: 'الأمراض المصاحبة',
      route: '/pages/patient-detail/2',
      icon:'person-add-outline'
    },
    {
      title: 'الأشعة والتحاليل',
      route: '/pages/patient-detail/3',
      icon:'person-add-outline'
    },
    {
      title: 'تقرير الزيارات',
      route: '/pages/patient-detail/4',
      icon:'person-add-outline'
    },
  ];

  constructor(protected location:Location) { }

  ngOnInit() {
  }

}
