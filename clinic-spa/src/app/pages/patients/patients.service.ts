import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { PatientHeaderInfo, PatientsPagedList } from "./patients.model";
import { AuthService } from "../../auth/auth.service";
import { environment } from "../../../environments/environment";
import { map } from "rxjs/operators";

@Injectable({
  providedIn: "root",
})
export class PatientsService {
  private _patientId?: string;

  public get patientId(): string {
    return this._patientId;
  }
  public set patientId(id: string) {
    this._patientId = id;
  }

  constructor(private http: HttpClient, private authService: AuthService) {}
  baseUrl = environment.API_URL;

  getPatientsList(pageNumber: number, pageSize: number) {
    return this.http.get<PatientsPagedList>(
      this.baseUrl +
        "Patient/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        "/" +
        pageNumber +
        "/" +
        pageSize
    );
  }

  searchPatientsList(pageNumber: number, pageSize: number, searchText: string) {
    return this.http.get<PatientsPagedList>(
      this.baseUrl +
        "Patient/SearchPatients/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        "/" +
        pageNumber +
        "/" +
        pageSize +
        "/" +
        searchText
    );
  }

  getPatientHeaderInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get  data for patient:
    return this.http
      .get<PatientHeaderInfo>(
        this.baseUrl +
          "Patient/" +
          this.authService.userId +
          "/" +
          this.authService.clinicId +
          "/" +
          patientCodeId
      )
      .pipe(
        map((p) => {
          this._patientId = p.patientId;
          return p;
        })
      );
  }
}
