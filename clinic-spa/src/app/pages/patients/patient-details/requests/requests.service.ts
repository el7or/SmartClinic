import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

import { environment } from '../../../../../environments/environment';
import { RequestsForPrint, GetPatientRequests, PatientRequest, PutPatientRequests } from './requests.model';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: 'root'
})
export class RequestsService {
baseUrl = environment.API_URL;

  private _requestsForPrint : RequestsForPrint;
  public get requestsForPrint() : RequestsForPrint {
    return this._requestsForPrint;
  }
  public set requestsForPrint(v : RequestsForPrint) {
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
}
