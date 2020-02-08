import { Pipe, PipeTransform } from "@angular/core";

@Pipe({
  name: "dateWithoutTime",
  pure: false
})
export class DateWithoutTimePipe implements PipeTransform {
  transform(date: any, args?: any): any {
    return (
      new Date(date).getFullYear() +
      "-" +
      ("0" + (new Date(date).getMonth() + 1)).slice(-2) +
      "-" +
      ("0" + new Date(date).getDate()).slice(-2)
    );
  }
}
