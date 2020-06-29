import { Component, OnInit } from "@angular/core";

import { AuthService } from "./../../../auth/auth.service";
import { LanggService } from "../../../shared/services/langg.service";
import { UserRole } from "../../../auth/auth.model";

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

  constructor(
    private authService: AuthService,
    private langgService: LanggService
  ) {}

  ngOnInit() {
    // =====> create tabs based on user role:
    if (this.authService.roleName == UserRole.employee) {
      this.incomeTabs = [
        {
          title: this.langgService.translateWord("Daily Income"),
          route: ".",
        },
      ];
    } else {
      this.incomeTabs = [
        {
          title: this.langgService.translateWord("Daily Income"),
          route: ".",
        },
        {
          title: this.langgService.translateWord("Monthly Income"),
          route: "./monthly",
        },
      ];
    }
  }
}
