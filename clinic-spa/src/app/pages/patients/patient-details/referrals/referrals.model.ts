export interface GetPatientReferrals{
  specialtyValues:SpecialtyValue[];
  patientDiagnosis:PatientDiagnosis[];
  prevPatientReferrals:PatientReferral[];
}
export interface SpecialtyValue {
  specialtyId:number;
  specialtyName: string;
  doctors:DoctorValue[];
}
export interface DoctorValue{
  doctorId:string;
  doctorName:string;
}
export interface PatientDiagnosis {
  id:number;
  text:string
}

export interface PatientReferral{
  id:number;
  specialtyName: string;
  doctorName:string;
  diagnosisName?: string;
  note?: string;
  createdOn:Date;
}

export interface PutPatientReferral {
  specialtyId: number;
  doctorId:string;
  diagnosisId?: number;
  note?: string;
}

export interface ReferralForPrint {
  patientCodeId:number;
  patientId:string;
  patientName:string;
  specialtyName: string;
  doctorName:string;
  diagnosisName?: string;
  note?: string;
  createdOn:Date;
}
