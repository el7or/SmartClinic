export interface NewPrescription {
  id: number;
  doctorFullName: string;
  patientFullName: string;
  career:string;
  phone: string;
  phone2: string;
  city: string;
  createdOn:Date;
  medicinesPresc:MedicinesPresc[];
  note:string;
}
export interface MedicinesPresc {
  medicine:string;
  quantity?:string;
  dose?:string;
  timing?:string;
  period?:string;
}

export interface SavePresc {
  id:number;
  isPharmacyDone?:boolean;
  isPharmacyDelete?:boolean;
}

export interface PrevPrescription {
  id: number;
  doctorFullName: string;
  patientFullName: string;
  career:string;
  phone: string;
  phone2: string;
  city: string;
  createdOn:Date;
  medicinesPresc:MedicinesPresc[];
  note:string;
  status:string;
}
