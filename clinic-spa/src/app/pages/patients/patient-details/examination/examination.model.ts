export interface ExaminationTypeValue {}

export interface PatientExaminationsDetails {
  weight: number;
  length: number;
  mass: number;
  pressure: number;
  temperature: number;
  examinations: PatientExamination[];
}

export interface PatientExamination {
  id: number;
  type: string;
  isTypeValid: boolean;
  area: string;
  isAreaValid: boolean;
  createdOn: Date;
}
