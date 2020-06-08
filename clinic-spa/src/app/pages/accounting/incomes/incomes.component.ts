import { Component, OnInit } from "@angular/core";

import { LanggService } from "../../../shared/services/langg.service";

@Component({
  selector: "incomes",
  template: `
    <nb-card>
      <nb-card-header> <span langg>Incomes</span>: </nb-card-header>
      <nb-card-body>
        <nb-route-tabset [tabs]="incomeTabs"></nb-route-tabset>
      </nb-card-body>
    </nb-card>
  `,
  styleUrls: ["./incomes.component.scss"],
})
export class IncomesComponent implements OnInit {
  incomeTabs: any[];

  constructor(private langgService: LanggService) {}

  ngOnInit() {
    this.incomeTabs = [
      {
        title: this.langgService.translateWord("Daily Income"),
        route: ".",
      },
      {
        title: this.langgService.translateWord("Monthly Income"),
        route: "./monthly",
      }
    ];
  }
}
