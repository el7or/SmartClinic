export interface ExternalsList {
  // =====> check if this patient exist in current doctor:
  isPatientExist:boolean;
  // =====> if (isPatientExist==false) create new patient before confirm booking:
  patientId: string;
  patientName: string;
  patientMobile: string;
  patientGovernorateEN:string;
  patientGovernorateAR:string;
  requestType: string;
  createdOn: Date;
  requestBookDate?:Date;
  requestBookTime?:Date;
}
