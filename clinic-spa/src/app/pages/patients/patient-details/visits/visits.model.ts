export interface PatientVisit {
  bookId:number;
  date:Date;
  type:string;
  servcies:string[];
  isEnter:boolean;
  isCanceled:boolean;
}
