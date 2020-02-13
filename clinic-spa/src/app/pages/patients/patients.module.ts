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
  NbDialogModule,
  NbListModule
} from "@nebular/theme";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";
import { PaginationModule, BsDatepickerModule } from "ngx-bootstrap";

import { PatientsComponent } from "./patients.component";
import { SharedModule } from "./../../shared/shared.module";
import { PatientsListComponent } from "./patients-list/patients-list.component";
import { BookingsModule } from './../bookings/bookings.module';
import { PatientDetailsComponent } from './patient-details/patient-details.component';
import { InfoDetailComponent } from './patient-details/info-detail/info-detail.component';
import { QuestionsComponent } from './patient-details/questions/questions.component';
import { MedicinesComponent } from './patient-details/medicines/medicines.component';
import { MedicinesSummaryComponent } from './patient-details/medicines/medicines-summary/medicines-summary.component';

@NgModule({
  declarations: [
    PatientsComponent,
    PatientsListComponent,
    PatientDetailsComponent,
    InfoDetailComponent,
    QuestionsComponent,
    MedicinesComponent,
    MedicinesSummaryComponent,
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
    NbListModule,
    NbDialogModule.forChild(),
    BsDatepickerModule.forRoot(),
    SweetAlert2Module.forRoot(),
    PaginationModule.forRoot()
  ],
  entryComponents:[MedicinesSummaryComponent]
})
export class PatientsModule {}
