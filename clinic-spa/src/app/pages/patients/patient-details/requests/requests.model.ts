export interface GetPatientRequests{
  rayValues:RayValue[];
  rayAreaValues:RayAreaValue[];
  analysisValues:AnalysisValue[];
  physicalTherapyValues:PhysicalTherapyValue[];
  physicalTherapyAreaValues:PhysicalTherapyAreaValue[];
  prevPatientRequests:PatientRequest[];
}
export interface RayValue {
  id:number;
  text:string
}
export interface RayAreaValue {
  id:number;
  text:string
}
export interface AnalysisValue {
  id:number;
  text:string
}
export interface PhysicalTherapyValue {
  id:number;
  text:string
}
export interface PhysicalTherapyAreaValue {
  id:number;
  text:string
}
export interface PatientRequest {
  id:number;
  requestDate?:Date;
  requestType:string;
  requestId:number;
  requestName:string;
  isNameValid?:boolean;
  areaId?:number;
  areaName?:string;
  isAreaValid?:boolean;
  note?:string;
  isHasResult?:boolean;
}
export interface PutPatientRequests{
  newPatientRequests:PatientRequest[];
}

export interface RequestsForPrint {
  patientCodeId:number;
  patientName:string;
  requests:RequestForPrint[];
  createdOn?:Date;
}
export interface RequestForPrint {
  requestType:string;
  requestName:string;
  rayArea?:string;
  note:string;
}
