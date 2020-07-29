import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { environment } from "../../../environments/environment";
import { AuthService } from "../../auth/auth.service";
import {
  GetIncomeList,
  MonthIncome,
  GetExpenseList,
  ExpenseItemValue,
  PostExpenseItemValue,
  PostExpense,
  MonthProfit,
  ExpenseValues,
  DayProfit,
} from "./accounting.model";

@Injectable({
  providedIn: "root",
})
export class AccountingService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

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

  getMonthIncomes() {
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
        this.authService.doctorId
    );
  }

  getExpensesValues() {
    return this.http.get<ExpenseValues>(
      this.baseUrl +
        "Pay/GetExpenseValues/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }

  postExpenseItem(item: string) {
    const postObj: PostExpenseItemValue = {
      doctorId: this.authService.doctorId,
      item: item,
    };
    return this.http.post<ExpenseItemValue>(
      this.baseUrl + "Pay/PostExpenseItem/" + this.authService.userId,
      postObj
    );
  }

  postExpense(expense: PostExpense) {
    return this.http.post<ExpenseItemValue>(
      this.baseUrl +
        "Pay/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId,
      expense
    );
  }

  getDailyProfits() {
    return this.http.get<DayProfit[]>(
      this.baseUrl +
        "Pay/GetProfitDaily/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }

  getMonthProfits() {
    return this.http.get<MonthProfit[]>(
      this.baseUrl +
        "Pay/GetProfitMonthly/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }
}
