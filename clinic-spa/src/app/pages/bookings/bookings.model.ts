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

export interface BookingNew{
  patientId: string;
  clinicId: string;
  doctorId: string;
  date: Date;
  time: Date;
  typeId: number;
  servicesIds: number[];
  discount: number;
  discountNote: string;
  paid: number;
}

export interface BookingEdit {
  bookId:number;
  date: Date;
  time: Date;
  typeId: number;
  servicesIds: number[];
  discount: number;
  discountNote: string;
  paid: number;
}

export interface BookingBrief{
  bookId:number;
  seq:number;
  time: Date;
  typeTitle:string;
}
