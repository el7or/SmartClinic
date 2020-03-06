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

export interface BookingDetails {
  patientId: string;
  clinicId: string;
  doctorId: string;
  date: Date;
  time: Date;
  type: number;
  services: number[];
  discount: number;
  discountNote: string;
  paid: number;
}
