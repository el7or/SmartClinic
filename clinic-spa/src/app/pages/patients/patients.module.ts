import { RouterModule } from "@angular/router";
import { FormsModule } from "@angular/forms";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import {
  NbAccordionModule,
  NbTabsetModule,
  NbCardModule,
  NbInputModule,
  NbButtonModule,
  NbRadioModule,
  NbSelectModule,
  NbSpinnerModule,
  NbRouteTabsetModule,
  NbIconModule,
  NbTooltipModule,
  NbDialogModule
} from "@nebular/theme";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";
import { PaginationModule } from "ngx-bootstrap";

import { PatientsComponent } from "./patients.component";
import { SharedModule } from "./../../shared/shared.module";
import { PatientsListComponent } from "./patients-list/patients-list.component";
import { BookingsModule } from './../bookings/bookings.module';
import { PatientDetailsComponent } from './patient-details/patient-details.component';
import { InfoDetailComponent } from './patient-details/info-detail/info-detail.component';

@NgModule({
  declarations: [
    PatientsComponent,
    PatientsListComponent,
    PatientDetailsComponent,
    InfoDetailComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    BookingsModule,
    NbAccordionModule,
    NbTabsetModule,
    NbRouteTabsetModule,
    NbCardModule,
    NbInputModule,
    NbButtonModule,
    NbRadioModule,
    NbSelectModule,
    NbSpinnerModule,
    NbIconModule,
    NbTooltipModule,
    NbDialogModule.forChild(),
    SweetAlert2Module.forRoot(),
    PaginationModule.forRoot()
  ]
})
export class PatientsModule {}
