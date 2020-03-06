export interface PatientVisits {
  patientId:string;
  patientName:string;
  patientVisits:PatientVisit[]
}
export interface PatientVisit {
  bookId:number;
  date:Date;
  type:string;
  servcies:string[];
  isEnter:boolean;
  isCanceled:boolean;
}
