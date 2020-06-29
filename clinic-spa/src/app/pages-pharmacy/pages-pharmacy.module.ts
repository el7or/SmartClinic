import { PagesPharmacyComponent } from './pages-pharmacy.component';
import { NgModule } from "@angular/core";
import { HomePharmacyComponent } from "./home-pharmacy/home-pharmacy.component";
import { NbLayoutModule, NbMenuModule, NbAlertModule, NbCardModule, NbSidebarModule, NbChatModule, NbListModule, NbUserModule, NbSpinnerModule, NbButtonModule, NbTooltipModule, NbIconModule, NbToastrModule } from "@nebular/theme";
import { SharedModule } from '../shared/shared.module';
import { PatientsModule } from '../pages/patients/patients.module';
import { BookingsModule } from '../pages/bookings/bookings.module';
import { SettingsModule } from '../pages/settings/settings.module';
import { AccountingModule } from '../pages/accounting/accounting.module';
import { ContactModule } from '../pages/contact/contact.module';
import { FormsModule } from '@angular/forms';
import { FullCalendarModule } from '@fullcalendar/angular';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { PagesPharmacyRoutingModule } from './pages-pharmacy-routing.module';

const MODULES = [
  PagesPharmacyRoutingModule,
  SharedModule,
  PatientsModule,
  BookingsModule,
  SettingsModule,
  AccountingModule,
  ContactModule,
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
  declarations: [PagesPharmacyComponent, HomePharmacyComponent],
  imports: [...MODULES],
})
export class PagesPharmacyModule {}
