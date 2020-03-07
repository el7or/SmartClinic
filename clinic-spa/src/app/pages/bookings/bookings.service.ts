import { Injectable } from "@angular/core";

import { BookingList, BookingEdit, BookingNew } from './bookings.model';

@Injectable({
  providedIn: "root"
})
export class BookingsService {
  chosenBookingDate: Date = new Date();

  constructor() {}

  getBookingsListByDate(date):BookingList[] {
    const bookingsList:BookingList[] = [
      {
        bookId: 125,
        patientCodeId:1,
        patientId:'dsafas',
        seq: 1,
        time: new Date(2020,1,9,5,0),
        type: "Urgent Diagnose",
        service: "X-Ray",
        name: "محمد احمد السيد",
        mobile: "021251021",
        isEnter: true,
        entryTime:new Date(2020,1,9,17,10),
        isAttend: true,
        attendTime: new Date(2020,1,9,16,45),
        paid: 150,
        due:0,
        isCanceled: false
      },
      {
        bookId: 112,
        patientCodeId:2,
        patientId:'dsafas',
        seq: 2,
        time: new Date(2020,1,9,17,30),
        type: "Diagnose",
        service: "Sonar",
        name: "محمد علي محمد",
        mobile: "0211425102",
        isEnter: false,
        entryTime: new Date(2020,1,9,17,30),
        isAttend: true,
        attendTime: new Date(2020,1,9,17,45),
        paid: 70,
        due:50,
        isCanceled: false
      },
      {
        bookId: 325,
        patientCodeId:3,
        patientId:'dsafas',
        seq: 3,
        time: new Date(2020,1,9,18,0),
        type: "Diagnose",
        service: "Analysis",
        name: "عبير احمد علي",
        mobile: "063546845",
        isEnter: false,
        entryTime: null,
        isAttend: true,
        attendTime: new Date(2020,1,9,16,45),
        paid: 200,
        due:0,
        isCanceled: false
      },
      {
        bookId: 222,
        patientCodeId:4,
        patientId:'dsafas',
        seq: 4,
        time: new Date(2020,1,9,19,30),
        type: "Consult",
        service: "X-Ray",
        name: "عبد الفتاح عبد المتجلي عبد العزيز",
        mobile: "015265566",
        isEnter: false,
        entryTime: null,
        isAttend: false,
        attendTime: null,
        paid: 0,
        due:0,
        isCanceled: true
      },
      {
        bookId: 56,
        patientCodeId:5,
        patientId:'dsafas',
        seq: 5,
        time: new Date(2020,1,9,19,0),
        type: "Consult",
        service: "Laser Session",
        name: "منى احمد السيد",
        mobile: "012584686",
        isEnter: false,
        entryTime: null,
        isAttend: false,
        attendTime: null,
        paid: 20,
        due:100,
        isCanceled: false
      }
    ];
    return bookingsList;
  }

  getBookingDetailsById(id:number):BookingEdit{
    const booking:BookingEdit = {
      bookId:1,
      date:new Date(2020,4,15,8,0),
      time:new Date(2020,4,15,8,0),
      typeId:4,
      servicesIds:[1,2],
      discount:10,
      discountNote:'',
      paid:20
    };
    return booking;
  }

  addNewBooking(booking:BookingNew){

  }
  updateBooking(booking:BookingEdit){

  }

  // =====> get/set choosen booking date from calendar in home:
  getChosenbookingDate():Date{
    return this.chosenBookingDate;
  }
  setChosenbookingDate(date:Date):void{
    this.chosenBookingDate = date;
  }
}
