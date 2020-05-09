import { PatientsService } from "./../../patients.service";
import { AuthService } from "./../../../../auth/auth.service";
import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";

import {
  NewPatient,
  EditPatient,
  AddPatientResponse,
  GetPatientResponse,
} from "./basic-info.model";
import { environment } from "../../../../../environments/environment";

@Injectable({
  providedIn: "root",
})
export class BasicInfoService {
  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}
  baseUrl = environment.API_URL;

  // =====> get patient info by id:
  getPatientInfo() {
    return this.http.get<GetPatientResponse>(
      this.baseUrl +
        "Patient/GetPatientBasic/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
  }

  // =====> save new patient:
  saveNewPatient(newPatient: NewPatient) {
    // must create codeId for patient on clinic level not on doctor level
    return this.http.post<AddPatientResponse>(
      this.baseUrl + "Patient/" + this.authService.userId,
      newPatient
    );
  }

  // =====> update basic info:
  updatePatientInfo(editPatient: EditPatient) {
    return this.http.put(
      this.baseUrl + "Patient/" + this.authService.userId,
      editPatient
    );
  }
}
