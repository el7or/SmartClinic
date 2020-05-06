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
  NbRouteTabsetModule
} from "@nebular/theme";

import { UsersSettingComponent } from "./users-setting/users-setting.component";
import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";
import { PatientSettingComponent } from "./patient-setting/patient-setting.component";
import { DiseasesSettingComponent } from "./patient-setting/diseases-setting/diseases-setting.component";
import { MedicinesSettingComponent } from './patient-setting/medicines-setting/medicines-setting.component';
import { TypeaheadModule, TimepickerModule } from 'ngx-bootstrap';
import { PrintSettingComponent } from './clinic-setting/print-setting/print-setting.component';
import { RecordSettingComponent } from './patient-setting/record-setting/record-setting.component';
import { BookingSettingComponent } from './clinic-setting/booking-setting/booking-setting.component';
import { PricesSettingComponent } from './clinic-setting/prices-setting/prices-setting.component';
import { AddTypeComponent } from './clinic-setting/prices-setting/add-type/add-type.component';
import { AddServiceComponent } from './clinic-setting/prices-setting/add-service/add-service.component';
import { AddDiscountComponent } from './clinic-setting/prices-setting/add-discount/add-discount.component';
import { FileUploadModule } from 'ng2-file-upload';

@NgModule({
  declarations: [
    SettingsComponent,
    ClinicSettingComponent,
    UsersSettingComponent,
    PatientSettingComponent,
    DiseasesSettingComponent,
    MedicinesSettingComponent,
    PrintSettingComponent,
    RecordSettingComponent,
    BookingSettingComponent,
    PricesSettingComponent,
    AddTypeComponent,
    AddServiceComponent,
    AddDiscountComponent
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
    TimepickerModule,
    FileUploadModule,
    TypeaheadModule.forRoot(),
    SweetAlert2Module.forChild()
  ],
  entryComponents:[AddTypeComponent,AddServiceComponent,AddDiscountComponent]
})
export class SettingsModule {}
