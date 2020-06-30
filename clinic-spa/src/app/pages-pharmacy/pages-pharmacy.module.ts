import { PagesPharmacyComponent } from './pages-pharmacy.component';
import { NgModule } from "@angular/core";
import { HomePharmacyComponent } from "./home-pharmacy/home-pharmacy.component";
import { NbLayoutModule, NbMenuModule, NbAlertModule, NbCardModule, NbSidebarModule, NbChatModule, NbListModule, NbUserModule, NbSpinnerModule, NbButtonModule, NbTooltipModule, NbIconModule, NbToastrModule } from "@nebular/theme";
import { SharedModule } from '../shared/shared.module';
import { FormsModule } from '@angular/forms';
import { FullCalendarModule } from '@fullcalendar/angular';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { PagesPharmacyRoutingModule } from './pages-pharmacy-routing.module';
import { PrevListComponent } from './prev-list/prev-list.component';
import { PrescDetailsComponent } from './presc-details/presc-details.component';

const MODULES = [
  PagesPharmacyRoutingModule,
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
  NbButtonModule,
  NbTooltipModule,
  NbIconModule,
  NbToastrModule.forRoot(),
  SweetAlert2Module.forRoot(),
];

@NgModule({
  declarations: [PagesPharmacyComponent, HomePharmacyComponent, PrevListComponent, PrescDetailsComponent],
  imports: [...MODULES],
  entryComponents:[PrescDetailsComponent]
})
export class PagesPharmacyModule {}
