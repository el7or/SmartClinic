import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import {
  BookingList,
  BookingEdit,
  BookingNew,
  GetBookingDetails,
  BookingChangeDate,
  PatientVisit,
  GetBookingList,
  PutBookingList,
} from "./bookings.model";

import { AuthService } from "../../auth/auth.service";
import { environment } from "../../../environments/environment";

@Injectable({
  providedIn: "root",
})
export class BookingsService {
  baseUrl = environment.API_URL;

  private _chosenBookingDate: Date = new Date();
  // =====> get/set choosen booking date from calendar in home:
  public get chosenBookingDate(): Date {
    return this._chosenBookingDate;
  }
  public set chosenBookingDate(value: Date) {
    this._chosenBookingDate = value;
  }

  constructor(private http: HttpClient, private authService: AuthService) {}

  getBookingDetails(patientId: string, bookingId: number, bookingDate: string) {
    return this.http.get<GetBookingDetails>(
      this.baseUrl +
        "Booking/" +
        this.authService.userId +
        "/" +
        patientId +
        "/" +
        bookingId +
        "/" +
        bookingDate
    );
  }

  getBookingChangeDate(patientId: string, bookingDate: string) {
    return this.http.get<BookingChangeDate>(
      this.baseUrl +
        "Booking/GetChangeDate/" +
        this.authService.userId +
        "/" +
        patientId +
        "/" +
        bookingDate
    );
  }

  addNewBooking(booking: BookingNew) {
    return this.http.post(
      this.baseUrl + "Booking/" + this.authService.userId,
      booking
    );
  }
  updateBooking(booking: BookingEdit) {
    return this.http.put(
      this.baseUrl + "Booking/" + this.authService.userId,
      booking
    );
  }

  // =====> visits list in patient file tabs:
  getVisitsList(patientId: string) {
    return this.http.get<PatientVisit[]>(
      this.baseUrl +
        "Booking/GetPatientBookings/" +
        this.authService.userId +
        "/" +
        patientId
    );
  }

  cancelBooking(bookId: number) {
    return this.http.delete(
      this.baseUrl + "Booking/" + this.authService.userId + "/" + bookId
    );
  }

  getBookingsListByDate(date: string) {
    return this.http.get<GetBookingList>(
      this.baseUrl +
        "Booking/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        date
    );
  }

  // =====> update booking list today (daySeqNo,attendTime,enterTime):
  putBookingsList(bookingList:PutBookingList){
    return this.http.put(
      this.baseUrl + "Booking/PutBookingList/" + this.authService.userId,
      bookingList
    );
  }
}
