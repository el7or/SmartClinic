import { Pipe, PipeTransform } from "@angular/core";

import { LanggService } from "../services/langg.service";

@Pipe({
  name: "langg",
  pure: false
})
export class LanggPipe implements PipeTransform {
  constructor(private langgService: LanggService) {}

  // =====> translate value in html elements with 'langg' pipe:
  transform(value: string, args?: any): any {
    try {
      return this.langgService.translateWord(value);
    } catch (error) {}
  }
}
