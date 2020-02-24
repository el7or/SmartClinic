import { PrintSettingComponent } from './settings/patient-setting/print-setting/print-setting.component';
import { RouterModule, Routes } from "@angular/router";
import { NgModule } from "@angular/core";

import { OperationsComponent } from './patients/patient-details/operations/operations.component';
import { ReferralsComponent } from './patients/patient-details/referrals/referrals.component';
import { PatientRecordComponent } from './patients/patient-details/patient-record/patient-record.component';
import { RequestsComponent } from "./patients/patient-details/requests/requests.component";
import { MedicinesComponent } from "./patients/patient-details/medicines/medicines.component";
import { DiseasesComponent } from "./patients/patient-details/diseases/diseases.component";
import { AnalysisComponent } from "./patients/patient-details/analysis/analysis.component";
import { XRaysComponent } from "./patients/patient-details/x-rays/x-rays.component";
import { PatientSettingComponent } from "./settings/patient-setting/patient-setting.component";
import { ContactUsComponent } from "./contact/contact-us.component";
import { UsersSettingComponent } from "./settings/users-setting/users-setting.component";
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
import { BasicInfoComponent } from "./patients/patient-details/basic-info/basic-info.component";

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
            component: PatientDetailsComponent,
            children: [
              {
                path: "basic",
                component: BasicInfoComponent
              },
              {
                path: "diseases",
                component:DiseasesComponent
              },
              {
                path: "record",
                component: PatientRecordComponent
              },
              {
                path: "xray",
                component: XRaysComponent
              },
              {
                path: "analysis",
                component: AnalysisComponent
              },
              {
                path: "prescription",
                component: MedicinesComponent
              },
              {
                path: "request",
                component: RequestsComponent
              },
              {
                path: "referral",
                component: ReferralsComponent
              },
              {
                path: "operation",
                component: OperationsComponent
              }
            ]
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
            path: "patient",
            component: PatientSettingComponent
          },
          {
            path: "print",
            component: PrintSettingComponent
          },
          {
            path: "users",
            component: UsersSettingComponent
          }
        ]
      },
      {
        path: "contact",
        component: ContactUsComponent
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
