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
  NbTabsetModule,
  NbIconModule
} from "@nebular/theme";

import { UsersSettingComponent } from "./users-setting/users-setting.component";
import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";
import { PatientSettingComponent } from "./patient-setting/patient-setting.component";
import { QuestionsSettingComponent } from "./patient-setting/questions-setting/questions-setting.component";
import { MedicinesSettingComponent } from './patient-setting/medicines-setting/medicines-setting.component';
import { TypeaheadModule } from 'ngx-bootstrap';

@NgModule({
  declarations: [
    SettingsComponent,
    ClinicSettingComponent,
    UsersSettingComponent,
    PatientSettingComponent,
    QuestionsSettingComponent,
    MedicinesSettingComponent
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
    NbTabsetModule,
    NbIconModule,
    TypeaheadModule.forRoot(),
    SweetAlert2Module.forChild()
  ]
})
export class SettingsModule {}
