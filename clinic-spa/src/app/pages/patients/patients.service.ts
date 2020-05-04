import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { PatientHeaderInfo, PatientsPagedList } from "./patients.model";
import { AuthService } from "../../auth/auth.service";
import { environment } from "../../../environments/environment";
import { BasicInfo } from "./patient-details/basic-info/basic-info.model";

@Injectable({
  providedIn: "root",
})
export class PatientsService {
  private _patientId: string;

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

  searchPatientsList(pageNumber: number, pageSize: number,searchText:string) {
    return this.http.get<PatientsPagedList>(
      this.baseUrl +
        "Patient/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        "/" +
        pageNumber +
        "/" +
        pageSize+
        "/" +
        searchText
    );
  }

  getPatientHeaderInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get  data for patient:
    this.patientId = "dfgfdgsgd";
    const info: PatientHeaderInfo = {
      patientId: "dfgfdgsgd",
      name: "حاتم قطاوي",
      age: 33,
      visitsCount: 3,
    };
    return info;
  }
}
