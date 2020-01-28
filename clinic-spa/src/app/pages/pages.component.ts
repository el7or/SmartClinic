import { Component } from '@angular/core';

import { MENU_ITEMS } from './pages-menu';
import { LanggService } from '../shared/services/langg.service';

@Component({
  selector: 'ngx-pages',
  styleUrls: ['pages.component.scss'],
  template: `
  <nb-layout windowMode [nbSpinner]="langgloading" nbSpinnerStatus="info">
      <nb-layout-header fixed>
        <ngx-header></ngx-header>
      </nb-layout-header>

      <nb-sidebar start class="menu-sidebar" tag="menu-sidebar">
      <nb-menu [items]="menu"></nb-menu>
      </nb-sidebar>

      <nb-layout-column>
      <router-outlet></router-outlet>
      </nb-layout-column>

      <nb-layout-footer fixed>
        <ngx-footer></ngx-footer>
      </nb-layout-footer>
    </nb-layout>
  `,
})
export class PagesComponent {
  menu = MENU_ITEMS;
  langgloading: boolean;

  constructor(
    private langgService: LanggService
  ) {}

  ngOnInit(){
    this.langgService.langLoading.subscribe(
      langSpin => (this.langgloading = langSpin)
    );
  }
}
