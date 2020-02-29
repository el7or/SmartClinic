export interface PatientGeneralComplaint {
  compId:number;
  compName: string;
  note: string;
  isNameValid:boolean;
}

export interface ComplaintDetailsValue {
  compId:number;
  compName: string;
  compChoises:string[];
}

export interface PatientComplaintDetails {
  compId:number;
  compName: string;
  choiseName:string;
  period: string;
  note: string;
  allChoises:string[]
}
