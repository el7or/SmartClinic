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
        time: "05:00",
        type: "Urgent Diagnose",
        service: "X-Ray",
        name: "محمد احمد السيد",
        mobile: "021251021",
        isEnter: true,
        entryTime: "05:10",
        isAttend: true,
        attendTime: "04:45",
        cost: 150,
        isCanceled: false
      },
      {
        seq: 2,
        id: 112,
        time: "05:30",
        type: "Diagnose",
        service: "Sonar",
        name: "محمد علي محمد",
        mobile: "0211425102",
        isEnter: true,
        entryTime: "05:30",
        isAttend: true,
        attendTime: "04:45",
        cost: 70,
        isCanceled: false
      },
      {
        seq: 3,
        id: 325,
        time: "06:00",
        type: "Diagnose",
        service: "Analsis",
        name: "عبير احمد علي",
        mobile: "063546845",
        isEnter: false,
        entryTime: "06:09",
        isAttend: true,
        attendTime: "05:54",
        cost: 200,
        isCanceled: false
      },
      {
        seq: 4,
        id: 222,
        time: "07:00",
        type: "Consult",
        service: "X-Ray",
        name: "عبد الفتاح عبد المتجلي عبد العزيز",
        mobile: "015265566",
        isEnter: false,
        entryTime: "07:30",
        isAttend: false,
        attendTime: "07:13",
        cost: 20,
        isCanceled: true
      },
      {
        seq: 5,
        id: 56,
        time: "07:30",
        type: "Consult",
        service: "Laser Session",
        name: "منى احمد السيد",
        mobile: "012584686",
        isEnter: false,
        entryTime: "07:48",
        isAttend: false,
        attendTime: "07:20",
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
