import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../../environments/environment';
import { AuthService } from '../../auth/auth.service';
import { GetPaymentList, MonthPayment } from './accounting.model';

@Injectable({
  providedIn: 'root'
})
export class AccountingService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) { }

  getPaymentsListByDate(date: string) {
    return this.http.get<GetPaymentList>(
      this.baseUrl +
        "Pay/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        date
    );
  }

  getMonthPayments(){
    return this.http.get<MonthPayment[]>(
      this.baseUrl +
        "Pay/GetIncomeMonthly/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }
}
