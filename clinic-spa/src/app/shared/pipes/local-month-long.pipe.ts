import { Pipe, PipeTransform } from "@angular/core";
import { LanggService } from "../services/langg.service";

@Pipe({
  name: "localMonthLong",
})
export class LocalMonthLongPipe implements PipeTransform {
  constructor(private langgService: LanggService) {}
  transform(value: any, ...args: any[]): any {
    return new Date(value).toLocaleString(this.langgService.locale, {
      year: "numeric",
      month: "long",
    });
  }
}
