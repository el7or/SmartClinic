export interface AnyPatientFileValue {
  id: number;
  text: string;
  // just using in medicine setting:
  defaultQuantityId?: number;
  defaultDoseId?: number;
  defaultTimingId?: number;
  defaultPeriodId?: number;
  defaultQuantityText?: string;
  defaultDoseText?: string;
  defaultTimingText?: string;
  defaultPeriodText?: string;
}

export enum ItemsType {
  Complaint = "Complaint",
  Examination = "Examination",
  ExaminationArea = "ExaminationArea",
  Diagnosis = "Diagnosis",
  Ray = "Ray",
  RayArea = "RayArea",
  Analysis = "Analysis",
  PhysicalTherapy = "PhysicalTherapy",
  PhysicalTherapyArea = "PhysicalTherapyArea",
  Operation = "Operation",
  Medicine = "Medicine",
}
