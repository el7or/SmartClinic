import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NbAccordionModule, NbTabsetModule, NbCardModule } from '@nebular/theme';

import { NewPatientComponent } from './new-patient/new-patient.component';



@NgModule({
  declarations: [NewPatientComponent],
  imports: [
    CommonModule,
    NbAccordionModule,
    NbTabsetModule,
    NbCardModule
  ]
})
export class PatientsModule { }
