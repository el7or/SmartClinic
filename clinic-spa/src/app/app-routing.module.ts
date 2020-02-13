import { ExtraOptions, RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';
import {
  NbAuthComponent,
  NbLoginComponent,
  NbLogoutComponent,
  NbRegisterComponent,
  NbRequestPasswordComponent,
  NbResetPasswordComponent,
} from '@nebular/auth';

import { AuthGuard } from './auth/auth.guard';
import { PrintInvoiceComponent } from './shared/components/prints/print-invoice/print-invoice.component';
import { PrintMedicinesComponent } from './shared/components/prints/print-medicines/print-medicines.component';

const routes: Routes = [
  {
    path: 'pages',
    canActivate:[AuthGuard],
    runGuardsAndResolvers:'always',
    loadChildren: () => import('./pages/pages.module')
      .then(m => m.PagesModule),
  },
  {
    path: 'auth',
    loadChildren: () => import('./auth/auth.module')
      .then(m => m.NgxAuthModule),
  },
  {
    path: 'print',
    children:[
      {
        path:'medicines',
        component:PrintMedicinesComponent
      },
      {
        path:'invoice',
        component:PrintInvoiceComponent
      }
    ]
  },
  { path: '', redirectTo: 'pages', pathMatch: 'full' },
  { path: '**', redirectTo: 'pages' },
];

const config: ExtraOptions = {
  useHash: false,
};

@NgModule({
  imports: [RouterModule.forRoot(routes, config)],
  exports: [RouterModule],
})
export class AppRoutingModule {
}
