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
  note:string;
  medicinesNames?:string[];
  createdOn?:Date;
}
export interface PrescriptionMedicine {
  medicineId:number;
  medicineName:string;
  concentrationId?:number;
  formId?:number;
  doseId?:number;
  timingId?:number;
  periodId?:number;
}
