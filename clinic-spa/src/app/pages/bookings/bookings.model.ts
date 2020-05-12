export interface GetBookingDetails{
bookingSetting:BookingSetting;
bookingDetails?:BookingDetails;
}
export interface BookingSetting{
  patientName:string;
  patientLastBookingType?:string;
  patientLastBookingDate?:Date;
  clinicWeekEnds:number[];
  clinicBookingPeriod:number;
  clinicConsultExpiration:number;
  clinicDayTimeFrom:Date;
  clinicDayTimeTo:Date;
  clinicBookingTypes:BookingType[];
  clinicBookingServices:BookingService[];
  clinicBookingDiscounts:BookingDiscount[];
  doctorAllBookingSameDay:BookingBrief[];
}
export interface BookingDetails{
  bookingDateTime:Date;
  bookingTypeId:number;
  bookingServicesIds?:number[];
  bookingDiscountId?:number;
  bookingPayments:number;
  isCanceled?: boolean;
}
export interface BookingType{
  id: number;
  type: string;
  price: number;
}
export interface BookingService{
  id: number;
  service: string;
  price: number;
}
export interface BookingDiscount{
  id: number;
  discount: string;
  price: number;
  isPercent: boolean;
}
export interface BookingBrief{
  bookId:number;
  time: Date;
  type:string;
}

export interface BookingChangeDate{
  clinicDayTimeFrom:Date;
  clinicDayTimeTo:Date;
  doctorAllBookingSameDay?:BookingBrief[];
}

export interface BookingNew{
  patientId: string;
  doctorId: string;
  bookingDateTime: string;
  typeId: number;
  servicesIds?: number[];
  discountId?: number;
  paid: number;
}

export interface BookingEdit {
  bookingId:number;
  bookingDateTime: string;
  typeId: number;
  servicesIds?: number[];
  discountId?: number;
  paid: number;
}

export interface BookingList {
  bookId: number;
  patientCodeId:number;
  patientId: string;
  seq: number;
  time:Date;
  type: string;
  service: string;
  name: string;
  mobile: string;
  isEnter: boolean;
  entryTime: Date;
  isAttend: boolean;
  attendTime: Date;
  paid: number;
  due: number;
  isCanceled: boolean;
}

export interface PatientVisit {
  bookId:number;
  date:Date;
  type:string;
  servcies:string[];
  isEnter:boolean;
  isCanceled:boolean;
}
