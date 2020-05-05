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
  constructor(private http: HttpClient, private authService: AuthService) {}
  baseUrl = environment.API_URL;

  /* getSocialStatusValues() {
    return this.http.get<SocialStatus[]>(this.baseUrl + "SocialStatus");
  }

  getCityValues() {
    return this.http.get<CityValue[]>(this.baseUrl + "City");
  } */

  // =====> get patient info by id:
  getPatientInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get all data for patient:
    return this.http.get<GetPatientResponse>(
      this.baseUrl +
        "Patient/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        "/" +
        patientCodeId
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
