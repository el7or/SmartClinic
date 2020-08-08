import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { environment } from "../../../environments/environment";
import { AuthService } from "../../auth/auth.service";
import { HomeEvents, CalendarOperation } from "./home.model";

@Injectable({
  providedIn: "root",
})
export class HomeService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

  getCalendarEvents() {
    return this.http.get<HomeEvents>(
      this.baseUrl +
        "Booking/GetHomeBookings/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        this.authService.clinicId
    );
  }

  getCalendarOperations(date) {
    return this.http.get<CalendarOperation[]>(
      this.baseUrl +
        "PatientDetails/GetCalOper/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        date
    );
  }
}
