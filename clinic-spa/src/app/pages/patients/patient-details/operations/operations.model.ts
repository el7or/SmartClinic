export interface OperationValue {
  id: number;
  text: string;
}

export interface PatientOperation {
  id:number;
  type: string;
  date: Date;
  place?: string;
  cost: number;
}

export interface NewPatientOperation {
  id:number;
  type: string;
  date: Date;
  place?: string;
  cost: number;
}
