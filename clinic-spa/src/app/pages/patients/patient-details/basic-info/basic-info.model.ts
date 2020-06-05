export interface GetPatientResponse{
  socialStatus:SocialStatus[];
  cityValue:CityValue[];
  basicInfo?:BasicInfo;
}
export interface BasicInfo {
  patientId:string;
  name:string;
  mobile:string;
  mobile2?:string;
  age?:number;
  gender?:boolean;
  status?:number;
  career?:string;
  city?:number;
  area?:number;
  note?:string;
}
export interface SocialStatus{
  id:number;
  textEN:string;
  textAR:string;
}
export interface CityValue{
  id:number;
  textEN:string;
  textAR:string;
  cities: City[];
}
export interface City{
  id:number;
  textEN:string;
  textAR:string;
}

export interface NewPatient{
  doctorId:string;
  clinicId:string;
  fullName:string;
  phone:string;
  phone2?:string;
  age?:number;
  gender?:boolean;
  socialStatusId?:number;
  career?:string;
  governorateId?:number;
  cityId?:number;
  note?:string;
}
export interface AddPatientResponse{
  seqNo:number;
  patientId:string;
}

export interface EditPatient{
  patientId:string;
  doctorId:string;
  clinicId:string;
  fullName:string;
  phone:string;
  phone2?:string;
  age?:number;
  gender?:boolean;
  socialStatusId?:number;
  career?:string;
  governorateId?:number;
  cityId?:number;
  note?:string;
}
