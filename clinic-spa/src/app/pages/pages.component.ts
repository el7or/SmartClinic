import { PrintService, printSections } from './../shared/services/print.service';
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
    <print-medicines [class.print-section]="isPrintMedicines"></print-medicines>
    <print-invoice [class.print-section]="isPrintInvoice"></print-invoice>
  `
})
export class PagesComponent implements OnInit, OnDestroy {
  menu = MENU_ITEMS;
  langgloading: boolean;
  langSubscription: Subscription;
  printSubscription: Subscription;
  isPrintMedicines:boolean = false;
  isPrintInvoice:boolean = false;

  constructor(private langgService: LanggService, private printService:PrintService) {}

  ngOnInit() {
    // =====> spin loader on change language from header component:
    this.langSubscription = this.langgService.langLoading.subscribe(
      langSpin => (this.langgloading = langSpin)
    );

    // =====> check if any print section is on:
    this.printService.getPrintSection().subscribe((printSection:printSections) =>{
      if(printSection== printSections.printMedicines){
        this.isPrintMedicines = true;
        this.isPrintInvoice = false;
      }
      else if(printSection== printSections.printInvoice){
        this.isPrintInvoice = true;
        this.isPrintMedicines = false;
      }
      else{
        this.isPrintInvoice = false;
        this.isPrintMedicines = false;
      }
    })
  }

  ngOnDestroy() {
    this.langSubscription.unsubscribe();
    this.printSubscription.unsubscribe();
  }
}
