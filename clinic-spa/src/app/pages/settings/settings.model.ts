export interface GetBookingSetting {
  entryOrderId?: number;
  bookingPeriod?: number;
  consultExpiration?: number;
  isAllDaysOn?: boolean;
  workDays?: number[];
  weekEnds?: number[]; // to disable it in datepickers & calendar:
  isAllDaysSameTime?: boolean;
  allDaysTimeFrom?: Date;
  allDaysTimeTo?: Date;
  isSaturdayOn?: boolean;
  saturdayTimeFrom?: Date;
  saturdayTimeTo?: Date;
  isSundayOn?: boolean;
  sundayTimeFrom?: Date;
  sundayTimeTo?: Date;
  isMondayOn?: boolean;
  mondayTimeFrom?: Date;
  mondayTimeTo?: Date;
  isTuesdayOn?: boolean;
  tuesdayTimeFrom?: Date;
  tuesdayTimeTo?: Date;
  isWednesdayOn?: boolean;
  wednesdayTimeFrom?: Date;
  wednesdayTimeTo?: Date;
  isThursdayOn?: boolean;
  thursdayTimeFrom?: Date;
  thursdayTimeTo?: Date;
  isFridayOn?: boolean;
  fridayTimeFrom?: Date;
  fridayTimeTo?: Date;
}

export interface SetBookingSetting {
  clinicId: string;
  entryOrderId?: number;
  bookingPeriod?: number;
  consultExpiration?: number;
  isAllDaysOn?: boolean;
  workDays?: string;
  isAllDaysSameTime?: boolean;
  allDaysTimeFrom?: string;
  allDaysTimeTo?: string;
  saturdayTimeFrom?: string;
  saturdayTimeTo?: string;
  sundayTimeFrom?: string;
  sundayTimeTo?: string;
  mondayTimeFrom?: string;
  mondayTimeTo?: string;
  tuesdayTimeFrom?: string;
  tuesdayTimeTo?: string;
  wednesdayTimeFrom?: string;
  wednesdayTimeTo?: string;
  thursdayTimeFrom?: string;
  thursdayTimeTo?: string;
  fridayTimeFrom?: string;
  fridayTimeTo?: string;
}

export interface GetPricesSetting {
  bookingTypes: BookingTypePrice[];
  serviceTypes: BookingServicePrice[];
  discountTypes: BookingDiscountPrice[];
}
export interface BookingTypePrice {
  id: number;
  type: string;
  price: number;
}
export interface BookingServicePrice {
  id: number;
  service: string;
  price: number;
}
export interface BookingDiscountPrice {
  id: number;
  discount: string;
  price: number;
  isPercent: boolean;
}

export interface BookingSetting {
  workdays: number[];
  weekEnds?: number[]; // to disable it in datepickers & calendar:
  bookingTimeFrom: Date;
  bookingTimeTo: Date;
  isSameTimeAllDays: boolean;
  workDaysTimes: WorkDayTime[];
  bookingPeriod: number; // by minutes
  sortBookings: string;
  ConsultExpireDays: number;
  bookingTypePrices: BookingTypePrice[];
  bookingServicePrices: BookingServicePrice[];
  bookingDiscountPrices: BookingDiscountPrice[];
}
export interface WorkDayTime {
  day: number;
  dayTitle: string;
  isDayActive: boolean;
  timeFrom: Date;
  timeTo: Date;
}

export interface GetPrintSetting {
  doctorName?: string;
  doctorDegree?: string;
  clinicTitle?: string;
  logoUrl?: string;
  phone1?: string;
  phone2?: string;
  phone3?: string;
  address1?: string;
  address2?: string;
  address3?: string;
}
export interface SetPrintSetting {
  clinicId: string;
  doctorName?: string;
  doctorDegree?: string;
  clinicTitle?: string;
  phone1?: string;
  phone2?: string;
  phone3?: string;
  address1?: string;
  address2?: string;
  address3?: string;
}

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
