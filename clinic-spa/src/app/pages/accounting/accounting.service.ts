import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../../environments/environment';
import { AuthService } from '../../auth/auth.service';
import { GetIncomeList, MonthIncome, GetExpenseList } from './accounting.model';

@Injectable({
  providedIn: 'root'
})
export class AccountingService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) { }

  getIncomesListByDate(date: string) {
    return this.http.get<GetIncomeList>(
      this.baseUrl +
        "Pay/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        date
    );
  }

  getMonthIncomes(){
    return this.http.get<MonthIncome[]>(
      this.baseUrl +
        "Pay/GetIncomeMonthly/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }

  getExpensesList() {
    return this.http.get<GetExpenseList[]>(
      this.baseUrl +
        "Pay/GetExpenseMonthly/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/"
    );
  }

  postExpenseItem(){

  }

  postExpense(){

  }
}
