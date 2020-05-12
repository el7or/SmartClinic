export interface PatientsPagedList {
  patients: PatientList[];
  pagination: Pagination;
}
export interface PatientList {
  id: string;
  codeId: number;
  name: string;
  mobile: string;
  visitsCount: number;
  lastVisit: Date;
  lastVisitType: string;
  lastVisitBookId:number;
}
export interface Pagination {
  pageNumber: number;
  pageCount: number;
  pageSize: number;
  totalItemCount: number;
}

export interface PatientHeaderInfo {
  patientId: string;
  name: string;
  age: number;
  visitsCount: number;
}
