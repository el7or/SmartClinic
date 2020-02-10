import { LanggService } from '../services/langg.service';
import { Pipe, PipeTransform } from "@angular/core";

@Pipe({
  name: "localDateLong",
  pure: false
})
export class LocalDateLongPipe implements PipeTransform {

  constructor(private langgService:LanggService){}
  transform(value: any, ...args: any[]): any {
    return new Date(value).toLocaleString(this.langgService.locale, {
      weekday: "long",
      year: "numeric",
      month: "long",
      day: "numeric"
    });
  }
}