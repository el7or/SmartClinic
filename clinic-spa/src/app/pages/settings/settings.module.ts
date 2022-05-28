import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import { RouterModule } from "@angular/router";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import {
  NbCardModule,
  NbSpinnerModule,
  NbSelectModule,
  NbButtonModule,
  NbRadioModule,
  NbCheckboxModule,
  NbInputModule,
  NbToggleModule,
  NbIconModule,
  NbRouteTabsetModule,
  NbAccordionModule
} from "@nebular/theme";

import { UsersSettingComponent } from "./users-setting/users-setting.component";
import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";
import { PatientSettingComponent } from "./patient-setting/patient-setting.component";
import { DiseasesSettingComponent } from "./patient-setting/diseases-setting/diseases-setting.component";
import { TypeaheadModule, TimepickerModule } from 'ngx-bootstrap';
import { PrintSettingComponent } from './clinic-setting/print-setting/print-setting.component';
import { RecordSettingComponent } from './patient-setting/record-setting/record-setting.component';
import { BookingSettingComponent } from './clinic-setting/booking-setting/booking-setting.component';
import { PricesSettingComponent } from './clinic-setting/prices-setting/prices-setting.component';
import { AddTypeComponent } from './clinic-setting/prices-setting/add-type/add-type.component';
import { AddServiceComponent } from './clinic-setting/prices-setting/add-service/add-service.component';
import { AddDiscountComponent } from './clinic-setting/prices-setting/add-discount/add-discount.component';
import { FileUploadModule } from 'ng2-file-upload';
import { RecordItemsSettingComponent } from './patient-setting/record-items-setting/record-items-setting.component';
import { DiagnosisSettingComponent } from './patient-setting/record-items-setting/diagnosis-setting/diagnosis-setting.component';
import { ComplaintSettingComponent } from './patient-setting/record-items-setting/complaint-setting/complaint-setting.component';
import { ExaminationSettingComponent } from './patient-setting/record-items-setting/examination-setting/examination-setting.component';
import { RaysSettingComponent } from './patient-setting/record-items-setting/rays-setting/rays-setting.component';
import { AnalysisSettingComponent } from './patient-setting/record-items-setting/analysis-setting/analysis-setting.component';
import { OperationSettingComponent } from './patient-setting/record-items-setting/operation-setting/operation-setting.component';
import { ItemSettingComponent } from './patient-setting/record-items-setting/item-setting/item-setting.component';
import { ExaminationAreaSettingComponent } from './patient-setting/record-items-setting/examination-area-setting/examination-area-setting.component';
import { RayAreaSettingComponent } from './patient-setting/record-items-setting/ray-area-setting/ray-area-setting.component';
import { MedicinesSettingComponent } from './patient-setting/medicines-setting/medicines-setting.component';
import { TherapySettingComponent } from './patient-setting/record-items-setting/therapy-setting/therapy-setting.component';
import { TherapyAreaSettingComponent } from './patient-setting/record-items-setting/therapy-area-setting/therapy-area-setting.component';
import { MedicineItemSettingComponent } from './patient-setting/medicines-setting/medicine-item-setting/medicine-item-setting.component';
import { UserResetPasswordComponent } from './users-setting/user-reset-password/user-reset-password.component';

@NgModule({
  declarations: [
    SettingsComponent,
    ClinicSettingComponent,
    UsersSettingComponent,
    PatientSettingComponent,
    DiseasesSettingComponent,
    PrintSettingComponent,
    RecordSettingComponent,
    BookingSettingComponent,
    PricesSettingComponent,
    AddTypeComponent,
    AddServiceComponent,
    AddDiscountComponent,
    RecordItemsSettingComponent,
    DiagnosisSettingComponent,
    ComplaintSettingComponent,
    ExaminationSettingComponent,
    RaysSettingComponent,
    AnalysisSettingComponent,
    OperationSettingComponent,
    ItemSettingComponent,
    ExaminationAreaSettingComponent,
    RayAreaSettingComponent,
    MedicinesSettingComponent,
    TherapySettingComponent,
    TherapyAreaSettingComponent,
    MedicineItemSettingComponent,
    UserResetPasswordComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    FormsModule,
    ReactiveFormsModule,
    SharedModule,
    NbCardModule,
    NbSpinnerModule,
    NbSelectModule,
    NbButtonModule,
    NbRadioModule,
    NbCheckboxModule,
    NbInputModule,
    NbToggleModule,
    NbRouteTabsetModule,
    NbIconModule,
    NbAccordionModule,
    TimepickerModule,
    FileUploadModule,
    TypeaheadModule.forRoot(),
    SweetAlert2Module.forChild()
  ],
  entryComponents: [
    AddTypeComponent,
    AddServiceComponent,
    AddDiscountComponent,
    ItemSettingComponent,
    MedicineItemSettingComponent,
    UserResetPasswordComponent
  ]
})
export class SettingsModule { }
