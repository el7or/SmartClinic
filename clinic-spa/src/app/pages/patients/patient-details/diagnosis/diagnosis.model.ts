export interface GetPatientDiagnosis {
  diagnosisValues:DiagnosisValue[];
  diseaseValues:DiseaseValue[];
  patientDiagnosis:PatientDiagnosis[];
}
export interface PutPatientDiagnosis {
  patientDiagnosis:PatientDiagnosis[];
}

export interface DiagnosisValue {
  id: number;
  text: string;
}

export interface DiseaseValue {
  id: number;
  text: string;
}

export interface PatientDiagnosis {
  id?: number;
  diagnosisId?: number;
  diagnosisName?: string;
  isNameValid?:boolean;
  gradeId?: number;
  note: string;
  createdOn:Date;
}
