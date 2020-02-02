import { LanggService } from './../../shared/services/langg.service';
import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'patients',
  templateUrl: './patients.component.html',
  styleUrls: ['./patients.component.scss']
})
export class PatientsComponent implements OnInit {
  tabs: any[] = [
    {
      title: 'Patients Search',
      route: '/pages/patients/search',
      icon:'search-outline',
    },
    {
      title: 'Add New Patient',
      route: '/pages/patients/new',
      icon:'person-add-outline'
    },
  ];

  constructor(private langgService:LanggService) { }

  ngOnInit() {
    // =====> translate tabs titles:
    this.tabs.forEach(element => {
      element.title = this.langgService.translateWord(element.title);
      if (element.children != null) {
        element.children.forEach(el => {
          el.title = this.langgService.translateWord(el.title);
        });
      }
    });
  }

}
