import { Subscription } from "rxjs";
import { OnInit, OnDestroy } from "@angular/core";
import { Component } from "@angular/core";

import { MENU_ITEMS } from "./pages-menu";
import { LanggService } from "../shared/services/langg.service";

@Component({
  selector: "ngx-pages",
  styleUrls: ["pages.component.scss"],
  template: `
    <nb-layout windowMode [nbSpinner]="langgloading" nbSpinnerStatus="info">
      <nb-layout-header fixed>
        <ngx-header></ngx-header>
      </nb-layout-header>

      <nb-sidebar
        start
        class="menu-sidebar"
        tag="menu-sidebar"
        responsive="true"
        [compactedBreakpoints]="['xs', 'is', 'sm', 'md']"
        [collapsedBreakpoints]="['xs', 'is']"
      >
        <nb-menu [items]="menu"></nb-menu>
      </nb-sidebar>

      <nb-layout-column>
        <router-outlet></router-outlet>
      </nb-layout-column>

      <nb-layout-footer fixed id="footer">
        <ngx-footer></ngx-footer>
      </nb-layout-footer>
    </nb-layout>
  `
})
export class PagesComponent implements OnInit, OnDestroy {
  menu = MENU_ITEMS;
  langgloading: boolean;
  langSubscription: Subscription;

  constructor(private langgService: LanggService) {}

  ngOnInit() {
    // =====> spin loader on change language from header component:
    this.langSubscription = this.langgService.langLoading.subscribe(
      langSpin => (this.langgloading = langSpin)
    );
  }

  ngOnDestroy() {
    this.langSubscription.unsubscribe();
  }
}
