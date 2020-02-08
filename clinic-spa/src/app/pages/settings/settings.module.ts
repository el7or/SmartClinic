import { FormsModule } from "@angular/forms";
import { RouterModule } from "@angular/router";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";

import { SharedModule } from "./../../shared/shared.module";
import { ClinicSettingComponent } from "./clinic-setting/clinic-setting.component";
import { SettingsComponent } from "./settings.component";

@NgModule({
  declarations: [ClinicSettingComponent, SettingsComponent],
  imports: [CommonModule, RouterModule, FormsModule, SharedModule]
})
export class SettingsModule {}
