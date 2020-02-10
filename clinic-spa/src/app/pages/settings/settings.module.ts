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
  NbToggleModule
} from "@nebular/theme";

import { UsersSettingComponent } from './users-setting/users-setting.component';
import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";

@NgModule({
  declarations: [SettingsComponent,ClinicSettingComponent, UsersSettingComponent],
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
    SweetAlert2Module.forChild()
  ]
})
export class SettingsModule {}
