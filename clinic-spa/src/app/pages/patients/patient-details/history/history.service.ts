import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { PatientHistory } from "./history.model";
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: "root",
})
export class HistoryService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientHistory() {
    return this.http.get<PatientHistory>(
      this.baseUrl +
        "PatientDetails/GetPatientHistory/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
  }

  savePatientHistory(patientHistory: PatientHistory) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutPatientHistory/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
        patientHistory
    );
  }
}
