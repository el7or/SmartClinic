export interface GetPaymentList {
  paymentsList:PaymentList[];
  weekEnds:number[];
}
export interface PaymentList {
  bookId: number;
  patientCodeId:number;
  patientId: string;
  paymentDate:Date;
  type: string;
  services: string[];
  name: string;
  totalPrice:number;
  paid: number;
}

export interface MonthPayment{
  month:Date;
  year:number;
  totalPaid:number;
}
