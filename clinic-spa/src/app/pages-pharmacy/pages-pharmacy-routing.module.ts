import { PrevListComponent } from './prev-list/prev-list.component';
import { HomePharmacyComponent } from "./home-pharmacy/home-pharmacy.component";
import { PagesPharmacyComponent } from "./pages-pharmacy.component";
import { NgModule } from "@angular/core";
import { RouterModule, Routes } from "@angular/router";
import { NotFoundComponent } from "../shared/components/not-found/not-found.component";
import { ContactUsComponent } from "../shared/components/contact/contact-us.component";

const routes: Routes = [
  {
    path: "",
    component: PagesPharmacyComponent,
    children: [
      {
        path: "",
        redirectTo: "home",
        pathMatch: "full",
      },
      {
        path: "home",
        component: HomePharmacyComponent,
      },
      {
        path: "list",
        component: PrevListComponent,
      },
      {
        path: "contact",
        component: ContactUsComponent,
      },
      {
        path: "**",
        component: NotFoundComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesPharmacyRoutingModule {}
