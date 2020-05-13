export interface Disease {
  id: number;
  questionTextEN: string;
  questionTextAR: string;
  isYes?:boolean;
  note?:string;
}

export interface PutDiseaseList{
  patientDiseaseList:Disease[];
}
