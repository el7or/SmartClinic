export interface HomeEvents {
  calendarEvents: CalendarEvents[];
  weekEnds: number[];
}
export interface CalendarEvents {
  title: string;
  start: string;
  description?: string;
}
export enum ClickType {
  EventClick,
  DateClick,
}
export interface CalendarOperation {
  id:number;
  patientId:string;
  patientName:string;
  patientCodeId:number;
  type: string;
  place?: string;
  cost?: number;
  note?:string;
}
