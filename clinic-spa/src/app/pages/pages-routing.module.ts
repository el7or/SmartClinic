import { ExpensesListComponent } from './accounting/expenses/expenses-list/expenses-list.component';
import { ProfitsComponent } from './accounting/profits/profits.component';
import { ExpensesComponent } from './accounting/expenses/expenses.component';
import { MonthlyIncomeComponent } from './accounting/incomes/monthly-income/monthly-income.component';
import { DailyIncomeComponent } from './accounting/incomes/daily-income/daily-income.component';
import { IncomesComponent } from './accounting/incomes/incomes.component';
import { AccountingComponent } from './accounting/accounting.component';
import { RecordSettingComponent } from './settings/patient-setting/record-setting/record-setting.component';
import { DiseasesSettingComponent } from './settings/patient-setting/diseases-setting/diseases-setting.component';
import { PrintSettingComponent } from './settings/clinic-setting/print-setting/print-setting.component';
import { PricesSettingComponent } from './settings/clinic-setting/prices-setting/prices-setting.component';
import { BookingSettingComponent } from './settings/clinic-setting/booking-setting/booking-setting.component';
import { ExternalsComponent } from './externals/externals.component';
import { RouterModule, Routes } from "@angular/router";
import { NgModule } from "@angular/core";

import { VisitsComponent } from './patients/patient-details/visits/visits.component';
import { OperationsComponent } from './patients/patient-details/operations/operations.component';
import { ReferralsComponent } from './patients/patient-details/referrals/referrals.component';
import { PatientRecordComponent } from './patients/patient-details/patient-record/patient-record.component';
import { RequestsComponent } from "./patients/patient-details/requests/requests.component";
import { MedicinesComponent } from "./patients/patient-details/medicines/medicines.component";
import { DiseasesComponent } from "./patients/patient-details/diseases/diseases.component";
import { AnalysisComponent } from "./patients/patient-details/analysis/analysis.component";
import { XRaysComponent } from "./patients/patient-details/xrays/xrays.component";
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
import { ExpenseDetailsComponent } from './accounting/expenses/expense-details/expense-details.component';

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
              },
              {
                path: "visits",
                component: VisitsComponent
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
        path: "accounting",
        component: AccountingComponent,
        children :
        [
          {
            path: "",
            redirectTo: "income",
            pathMatch: "full"
          },
          {
            path: "income",
            component: IncomesComponent,
            children:[
              {
                path:"",
                component:DailyIncomeComponent
              },
              {
                path:"monthly",
                component:MonthlyIncomeComponent
              },
            ]
          },
          {
            path: "expense",
            component: ExpensesComponent,
            children: [
              {
                path: "",
                redirectTo: "list",
                pathMatch: "full"
              },
              {
                path: "list",
                component: ExpensesListComponent
              },
              {
                path: "details/:id",
                component: ExpenseDetailsComponent,
              }
            ]
          },
          {
            path: "profit",
            component: ProfitsComponent,
          },
        ]
      },
      {
        path: "chat",
        component: ChatComponent
      },
      {
        path: "externals",
        component: ExternalsComponent
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
            component: ClinicSettingComponent,
            children:[
              {
                path:"",
                component:BookingSettingComponent
              },
              {
                path:"prices",
                component:PricesSettingComponent
              },
              {
                path:"print",
                component:PrintSettingComponent
              },
            ]
          },
          {
            path: "patient",
            component: PatientSettingComponent,
            children:[
              {
                path:"",
                component:DiseasesSettingComponent
              },
              {
                path:"records",
                component:RecordSettingComponent
              }
            ]
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
