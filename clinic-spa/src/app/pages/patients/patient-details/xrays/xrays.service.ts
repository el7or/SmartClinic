import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { XraysList, XrayDetails, PutXray } from "./xrays.model";
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: "root",
})
export class XraysService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getXraysList() {
    return this.http.get<XraysList[]>(
      this.baseUrl +
        "PatientDetails/GetPatientRays/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
  }

  getXrayDetails(xrayId: number) {
    return this.http.get<XrayDetails>(
      this.baseUrl +
        "PatientDetails/GetRay/" +
        this.authService.userId +
        "/" +
        xrayId
    );
  }

  savePatientRay(patientRay: PutXray) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutRay/" +
        this.authService.userId,
        patientRay
    );
  }
}
