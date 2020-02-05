import {
  NbCardModule,
  NbButtonModule,
  NbListModule,
  NbSpinnerModule,
  NbRadioModule,
  NbSelectModule,
  NbInputModule,
  NbAlertModule,
  NbIconModule,
  NbTooltipModule,
  NbTabsetModule,
  NbCheckboxModule,
} from "@nebular/theme";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { RouterModule } from "@angular/router";
import { FormsModule } from "@angular/forms";
import { BsDatepickerModule, TimepickerModule, PaginationModule } from "ngx-bootstrap";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";

import { SharedModule } from "./../../shared/shared.module";
import { BookingsSummaryComponent } from "./bookings-summary/bookings-summary.component";
import { NewBookingComponent } from "./new-booking/new-booking.component";
import { BookingsListComponent } from './bookings-list/bookings-list.component';
import { BookingsComponent } from './bookings.component';
import { BookingsTodayComponent } from './bookings-today/bookings-today.component';
import { DragDropModule } from '@angular/cdk/drag-drop';

@NgModule({
  declarations: [BookingsSummaryComponent, NewBookingComponent, BookingsListComponent, BookingsComponent, BookingsTodayComponent],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    NbCardModule,
    NbButtonModule,
    NbListModule,
    NbSpinnerModule,
    NbRadioModule,
    NbSelectModule,
    NbInputModule,
    NbAlertModule,
    NbIconModule,
    NbTooltipModule,
    NbTabsetModule,
    NbCheckboxModule,
    PaginationModule,
    DragDropModule,
    BsDatepickerModule.forRoot(),
    TimepickerModule.forRoot(),
    SweetAlert2Module.forRoot()
  ],
  entryComponents: [BookingsSummaryComponent, NewBookingComponent]
})
export class BookingsModule {}
