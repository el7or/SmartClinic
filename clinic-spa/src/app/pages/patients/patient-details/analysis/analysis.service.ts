import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { AnalysisList, AnalysisDetails, PutAnalysis } from './analysis.model';
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

  getAnalysisDetails(analysisId: number) {
    return this.http.get<AnalysisDetails>(
      this.baseUrl +
        "PatientDetails/GetAnalysis/" +
        this.authService.userId +
        "/" +
        analysisId
    );
  }

  savePatientAnalysis(patientAnalysis: PutAnalysis) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutAnalysis/" +
        this.authService.userId,
        patientAnalysis
    );
  }
}
