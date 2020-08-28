export interface GetBookingDetails{
bookingSetting:BookingSetting;
bookingDetails?:BookingDetails;
prevBookingsDues?: PrevBookingDue[];
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
  doctorBookingTypes:BookingType[];
  doctorBookingServices:BookingService[];
  doctorBookingDiscounts:BookingDiscount[];
  doctorAllBookingSameDay:BookingBrief[];
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
  patientId:string;
  patientName:string;
  time: Date;
  type:string;
}
export interface BookingDetails{
  bookingDateTime:Date;
  bookingTypeId:number;
  bookingServicesIds?:number[];
  bookingDiscountId?:number;
  bookingPayments:number;
  isCanceled?: boolean;
  isEnter?: boolean;
}
export interface PrevBookingDue{
  bookingId:number;
  bookingDate:Date;
  bookingType:string;
  bookingDue:number;
  bookingPaid?:number;
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
  prevBookingsDues?: PrevBookingDue[];
}

export interface BookingEdit {
  bookingId:number;
  doctorId:string;
  clinicId:string;
  bookingDateTime: string;
  typeId: number;
  servicesIds?: number[];
  discountId?: number;
  paid: number;
  prevBookingsDues?: PrevBookingDue[];
}

export interface PatientVisit {
  bookId:number;
  date:Date;
  type:string;
  servcies:string[];
  isEnter:boolean;
  isCanceled:boolean;
  due:number;
}

export interface GetBookingList {
  bookingsList:BookingList[];
  weekEnds:number[];
  sortBookingsByText:string;
}
export interface BookingList {
  bookId: number;
  patientCodeId:number;
  patientId: string;
  daySeqNo: number;
  time:Date;
  type: string;
  services: string[];
  name: string;
  mobile: string;
  isEnter: boolean;
  entryTime: Date;
  entryTimeString: string;
  isAttend: boolean;
  attendTime: Date;
  attendTimeString: string;
  paid: number;
  due: number;
  isCanceled: boolean;
}
export interface PutBookingList {
  clinicId:string;
  bookingsList:BookingList[];
}
