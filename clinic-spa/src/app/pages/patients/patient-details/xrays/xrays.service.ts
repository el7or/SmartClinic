import { Injectable } from "@angular/core";
import { HttpClient } from '@angular/common/http';

import { XraysList, XrayDetails } from "./xrays.model";
import { environment } from '../../../../../environments/environment';
import { AuthService } from '../../../../auth/auth.service';
import { PatientsService } from '../../patients.service';

@Injectable({
  providedIn: "root",
})
export class XraysService {
  baseUrl = environment.API_URL;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getXraysList() {
    return this.http.get<XraysList[]>(
      this.baseUrl +
        "PatientDetails/GetPatientRays/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId
    );
  }

  getXrayDetails(xrayId: number) {
    /* return {
      id: 2,
      xrayName: "PLAIN X RAY FILM",
      xrayArea: "القدم اليمنى",
      requestDate: new Date("2020-5-2"),
      isHasResult: true,
      resultGrade: 1,
      resultDate: new Date("2020-5-7"),
      xraysFiles: [
        {
          id: 1,
          uploadDate: new Date("5/6/2020"),
          fileType: "X-Ray Image",
          fileUrl: "../../../../../../assets/images/team.png",
        },
        {
          id: 2,
          uploadDate: new Date("12/6/2020"),
          fileType: "Report File",
          fileUrl: "../../../../../../assets/images/team.png",
          fileNote: "مطلوب الإعادة",
        },
      ],
    }; */
  }
}
