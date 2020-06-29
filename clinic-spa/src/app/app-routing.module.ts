import { ExtraOptions, RouterModule, Routes } from "@angular/router";
import { NgModule } from "@angular/core";

import { AuthGuard } from "./auth/auth.guard";
import { PrintInvoiceComponent } from "./shared/components/prints/print-invoice/print-invoice.component";
import { PrintMedicinesComponent } from "./shared/components/prints/print-medicines/print-medicines.component";

const routes: Routes = [
  {
    path: "auth",
    loadChildren: () =>
      import("./auth/auth.module").then((m) => m.NgxAuthModule),
  },
  {
    path: "pages",
    canActivate: [AuthGuard],
    runGuardsAndResolvers: "always",
    loadChildren: () =>
      import("./pages/pages.module").then((m) => m.PagesModule),
  },
  {
    path: "pharmacy",
    canActivate: [AuthGuard],
    runGuardsAndResolvers: "always",
    loadChildren: () =>
      import("./pages-pharmacy/pages-pharmacy.module").then((m) => m.PagesPharmacyModule),
  },
  {
    path: "print",
    children: [
      {
        path: "medicines",
        component: PrintMedicinesComponent,
      },
      {
        path: "invoice",
        component: PrintInvoiceComponent,
      },
    ],
  },
  { path: "", redirectTo: "auth/login", pathMatch: "full" },
  { path: "**", redirectTo: "auth/login" },
];

const config: ExtraOptions = {
  useHash: false,
};

@NgModule({
  imports: [RouterModule.forRoot(routes, config)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
