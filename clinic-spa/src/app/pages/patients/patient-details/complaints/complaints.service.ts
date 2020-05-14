import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";

import {
  ComplaintDetailsValue,
  ComplaintGeneralValue,
  GetPatientComplaints,
  PutPatientComplaints,
} from "./complaints.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";

@Injectable({
  providedIn: "root",
})
export class ComplaintsService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientComplaints() {
    return this.http.get<GetPatientComplaints>(
      this.baseUrl +
        "PatientDetails/GetPatientComplaints/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }
  savePatientComplaints(patientComplaints: PutPatientComplaints) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutPatientComplaints/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
      patientComplaints
    );
  }
}
