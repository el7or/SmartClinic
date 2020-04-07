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
  NbListModule,
  NbAlertModule
} from "@nebular/theme";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";
import { PaginationModule, BsDatepickerModule, TypeaheadModule } from "ngx-bootstrap";
import { FileUploadModule } from 'ng2-file-upload';

import { PatientsComponent } from "./patients.component";
import { SharedModule } from "./../../shared/shared.module";
import { PatientsListComponent } from "./patients-list/patients-list.component";
import { BookingsModule } from './../bookings/bookings.module';
import { PatientDetailsComponent } from './patient-details/patient-details.component';
import { BasicInfoComponent } from './patient-details/basic-info/basic-info.component';
import { DiseasesComponent } from './patient-details/diseases/diseases.component';
import { MedicinesComponent } from './patient-details/medicines/medicines.component';
import { MedicinesSummaryComponent } from './patient-details/medicines/medicines-summary/medicines-summary.component';
import { HistoryComponent } from './patient-details/history/history.component';
import { XRaysComponent } from './patient-details/x-rays/x-rays.component';
import { AnalysisComponent } from './patient-details/analysis/analysis.component';
import { RequestsComponent } from './patient-details/requests/requests.component';
import { XRayDetailComponent } from './patient-details/x-rays/x-ray-detail/x-ray-detail.component';
import { AnalysisDetailComponent } from './patient-details/analysis/analysis-detail/analysis-detail.component';
import { PatientRecordComponent } from './patient-details/patient-record/patient-record.component';
import { ReferralsComponent } from './patient-details/referrals/referrals.component';
import { OperationsComponent } from './patient-details/operations/operations.component';
import { ComplaintsComponent } from './patient-details/complaints/complaints.component';
import { ExaminationComponent } from './patient-details/examination/examination.component';
import { DiagnosisComponent } from './patient-details/diagnosis/diagnosis.component';
import { VisitsComponent } from './patient-details/visits/visits.component';

@NgModule({
  declarations: [
    PatientsComponent,
    PatientsListComponent,
    PatientDetailsComponent,
    BasicInfoComponent,
    DiseasesComponent,
    MedicinesComponent,
    MedicinesSummaryComponent,
    HistoryComponent,
    XRaysComponent,
    AnalysisComponent,
    RequestsComponent,
    XRayDetailComponent,
    AnalysisDetailComponent,
    PatientRecordComponent,
    ReferralsComponent,
    OperationsComponent,
    ComplaintsComponent,
    ExaminationComponent,
    DiagnosisComponent,
    VisitsComponent,
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
    FileUploadModule,
    NbAlertModule,
    NbDialogModule.forChild(),
    TypeaheadModule.forRoot(),
    BsDatepickerModule.forRoot(),
    SweetAlert2Module.forRoot(),
    PaginationModule.forRoot()
  ],
  entryComponents:[MedicinesSummaryComponent,XRayDetailComponent,AnalysisDetailComponent]
})
export class PatientsModule {}
