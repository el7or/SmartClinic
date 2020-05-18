import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { PutPatientReferral, GetPatientReferrals, ReferralForPrint } from './referrals.model';
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: "root"
})
export class ReferralsService {
  baseUrl = environment.API_URL;

  private _referralForPrint : ReferralForPrint;
  public get referralForPrint() : ReferralForPrint {
    return this._referralForPrint;
  }
  public set referralForPrint(v : ReferralForPrint) {
    this._referralForPrint = v;
  }

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientReferral() {
    return this.http.get<GetPatientReferrals>(
      this.baseUrl +
        "PatientDetails/GetPatientReferral/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientReferral(patientReferral: PutPatientReferral) {
    return this.http.post(
      this.baseUrl +
        "PatientDetails/PostPatientReferral/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId,
        patientReferral
    );
  }
}
