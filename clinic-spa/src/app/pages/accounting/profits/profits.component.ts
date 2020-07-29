import { Component, OnInit } from "@angular/core";
import { LanggService } from '../../../shared/services/langg.service';

@Component({
  selector: "profits",
  template: `
    <nb-card>
      <nb-card-header> <span langg>Profits</span>: </nb-card-header>
      <nb-card-body>
        <nb-route-tabset [tabs]="profitTabs"></nb-route-tabset>
      </nb-card-body>
    </nb-card>
  `,
  styleUrls: ["./profits.component.scss"],
})
export class ProfitsComponent implements OnInit {
  profitTabs: any[];

  constructor(
    private langgService: LanggService
  ) {}

  ngOnInit() {
    this.profitTabs = [
      {
        title: this.langgService.translateWord("Daily Profit"),
        route: ".",
      },
      {
        title: this.langgService.translateWord("Monthly Profit"),
        route: "./monthly",
      },
    ];
  }
}
