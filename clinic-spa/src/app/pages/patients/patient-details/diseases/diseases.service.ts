import { PatientsService } from './../../patients.service';
import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { Disease, PutDiseaseList } from "./diseases.model";
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';

@Injectable({
  providedIn: "root"
})
export class DiseasesService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService,private patientService:PatientsService) {}

  getDiseasesList() {
    return this.http.get<Disease[]>(
      this.baseUrl +
        "PatientDetails/GetPatientDiseases/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
  }
  saveDiseasesList(patientDiseases: PutDiseaseList) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutPatientDiseases/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId ,
        patientDiseases
    );
  }
}
