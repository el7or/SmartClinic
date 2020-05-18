import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { GetPatientOperations, PostPatientOperation } from "./operations.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";

@Injectable({
  providedIn: "root",
})
export class OperationsService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientOperations() {
    return this.http.get<GetPatientOperations>(
      this.baseUrl +
        "PatientDetails/GetOper/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientOperation(patientOperation: PostPatientOperation) {
    return this.http.post(
      this.baseUrl +
        "PatientDetails/PostPatientOper/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
      patientOperation
    );
  }
}
