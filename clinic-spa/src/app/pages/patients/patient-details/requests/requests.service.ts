import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { environment } from "../../../../../environments/environment";
import {
  RequestsForPrint,
  GetPatientRequests,
  PatientRequest,
  PutPatientRequests,
} from "./requests.model";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";
import { ItemsType, AnyPatientFileValue } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

@Injectable({
  providedIn: "root",
})
export class RequestsService {
  baseUrl = environment.API_URL;

  private _requestsForPrint: RequestsForPrint;
  public get requestsForPrint(): RequestsForPrint {
    return this._requestsForPrint;
  }
  public set requestsForPrint(v: RequestsForPrint) {
    this._requestsForPrint = v;
  }

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientRequests() {
    return this.http.get<GetPatientRequests>(
      this.baseUrl +
        "PatientDetails/GetPatientRequest/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientRequest(patientRequest: PutPatientRequests) {
    return this.http.post(
      this.baseUrl +
        "PatientDetails/PostPatientRequest/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
      patientRequest
    );
  }

  deletePatientRequest(requestId: number, type: string) {
    return this.http.delete(
      this.baseUrl +
        "PatientDetails/DeletePatientRequest/" +
        this.authService.userId +
        "/" +
        requestId +
        "/" +
        type
    );
  }

  postNewItemValue(value: string, type:ItemsType) {
    const postObj: AnyPatientFileValue = {
      id: 0,
      text: value,
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
