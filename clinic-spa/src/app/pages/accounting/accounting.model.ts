export interface GetIncomeList {
  paymentsList:IncomeList[];
  weekEnds:number[];
}
export interface IncomeList {
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
export interface MonthIncome{
  month:Date;
  totalPaid:number;
}

export interface GetExpenseList{
  month:Date;
  expensesList:ExpenseList[];
}
export interface ExpenseList{
  id:number;
  date:Date;
  amount:number;
  item:string;
  note:string;
}
