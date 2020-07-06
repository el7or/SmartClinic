import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import {
  GetPatientDiagnosis,
  PutPatientDiagnosis,
} from "./diagnosis.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";
import { AnyPatientFileValue, ItemsType } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

@Injectable({
  providedIn: "root",
})
export class DiagnosisService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientDiagnosis() {
    return this.http.get<GetPatientDiagnosis>(
      this.baseUrl +
        "PatientDetails/GetPatientDiagnosis/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientDiagnosis(patientDiagnosis: PutPatientDiagnosis) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutPatientDiagnosis/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
      patientDiagnosis
    );
  }

  postDiagnosisValue(diagnosisValue: string) {
    const postObj: AnyPatientFileValue = {
      id: 0,
      text: diagnosisValue,
    };
    return this.http.post<AnyPatientFileValue>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        ItemsType.Diagnosis,
        postObj
    );
  }
}
