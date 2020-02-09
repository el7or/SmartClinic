import { RouterModule, Routes } from "@angular/router";
import { NgModule } from "@angular/core";

import { UsersSettingComponent } from './settings/users-setting/users-setting.component';
import { PagesComponent } from "./pages.component";
import { HomeComponent } from "./home/home.component";
import { ChatComponent } from "./chat/chat.component";
import { NotFoundComponent } from "./not-found/not-found.component";
import { PatientsComponent } from "./patients/patients.component";
import { PatientDetailsComponent } from "./patients/patient-details/patient-details.component";
import { PatientsListComponent } from "./patients/patients-list/patients-list.component";
import { BookingsListTodayComponent } from "./bookings/bookings-list-today/bookings-list-today.component";
import { BookingsListComponent } from "./bookings/bookings-list/bookings-list.component";
import { BookingsComponent } from "./bookings/bookings.component";
import { SettingsComponent } from "./settings/settings.component";
import { ClinicSettingComponent } from "./settings/clinic-setting/clinic-setting.component";

const routes: Routes = [
  {
    path: "",
    component: PagesComponent,
    children: [
      {
        path: "home",
        component: HomeComponent
      },
      {
        path: "patients",
        component: PatientsComponent,
        children: [
          {
            path: "",
            redirectTo: "list",
            pathMatch: "full"
          },
          {
            path: "list",
            component: PatientsListComponent
          },
          {
            path: "details/:id",
            component: PatientDetailsComponent
          }
        ]
      },
      {
        path: "bookings",
        component: BookingsComponent,
        children: [
          {
            path: "",
            redirectTo: "today",
            pathMatch: "full"
          },
          {
            path: "list/:date",
            component: BookingsListComponent
          },
          {
            path: "list",
            component: BookingsListComponent
          },
          {
            path: "today",
            component: BookingsListTodayComponent
          }
        ]
      },
      {
        path: "chat",
        component: ChatComponent
      },
      {
        path: "settings",
        component: SettingsComponent,
        children: [
          {
            path: "",
            redirectTo: "clinic",
            pathMatch: "full"
          },
          {
            path: "clinic",
            component: ClinicSettingComponent
          },
          {
            path: "users",
            component: UsersSettingComponent
          }
        ]
      },
      {
        path: "",
        redirectTo: "home",
        pathMatch: "full"
      },
      {
        path: "**",
        component: NotFoundComponent
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class PagesRoutingModule {}
