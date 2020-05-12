import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root",
})
export class DateTimeService {
  constructor() {}

  // =====> to send time without timezone:
  clearTime(d: Date) {
    d = new Date(d);
    const timeZoneDifference = (d.getTimezoneOffset() / 60) * -1;
    d.setTime(d.getTime() + timeZoneDifference * 60 * 60 * 1000);
    return d.toISOString();
  }

  // =====> to send date without time:
  dateWithoutTime(date:Date){
    return (
      new Date(date).getFullYear() +
      "-" +
      ("0" + (new Date(date).getMonth() + 1)).slice(-2) +
      "-" +
      ("0" + new Date(date).getDate()).slice(-2)
    );
  }

  mergDateTime(date: Date, time: Date) {
    const dateTime = new Date(
      date.getFullYear(),
      date.getMonth(),
      date.getDate(),
      time.getHours(),
      time.getMinutes()
    );
    return this.clearTime(dateTime);
  }

  isTimesEqual(time1: Date, time2: Date) {
    const t1 = new Date(
      2020,
      1,
      1,
      time1.getHours(),
      time1.getMinutes()
    ).toISOString();
    const t2 = new Date(
      2020,
      1,
      1,
      time2.getHours(),
      time2.getMinutes()
    ).toISOString();
    return t1 == t2;
  }

  subtractDays(firstDate: Date, lastDate: Date) {
    let firstDateTime = new Date(firstDate).getTime();
    let lastDateTime = new Date(lastDate).getTime();
    return Math.floor((lastDateTime - firstDateTime) / 86400000);
  }
}
