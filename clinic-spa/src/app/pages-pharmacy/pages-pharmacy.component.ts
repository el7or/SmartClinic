import { Component, OnInit, OnDestroy } from '@angular/core';
import { MENU_ITEMS_PH } from './pages-pharmacy-menu';
import { Subscription } from 'rxjs';
import { LanggService } from '../shared/services/langg.service';

@Component({
  selector: 'pages-pharmacy',
  styleUrls: ['./pages-pharmacy.component.scss'],
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
export class PagesPharmacyComponent implements OnInit, OnDestroy {
  menu = MENU_ITEMS_PH;
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
