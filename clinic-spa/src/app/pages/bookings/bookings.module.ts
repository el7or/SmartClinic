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
  NbCheckboxModule,
  NbDialogModule,
} from "@nebular/theme";
import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { RouterModule } from "@angular/router";
import { FormsModule, ReactiveFormsModule } from "@angular/forms";
import {
  BsDatepickerModule,
  TimepickerModule,
  PaginationModule,
  TypeaheadModule
} from "ngx-bootstrap";
import { SweetAlert2Module } from "@sweetalert2/ngx-sweetalert2";
import { DragDropModule } from "@angular/cdk/drag-drop";

import { SharedModule } from "./../../shared/shared.module";
import { BookingDetailsComponent } from "./booking-details/booking-details.component";
import { BookingsListComponent } from "./bookings-list/bookings-list.component";
import { BookingsComponent } from "./bookings.component";
import { BookingsListTodayComponent } from "./bookings-list-today/bookings-list-today.component";
import { FinanceModule } from "./../finance/finance.module";

@NgModule({
  declarations: [
    BookingDetailsComponent,
    BookingsListComponent,
    BookingsComponent,
    BookingsListTodayComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    ReactiveFormsModule,
    FinanceModule,
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
    NbCheckboxModule,
    NbDialogModule.forChild(),
    PaginationModule,
    DragDropModule,
    BsDatepickerModule.forRoot(),
    TypeaheadModule.forRoot(),
    TimepickerModule.forRoot(),
    SweetAlert2Module.forChild()
  ],
  entryComponents: [BookingDetailsComponent]
})
export class BookingsModule {}
