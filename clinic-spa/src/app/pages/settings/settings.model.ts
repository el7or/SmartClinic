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
  sortBookings: string;
  bookingTimeFrom: Date;
  bookingTimeTo: Date;
  bookPeriod: string;
}

export interface BookingTypePrice {
  id: number;
  type: string;
  title: string;
  price: number;
  isActive: boolean;
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
