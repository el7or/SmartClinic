export interface GetPatientExaminations {
  examinationTypeValues:ExaminationTypeValue[];
  examinationAreaValues:ExaminationAreaValue[];
  pressureValues:BloodPressureValue[];
  patientExaminations:PatientExaminationsDetails;
}
export interface ExaminationTypeValue {
  typeId: number;
  typeText: string;
}
export interface ExaminationAreaValue {
  areaId: number;
  areaText: string;
}
export interface BloodPressureValue {
  id: number;
  pressure: string;
}
export interface PatientExaminationsDetails {
  weight?: number;
  length?: number;
  mass?: number;
  pressureId?: number;
  temperature?: number;
  examinations?: PatientExamination[];
}
export interface PatientExamination {
  id: number;
  typeId: number;
  typeName:string;
  areaId: number;
  areaName:string;
  createdOn: Date;
  isNameValid?:boolean;
}
