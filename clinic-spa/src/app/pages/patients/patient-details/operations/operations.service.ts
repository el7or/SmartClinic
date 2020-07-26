import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import {
  GetPatientOperations,
  PostPatientOperation,
  PutPatientOperation,
} from "./operations.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";
import { ItemsType, AnyPatientFileValue } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

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

  postPatientOperation(patientOperation: PostPatientOperation) {
    return this.http.post(
      this.baseUrl +
        "PatientDetails/PostPatientOper/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
      patientOperation
    );
  }

  putPatientOperation(patientOperation: PutPatientOperation) {
    return this.http.put(
      this.baseUrl + "PatientDetails/PutPatientOper/" + this.authService.userId,
      patientOperation
    );
  }

  deletePatientOperation(operationId: number) {
    return this.http.delete(
      this.baseUrl +
        "PatientDetails/DeletePatientOper/" +
        this.authService.userId +
        "/" +
        operationId
    );
  }

  postOperationTypeValue(examValue: string, type:ItemsType) {
    const postObj: AnyPatientFileValue = {
      id: 0,
      text: examValue,
    };
    return this.http.post<AnyPatientFileValue>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        type,
        postObj
    );
  }
}
