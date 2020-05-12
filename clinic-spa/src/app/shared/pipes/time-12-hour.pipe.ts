import { Pipe, PipeTransform } from "@angular/core";

@Pipe({
  name: "time12Hour"
})
export class Time12HourPipe implements PipeTransform {
  transform(date: any, ...args: any[]): any {
    if (!date) {
      return "";
    } else {
      date = new Date(date);
      let hours = date.getHours();
      let minutes = date.getMinutes();
      let ampm = hours >= 12 ? "PM" : "AM";
      hours = hours % 12;
      hours = hours ? hours : 12; // the hour '0' should be '12'
      minutes = ("0" + minutes).slice(-2);
      let strTime = hours + ":" + minutes + " " + ampm;
      return strTime;
    }
  }
}
