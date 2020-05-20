export interface HomeEvents {
  calendarEvents: CalendarEvents[];
  weekEnds:number[];
}
export interface CalendarEvents {
  title: string;
  start: string;
  description?: string;
}
