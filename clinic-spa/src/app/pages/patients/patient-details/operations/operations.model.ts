export interface GetPatientOperations{
  operationTypeValues:OperationTypeValue[];
  prevPatientOperations:PatientOperation[];
}
export interface OperationTypeValue {
  id: number;
  text: string;
}
export interface PatientOperation {
  id:number;
  typeId:number;
  type: string;
  date?: Date;
  place?: string;
  cost?: number;
  note?:string;
}
export interface PostPatientOperation {
  typeId: number;
  date?: string;
  place?: string;
  cost?: number;
  note?:string;
}

export interface PutPatientOperation {
  id:number;
  typeId: number;
  date?: string;
  place?: string;
  cost?: number;
  note?:string;
}
