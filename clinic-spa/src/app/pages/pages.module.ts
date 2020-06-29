import { AccountingModule } from "./accounting/accounting.module";
import { FormsModule } from "@angular/forms";
import { NgModule } from "@angular/core";
import {
  NbMenuModule,
  NbAlertModule,
  NbCardModule,
  NbLayoutModule,
  NbSidebarModule,
  NbChatModule,
  NbListModule,
  NbUserModule,
  NbSpinnerModule,
  NbButtonModule,
  NbTooltipModule,
  NbIconModule,
  NbToastrModule,
} from "@nebular/theme";
import { FullCalendarModule } from "@fullcalendar/angular";

import { BookingsModule } from "./bookings/bookings.module";
import { SettingsModule } from "./settings/settings.module";
import { PatientsModule } from "./patients/patients.module";
import { ChatComponent } from "./chat/chat.component";
import { SharedModule } from "./../shared/shared.module";
import { PagesComponent } from "./pages.component";
import { PagesRoutingModule } from "./pages-routing.module";
import { HomeComponent } from "./home/home.component";
import { ExternalsComponent } from "./externals/externals.component";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";

const COMPONENTS = [
  PagesComponent,
  HomeComponent,
  ChatComponent,
  ExternalsComponent,
];

const MODULES = [
  PagesRoutingModule,
  SharedModule,
  PatientsModule,
  BookingsModule,
  SettingsModule,
  AccountingModule,
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
  NbButtonModule,
  NbTooltipModule,
  NbIconModule,
  NbToastrModule.forRoot(),
  SweetAlert2Module.forRoot(),
];

@NgModule({
  imports: [...MODULES],
  declarations: [...COMPONENTS],
})
export class PagesModule {}
