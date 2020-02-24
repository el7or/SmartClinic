/* export interface ComplaintValue {
  compId:number;
  compName: string;
  compChoisevalues:ComplaintChoiseValue[];
}

export interface ComplaintChoiseValue{
  choiceId:number;
  compId:number;
  choiceName:string;
}

export interface PatientComplaint {
  compId:number;
  compName: string;
  choiceId:number;
  choiceName:string;
  period: string;
  note: string;
} */

export interface ComplaintValue {
  compId:number;
  compName: string;
  compChoises:string[];
}

export interface PatientComplaint {
  compId:number;
  compName: string;
  choiseName:string;
  period: string;
  note: string;
  allChoises:string[]
}
