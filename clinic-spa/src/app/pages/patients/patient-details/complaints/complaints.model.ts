export interface GetPatientComplaints{
  complaintGeneralValues:ComplaintGeneralValue[];
  complaintDetailsValues:ComplaintDetailsValue[];
  patientGeneralComplaints:PatientGeneralComplaint[];
  patientDetailsComplaints:PatientDetailsComplaint[];
}
export interface PutPatientComplaints{
  patientGeneralComplaints:PatientGeneralComplaint[];
  patientDetailsComplaints:PatientDetailsComplaint[];
  }

export interface ComplaintGeneralValue {
  compId:number;
  compName: string;
}
export interface PatientGeneralComplaint {
  id:number;
  compId:number;
  compName: string;
  note: string;
  createdOn:Date;
  isNameValid?:boolean;
}

export interface ComplaintDetailsValue {
  compId:number;
  compName: string;
  compChoises:ComplaintChoiceValue[];
}
export interface ComplaintChoiceValue {
  choiceId:number;
  choiceName: string;
}
export interface PatientDetailsComplaint {
  id:number;
  compId:number;
  choiceId:number;
  period: string;
  note: string;
  createdOn:Date;
  allChoices?:ComplaintChoiceValue[]
}
