export interface Disease {
  id: number;
  diseaseName: string;
  questionText: string;
  isActive: boolean;
}

export interface Recorditem {
  id: number;
  recordName: string;
  isActive: boolean;
}

export interface BookingSetting {
  workdays: number[];
  weekEnds?: number[]; // to disable it in datepickers & calendar:
  bookingTimeFrom: Date;
  bookingTimeTo: Date;
  isSameTimeAllDays:boolean;
  workDaysTimes: WorkDayTime[];
  bookingPeriod: number; // by minutes
  sortBookings: string;
  ConsultExpireDays:number;
  bookingTypePrices: BookingTypePrice[];
  bookingServicePrices: BookingServicePrice[];
}
export interface WorkDayTime{
  day:number;
  dayTitle:string;
  isDayActive:boolean;
  timeFrom:Date;
  timeTo:Date;
}

export interface BookingTypePrice {
  id: number;
  type: string;
  title: string;
  price: number;
}

export interface BookingServicePrice {
  id: number;
  service: string;
  title: string;
  price: number;
}

export interface PrintInfo {
  doctorName: string;
  doctorDegree: string;
  clinicTitle: string;
  phone1: string;
  phone2: string;
  phone3: string;
  address1: string;
  address2: string;
}
