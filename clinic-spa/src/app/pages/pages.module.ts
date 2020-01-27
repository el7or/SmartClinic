import { ChatComponent } from './chat/chat.component';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { NbMenuModule, NbAlertModule, NbCardModule, NbLayoutModule, NbSidebarModule, NbChatModule, NbListModule, NbUserModule, NbSpinnerModule, NbButtonModule } from '@nebular/theme';
import { FullCalendarModule } from '@fullcalendar/angular';

import { SharedModule } from './../shared/shared.module';
import { PagesComponent } from './pages.component';
import { PagesRoutingModule } from './pages-routing.module';
import { HomeComponent } from './home/home.component';
import { NotFoundComponent } from './not-found/not-found.component';

const COMPONENTS = [
  PagesComponent,
    HomeComponent,
    ChatComponent,
    NotFoundComponent
];

const MODULES = [
  PagesRoutingModule,
    SharedModule,
    NbMenuModule,
    NbAlertModule,
    FormsModule,
    FullCalendarModule,
    NbCardModule,
    NbLayoutModule,
    NbSidebarModule,
    NbChatModule,
    NbListModule,
    NbUserModule,
    NbSpinnerModule,
    NbButtonModule
];

@NgModule({
  imports: [
    ...MODULES
  ],
  declarations: [
    ...COMPONENTS,
  ],
})
export class PagesModule {
}
