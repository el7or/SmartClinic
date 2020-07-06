import { ItemsType } from './../../../settings/patient-setting/record-items-setting/record-items-setting.model';
import { Injectable } from "@angular/core";

import { HttpClient } from '@angular/common/http';
import {
  PatientExaminationsDetails,
  GetPatientExaminations,
} from "./examination.model";
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';
import { AnyPatientFileValue } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

@Injectable({
  providedIn: "root",
})
export class ExaminationService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientExaminations() {
    return this.http.get<GetPatientExaminations>(
      this.baseUrl +
        "PatientDetails/GetPatientExams/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientExaminations(patientExaminations: PatientExaminationsDetails) {
    return this.http.put(
      this.baseUrl +
        "PatientDetails/PutPatientExaminations/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
        patientExaminations
    );
  }

  postExaminationValue(examValue: string, type:ItemsType) {
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
