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
import { NewPatientComponent } from "./new-patient/new-patient.component";
import { SharedModule } from "./../../shared/shared.module";
import { SearchPatientComponent } from "./search-patient/search-patient.component";
import { BookingsModule } from './../bookings/bookings.module';

@NgModule({
  declarations: [
    PatientsComponent,
    NewPatientComponent,
    SearchPatientComponent
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
    NbDialogModule.forRoot(),
    SweetAlert2Module.forRoot(),
    PaginationModule.forRoot()
  ]
})
export class PatientsModule {}
