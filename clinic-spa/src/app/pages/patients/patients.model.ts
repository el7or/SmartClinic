export interface PatientList {
  id: string;
  codeId: number;
  name: string;
  mobile: string;
  visitsCount: number;
  lastVisit: Date;
}

export interface PatientHeaderInfo{
  patientId:string;
  name:string;
  age:number;
visitsCount:number;
}
