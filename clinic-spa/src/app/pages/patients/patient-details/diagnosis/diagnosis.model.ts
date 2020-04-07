export interface DiagnosisValue {
  id: number;
  text: string;
}

export interface PatientDiagnosis {
  id?: number;
  name: string;
  isNameValid: boolean;
  grade?: number;
  note: string;
  createdOn:Date;
}
