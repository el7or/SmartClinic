import { Injectable } from "@angular/core";
import { ExternalsList, ConfirmExternalResponse } from "./externals.model";
import { environment } from "../../../environments/environment";
import { HttpClient } from "@angular/common/http";
import { AuthService } from "../../auth/auth.service";
import { UserRole } from "../../auth/auth.model";

@Injectable({
  providedIn: "root",
})
export class ExternalsService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

  getExternalsList() {
    return this.http.get<ExternalsList[]>(
      this.baseUrl +
        "PatientDetails/GetExtens/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId +
        (this.authService.roleName == UserRole.doctor
          ? "/" + this.authService.doctorId
          : "")
    );
  }

  confirmExternal(id: number) {
    return this.http.get<ConfirmExternalResponse>(
      this.baseUrl +
        "PatientDetails/ConfirmExternal/" +
        this.authService.userId +
        "/" +
        id +
        "/" +
        this.authService.clinicId
    );
  }

  deleteExternal(id: number) {
    return this.http.delete(
      this.baseUrl +
        "PatientDetails/DeleteExternal/" +
        this.authService.userId +
        "/" +
        id
    );
  }
}
