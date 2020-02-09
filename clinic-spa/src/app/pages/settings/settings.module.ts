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
} from "@nebular/theme";

import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";

@NgModule({
  declarations: [ClinicSettingComponent, SettingsComponent],
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
    SweetAlert2Module.forRoot()
  ]
})
export class SettingsModule {}
