import { Component, OnInit } from '@angular/core';
import { LanggService } from '../../../shared/services/langg.service';

@Component({
  selector: 'patient-setting',
  template: `
  <nb-card>
  <nb-card-header>
    <span langg>Patient Profile Setting</span>:
  </nb-card-header>
  <nb-card-body>
    <nb-route-tabset [tabs]="patientSettingTabs"></nb-route-tabset>
  </nb-card-body>
</nb-card>
  `,
  styleUrls: ['./patient-setting.component.scss']
})
export class PatientSettingComponent implements OnInit {
  patientSettingTabs:any[];

  constructor(private langgService: LanggService) { }

  ngOnInit() {
    this.patientSettingTabs = [
      {
        title: this.langgService.translateWord("Associated Diseases"),
        route: ".",
      },
      {
        title: this.langgService.translateWord("Patient Record"),
        route: "./records",
      },
      {
        title: this.langgService.translateWord("Patient Record Items"),
        route: "./items",
      },
      {
        title: this.langgService.translateWord("Medicines"),
        route: "./medicines",
      }
    ];
  }

}
