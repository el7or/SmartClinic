import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";

import {
  GetPatientComplaints,
  PutPatientComplaints,
} from "./complaints.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";
import { AnyPatientFileValue, ItemsType } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

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
  postComplaintValue(compValue: string) {
    const postObj: AnyPatientFileValue = {
      id: 0,
      text: compValue,
    };
    return this.http.post<AnyPatientFileValue>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        ItemsType.Complaint,
        postObj
    );
  }
}
