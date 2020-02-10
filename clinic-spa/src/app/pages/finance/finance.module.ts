import { SharedModule } from './../../shared/shared.module';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { NbCardModule, NbListModule, NbDialogModule, NbButtonModule } from '@nebular/theme';

import { PaymentSummaryComponent } from './payment-summary/payment-summary.component';



@NgModule({
  declarations: [PaymentSummaryComponent],
  imports: [
    CommonModule,
    SharedModule,
    NbCardModule,
    NbListModule,
    NbButtonModule,
    NbDialogModule.forChild()
  ],
  entryComponents:[PaymentSummaryComponent]
})
export class FinanceModule { }
