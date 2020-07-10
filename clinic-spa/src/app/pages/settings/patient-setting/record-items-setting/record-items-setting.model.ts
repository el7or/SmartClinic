export interface AnyPatientFileValue{
  id: number;
  text: string;
}

export enum ItemsType {
  Complaint = "Complaint",
  Examination = "Examination",
  ExaminationArea = "ExaminationArea",
  Diagnosis = "Diagnosis",
  Ray = "Ray",
  RayArea = "RayArea",
  Analysis = "Analysis",
  Operation = "Operation",
  Medicine= "Medicine"
}
