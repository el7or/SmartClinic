import { BookingsComponent } from './bookings/bookings.component';
import { PatientDetailsComponent } from './patients/patient-details/patient-details.component';
import { PatientsListComponent } from './patients/patients-list/patients-list.component';
import { RouterModule, Routes } from '@angular/router';
import { NgModule } from '@angular/core';

import { PagesComponent } from './pages.component';
import { HomeComponent } from './home/home.component';
import { ChatComponent } from './chat/chat.component';
import { NotFoundComponent } from './not-found/not-found.component';
import { PatientsComponent } from './patients/patients.component';

const routes: Routes = [{
  path: '',
  component: PagesComponent,
  children: [
    {
      path: 'home',
      component: HomeComponent,
    },
    {
      path: 'patients',
      component: PatientsComponent,
      children: [
        {
          path: '',
          redirectTo: 'list',
          pathMatch: 'full',
        },
        {
          path: 'list',
          component: PatientsListComponent,
        },
        {
          path: 'details/:id',
          component: PatientDetailsComponent,
        },
      ]
    },
    {
      path: 'bookings',
      component: BookingsComponent,
    },
    {
      path: 'chat',
      component: ChatComponent,
    },
    {
      path: '',
      redirectTo: 'home',
      pathMatch: 'full',
    },
    {
      path: '**',
      component: NotFoundComponent,
    },
  ],
}];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class PagesRoutingModule {
}
