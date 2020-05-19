export interface ExternalsList {
  id:number;
  patientId: string;
  patientName: string;
  patientMobile: string;
  patientGovernorateEN:string;
  patientGovernorateAR:string;
  requestType: string;
  referralFromDoctor:string;
  createdOn: Date;
  note:string;
  requestBookDateTime?:Date;
}

export interface ConfirmExternalResponse{
  patientId:string;
}
