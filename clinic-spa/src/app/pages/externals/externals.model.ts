export interface ExternalsList {
  patientId: string;
  patientName: string;
  patientMobile: string;
  patientGovernorate:string;
  requestType: string;
  requestBookDate?:Date;
  requestBookTime?:Date;
  createdOn: Date;
}
