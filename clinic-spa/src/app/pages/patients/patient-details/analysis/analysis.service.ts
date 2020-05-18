import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { AnalysisList, AnalysisDetails } from './analysis.model';
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: "root"
})
export class AnalysisService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getAnalysisList() {
    return this.http.get<AnalysisList[]>(
      this.baseUrl +
        "PatientDetails/GetPatientAnalysis/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
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
