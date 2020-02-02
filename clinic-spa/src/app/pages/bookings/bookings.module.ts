import { NbCardModule, NbButtonModule, NbListModule } from '@nebular/theme';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { FormsModule } from '@angular/forms';

import { SharedModule } from './../../shared/shared.module';
import { BookingsSummaryComponent } from './bookings-summary/bookings-summary.component';


@NgModule({
  declarations: [BookingsSummaryComponent],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    NbCardModule,
    NbButtonModule,
    NbListModule
  ],
  entryComponents:[BookingsSummaryComponent],
})
export class BookingsModule { }
