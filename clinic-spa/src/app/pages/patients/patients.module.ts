import { SharedModule } from './../../shared/shared.module';
import { FormsModule } from '@angular/forms';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NbAccordionModule, NbTabsetModule, NbCardModule, NbInputModule, NbButtonModule, NbRadioModule, NbSelectModule, NbSpinnerModule } from '@nebular/theme';

import { NewPatientComponent } from './new-patient/new-patient.component';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';



@NgModule({
  declarations: [NewPatientComponent],
  imports: [
    CommonModule,
    SharedModule,
    FormsModule,
    NbAccordionModule,
    NbTabsetModule,
    NbCardModule,
    NbInputModule,
    NbButtonModule,
    NbRadioModule,
    NbSelectModule,
    NbSpinnerModule,
    SweetAlert2Module.forRoot()
  ]
})
export class PatientsModule { }
