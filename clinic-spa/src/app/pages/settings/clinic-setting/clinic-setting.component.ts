import { Component, OnInit } from "@angular/core";

import { LanggService } from '../../../shared/services/langg.service';

@Component({
  selector: "clinic-setting",
  template: `
  <nb-card>
  <nb-card-header>
    <span langg>Doctor Setting</span>:
  </nb-card-header>
  <nb-card-body>
    <!-- <nb-tabset>
      <nb-tab [tabTitle]="'Bookings' | langg">
        <booking-setting></booking-setting>
      </nb-tab>
      <nb-tab [tabTitle]="'Prices' | langg">
        <prices-setting></prices-setting>
      </nb-tab>
      <nb-tab [tabTitle]="'Print Data' | langg">
        <print-setting></print-setting>
      </nb-tab>
    </nb-tabset> -->
    <nb-route-tabset [tabs]="clinicSettingTabs"></nb-route-tabset>
  </nb-card-body>
</nb-card>
  `,
  styleUrls: ["./clinic-setting.component.scss"]
})
export class ClinicSettingComponent implements OnInit {
  clinicSettingTabs:any[];

  constructor(private langgService: LanggService) {}

  ngOnInit() {
    this.clinicSettingTabs = [
      {
        title: this.langgService.translateWord("Bookings"),
        route: ".",
      },
      {
        title: this.langgService.translateWord("Prices"),
        route: "./prices",
      },
      {
        title: this.langgService.translateWord("Print Data"),
        route: "./print",
      },
    ];
  }
}
