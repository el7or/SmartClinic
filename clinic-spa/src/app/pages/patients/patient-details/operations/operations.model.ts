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
  type: string;
  date?: Date;
  place?: string;
  cost?: number;
}
export interface PostPatientOperation {
  typeId: number;
  date?: string;
  place?: string;
  cost?: number;
  note?:string;
}
