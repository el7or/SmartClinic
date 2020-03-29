import { Injectable } from "@angular/core";

import { AnalysisList, AnalysisDetails } from './analysis.model';

@Injectable({
  providedIn: "root"
})
export class AnalysisService {
  constructor() {}

  getAnalysisList(patientId:string) {
    const analysisList: AnalysisList[] = [
      {
        id: 1,
        analysisName: "AUTOIMMUNE DISEASES",
        requestDate: new Date("2020-5-2"),
        isHasResult: true,
        resultDate: new Date("2020-5-7"),
        resultGrade: 1
      },
      {
        id: 2,
        analysisName: "LIPID PROFILE",
        requestDate: new Date("2020-4-1"),
        isHasResult: true,
        resultDate: new Date("2020-5-2"),
        resultGrade: 3
      },
      {
        id: 3,
        analysisName: "RHEUMATOLOGY PROFILE",
        requestDate: new Date("2020-5-2"),
        isHasResult: false
      }
    ];
    return analysisList;
  }

  getAnalysisDetails(analysisId:number){
    const analysisDetails:AnalysisDetails={
      id:2,
      analysisName: "AUTOIMMUNE DISEASES",
      requestDate: new Date("2020-5-2"),
      isHasResult: true,
      resultText: "Hyper",
      resultDate: new Date("2020-5-7"),
      analysisFiles:[{
        id:1,
        uploadDate:new Date('5/6/2020'),
        fileType: "Before Treatment",
         fileUrl: "../../../../../../assets/images/team.png"
      },
      {
        id:2,
        uploadDate:new Date('12/6/2020'),
        fileType: "After Treatment",
         fileUrl: "../../../../../../assets/images/team.png",
         fileNote:"مطلوب الإعادة"
      }
    ]
    }
    return analysisDetails;
  }
}
