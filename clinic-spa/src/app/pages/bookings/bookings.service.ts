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
        seq: 2,
        id: 112,
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
        seq: 3,
        id: 325,
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
        seq: 4,
        id: 222,
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
        seq: 5,
        id: 56,
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

  // =====> get set choosen booking date from calendar in home:
  getChosenbookingDate():Date{
    return this.chosenBookingDate;
  }
  setChosenbookingDate(date:Date):void{
    this.chosenBookingDate = date;
  }
}
