export interface GetPatientPrescriptions {
  medicineValues: MedicineValue[];
  quantityValues: QuantityValue[];
  doseValues: DoseValue[];
  timingValues: TimingValue[];
  periodValues: PeriodValue[];
  pharmacyValues: PharmacyValue[];
  doctorPharmacyId?: string;
  prevPatientPrescriptions: PatientPrescription[];
}
export interface MedicineValue {
  id: number;
  text: string;
  defaultQuantityId?: number;
  defaultDoseId?: number;
  defaultTimingId?: number;
  defaultPeriodId?: number;
}
export interface QuantityValue {
  id: number;
  text: string
}
export interface DoseValue {
  id: number;
  text: string
}
export interface TimingValue {
  id: number;
  text: string
}
export interface PeriodValue {
  id: number;
  text: string
}
export interface PharmacyValue {
  id: string;
  text: string
}
export interface PatientPrescription {
  id: number;
  medicines: PrescriptionMedicine[];
  note?: string;
  medicinesNames?: string;
  createdOn?: Date;
  isPrint?: boolean;
  pharmacyId?: string;
}
export interface PrescriptionMedicine {
  medicineId: number;
  medicineName: string;
  isNameValid?: boolean;
  quantityId?: number;
  doseId?: number;
  timingId?: number;
  periodId?: number;
}

export interface PrescriptionForPrint {
  patientCodeId: number;
  patientId: string;
  patientName: string;
  medicinesForPrint: MedicinesForPrint[];
  note: string;
  createdOn?: Date;
}
export interface MedicinesForPrint {
  medicine: string;
  quantity?: string;
  dose?: string;
  timing?: string;
  period?: string;
}
