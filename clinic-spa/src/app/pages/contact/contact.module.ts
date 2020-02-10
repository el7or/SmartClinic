import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';
import { NbCardModule, NbButtonModule, NbSpinnerModule, NbInputModule, NbRadioModule } from '@nebular/theme';

import { SharedModule } from '../../shared/shared.module';
import { FinanceModule } from '../finance/finance.module';
import { ContactUsComponent } from './contact-us.component';



@NgModule({
  declarations: [ContactUsComponent],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    FinanceModule,
    NbCardModule,
    NbButtonModule,
    NbSpinnerModule,
    NbInputModule,
    NbRadioModule,
    SweetAlert2Module.forChild()
  ]
})
export class ContactModule { }
