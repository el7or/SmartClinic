import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class SettingsService {
  workdays: number[]= [1,2,3,4,5,6,7];

  constructor() {}

  saveSetting(days: number[]): void {
    this.workdays = days;
  }

  getWeekEndsDays():number[] {
    const weekDays = [1,2,3,4,5,6,7];
    let Weekend =  weekDays.filter(item => this.workdays.indexOf(item) < 0);
    return Weekend;
  }
}
