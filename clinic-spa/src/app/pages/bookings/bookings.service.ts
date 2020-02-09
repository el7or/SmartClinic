import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class BookingsService {
  chosenBookingDate: Date = new Date();

  constructor() {}

  getBookingsListToday(day) {
    let bookingsList = [
      {
        seq: 1,
        id: 125,
        time: new Date(2020,2,1,5,0),
        type: "Urgent Diagnose",
        service: "X-Ray",
        name: "محمد احمد السيد",
        mobile: "021251021",
        isEnter: true,
        entryTime:new Date(2020,2,1,5,10),
        isAttend: true,
        attendTime: new Date(2020,2,1,4,45),
        cost: 150,
        isCanceled: false
      },
      {
        seq: 2,
        id: 112,
        time: new Date(2020,2,1,5,30),
        type: "Diagnose",
        service: "Sonar",
        name: "محمد علي محمد",
        mobile: "0211425102",
        isEnter: false,
        entryTime: new Date(2020,2,1,5,30),
        isAttend: true,
        attendTime: new Date(2020,2,1,5,45),
        cost: 70,
        isCanceled: false
      },
      {
        seq: 3,
        id: 325,
        time: new Date(2020,2,1,6,0),
        type: "Diagnose",
        service: "Analsis",
        name: "عبير احمد علي",
        mobile: "063546845",
        isEnter: false,
        entryTime: null,
        isAttend: true,
        attendTime: new Date(2020,2,1,4,45),
        cost: 200,
        isCanceled: false
      },
      {
        seq: 4,
        id: 222,
        time: new Date(2020,2,1,7,30),
        type: "Consult",
        service: "X-Ray",
        name: "عبد الفتاح عبد المتجلي عبد العزيز",
        mobile: "015265566",
        isEnter: false,
        entryTime: null,
        isAttend: false,
        attendTime: null,
        cost: 20,
        isCanceled: true
      },
      {
        seq: 5,
        id: 56,
        time: new Date(2020,2,1,7,0),
        type: "Consult",
        service: "Laser Session",
        name: "منى احمد السيد",
        mobile: "012584686",
        isEnter: false,
        entryTime: null,
        isAttend: false,
        attendTime: null,
        cost: 50,
        isCanceled: false
      }
    ];
    return bookingsList;
  }

  setChosenbookingDate(date:Date):void{
    this.chosenBookingDate = date;
  }

  getChosenbookingDate():Date{
    return this.chosenBookingDate;
  }
}
