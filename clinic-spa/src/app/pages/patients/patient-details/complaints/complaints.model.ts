export interface GetPatientComplaints{
generalComplaintValues:ComplaintGeneralValue[];
detailsComplaintValues:ComplaintDetailsValue[];
patientGeneralComplaints:PatientGeneralComplaint[];
patientDetailsComplaints:PatientComplaintDetails[];
}

export interface ComplaintGeneralValue {
  compId:number;
  compName: string;
}
export interface PatientGeneralComplaint {
  compId:number;
  note: string;
  createdOn:Date;
}

export interface ComplaintDetailsValue {
  compId:number;
  compName: string;
  compChoises:ComplaintChoiseValue[];
}
export interface ComplaintChoiseValue {
  choiceId:number;
  choiceName: string;
}
export interface PatientComplaintDetails {
  compId:number;
  choiceId:number;
  period: string;
  note: string;
  createdOn:Date;
  allChoises?:ComplaintChoiseValue[]
}
