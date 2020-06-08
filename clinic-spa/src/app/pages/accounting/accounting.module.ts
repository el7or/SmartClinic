import { ProfitsComponent } from './profits/profits.component';
import { ExpensesComponent } from './expenses/expenses.component';
import { MonthlyIncomeComponent } from './incomes/monthly-income/monthly-income.component';
import { DailyIncomeComponent } from './incomes/daily-income/daily-income.component';
import { IncomesComponent } from './incomes/incomes.component';
import { AccountingComponent } from './accounting.component';
import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { SharedModule } from '../../shared/shared.module';
import { FormsModule } from '@angular/forms';
import { BookingsModule } from '../bookings/bookings.module';
import { NbTabsetModule, NbRouteTabsetModule, NbCardModule, NbInputModule, NbButtonModule, NbRadioModule, NbSelectModule, NbSpinnerModule, NbIconModule, NbTooltipModule, NbAlertModule, NbDialogModule } from '@nebular/theme';
import { BsDatepickerModule, PaginationModule } from 'ngx-bootstrap';
import { SweetAlert2Module } from '@sweetalert2/ngx-sweetalert2';



@NgModule({
  declarations: [
    AccountingComponent,
    IncomesComponent,
    DailyIncomeComponent,
    MonthlyIncomeComponent,
    ExpensesComponent,
    ProfitsComponent
  ],
  imports: [
    CommonModule,
    RouterModule,
    SharedModule,
    FormsModule,
    BookingsModule,
    NbTabsetModule,
    NbRouteTabsetModule,
    NbCardModule,
    NbInputModule,
    NbButtonModule,
    NbRadioModule,
    NbSelectModule,
    NbSpinnerModule,
    NbIconModule,
    NbTooltipModule,
    NbAlertModule,
    NbDialogModule.forChild(),
    BsDatepickerModule.forRoot(),
    SweetAlert2Module.forRoot(),
    PaginationModule.forRoot()
  ]
})
export class AccountingModule { }
