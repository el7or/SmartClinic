export interface ReferralValue {
  specialtyId:string;
  specialtyName: string;
  doctors:DoctorValue[];
}
export interface DoctorValue{
  doctorId:string;
  doctorName:string;
}

export interface Referral {
  refId:number;
  specialtyId: string;
  specialtyName: string;
  doctorId:string;
  doctorName:string;
  diagnose: string;
  note: string;
  doctors:DoctorValue[]
}
