export interface GetPatientPrescriptions{
  medicineValues:MedicineValue[];
  concentrationValues:ConcentrationValue[];
  formValues:FormValue[];
  doseValues:DoseValue[];
  timingValues:TimingValue[];
  periodValues:PeriodValue[];
  prevPatientPrescriptions:PatientPrescription[];
}
export interface MedicineValue {
  id:number;
  text:string
}
export interface ConcentrationValue {
  id:number;
  text:string
}
export interface FormValue {
  id:number;
  text:string
}
export interface DoseValue {
  id:number;
  text:string
}
export interface TimingValue {
  id:number;
  text:string
}
export interface PeriodValue {
  id:number;
  text:string
}
export interface PatientPrescription {
  id:number;
  medicines:PrescriptionMedicine[];
  note?:string;
  medicinesNames?:string;
  createdOn?:Date;
  isPrint?:boolean;
}
export interface PrescriptionMedicine {
  medicineId:number;
  medicineName:string;
  isNameValid?:boolean;
  concentrationId?:number;
  formId?:number;
  doseId?:number;
  timingId?:number;
  periodId?:number;
}

export interface PrescriptionForPrint {
  patientCodeId:number;
  patientName:string;
  medicinesForPrint:MedicinesForPrint[];
  note:string;
  createdOn?:Date;
}
export interface MedicinesForPrint {
  medicine:string;
  concentration?:string;
  form?:string;
  dose?:string;
  timing?:string;
  period?:string;
}
