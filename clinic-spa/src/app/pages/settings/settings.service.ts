import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class SettingsService {
  workdays: number[] = [0, 1, 2, 3, 4, 5, 6];
  sortBookingsBy: string = "manual";

  constructor() {}

  saveSetting(days: number[], sortBy): void {
    this.workdays = days;
    this.sortBookingsBy = sortBy;
  }

  getWeekEndsDays(): number[] {
    const weekDays = [0, 1, 2, 3, 4, 5, 6];
    let Weekend = weekDays.filter(item => this.workdays.indexOf(item) < 0);
    return Weekend;
  }
}
