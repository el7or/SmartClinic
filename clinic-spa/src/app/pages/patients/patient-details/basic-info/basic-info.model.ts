export interface BasicInfo {
  patientId:string;
  name:string;
  mobile:string;
  age?:number;
  gender?:boolean;
  status?:string;
  career?:string;
  city?:string;
  area?:string;
}

export interface NewPatient{
  name:string;
  mobile:string;
  age?:number;
  gender?:boolean;
  status?:string;
  career?:string;
  city?:string;
  area?:string;
}

export interface EditPatient{
  id:number;
  name:string;
  mobile:string;
  age?:number;
  gender?:boolean;
  status?:string;
  career?:string;
  city?:string;
  area?:string;
}
