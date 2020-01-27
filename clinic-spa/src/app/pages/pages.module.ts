import { ChatComponent } from './chat/chat.component';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { NbMenuModule, NbAlertModule, NbCardModule, NbLayoutModule, NbSidebarModule, NbChatModule, NbListModule, NbUserModule, NbSpinnerModule } from '@nebular/theme';
import { FullCalendarModule } from '@fullcalendar/angular';

import { SharedModule } from './../shared/shared.module';
import { PagesComponent } from './pages.component';
import { DashboardModule } from './dashboard/dashboard.module';
import { ECommerceModule } from './e-commerce/e-commerce.module';
import { PagesRoutingModule } from './pages-routing.module';
import { MiscellaneousModule } from './miscellaneous/miscellaneous.module';
import { HomeComponent } from './home/home.component';

const COMPONENTS = [
  PagesComponent,
    HomeComponent,
    ChatComponent
];

const MODULES = [
  PagesRoutingModule,
    SharedModule,
    NbMenuModule,
    DashboardModule,
    ECommerceModule,
    MiscellaneousModule,
    NbAlertModule,
    FormsModule,
    FullCalendarModule,
    NbCardModule,
    NbLayoutModule,
    NbSidebarModule,
    NbChatModule,
    NbListModule,
    NbUserModule,
    NbSpinnerModule
];

@NgModule({
  imports: [
    ...MODULES
  ],
  declarations: [
    ...COMPONENTS
  ],
})
export class PagesModule {
}
