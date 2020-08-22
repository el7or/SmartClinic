import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import {
  DiseaseQuestion,
  Recorditem,
  GetBookingSetting,
  SetBookingSetting,
  GetPricesSetting,
  GetPrintSetting,
  SetPrintSetting,
  GetUser,
} from "./settings.model";
import { AuthService } from "../../auth/auth.service";
import { environment } from "../../../environments/environment";

@Injectable({
  providedIn: "root",
})
export class SettingsService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

  // =====> get/set booking setting:
  getBookingSetting() {
    return this.http.get<GetBookingSetting>(
      this.baseUrl +
        "Clinic/GetBookingSetting/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId
    );
  }
  saveBookingSetting(bookingSetting: SetBookingSetting) {
    return this.http.put(
      this.baseUrl + "Clinic/PutBookingSetting/" + this.authService.userId,
      bookingSetting
    );
  }

  // =====> get/set prices setting:
  getPricesSetting() {
    return this.http.get<GetPricesSetting>(
      this.baseUrl +
        "Clinic/GetPricesSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }
  savePricesSetting(allPrices: GetPricesSetting) {
    return this.http.put(
      this.baseUrl +
        "Clinic/PutPricesSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId,
      allPrices
    );
  }

  // =====> get/set print setting:
  getPrintSetting() {
    return this.http.get<GetPrintSetting>(
      this.baseUrl +
        "Clinic/GetPrintSetting/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId
    );
  }
  savePrintSetting(printSetting: SetPrintSetting) {
    return this.http.put(
      this.baseUrl + "Clinic/PutPrintSetting/" + this.authService.userId,
      printSetting
    );
  }

  // =====> get/set diseaseName setting:
  getDiseasesSetting() {
    return this.http.get<DiseaseQuestion[]>(
      this.baseUrl +
        "Doctor/GetDiseasesQuestions/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }
  saveDiseasesSetting(diseases: string) {
    return this.http.put(
      this.baseUrl +
        "Doctor/PutDiseasesQuestions/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        diseases,
      {}
    );
  }

  // =====> get/set record items setting:
  getRecordItemsSetting() {
    return this.http.get<Recorditem[]>(
      this.baseUrl +
        "Doctor/GetRecordSections/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId
    );
  }
  saveRecordItemsSetting(recordItems: string) {
    return this.http.put(
      this.baseUrl +
        "Doctor/PutRecordSections/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        recordItems,
      {}
    );
  }

  // =====> get/set users setting:
  getUsersSetting() {
    return this.http.get<GetUser[]>(
      this.baseUrl +
        "Clinic/GetClinicUsers/" +
        this.authService.userId +
        "/" +
        this.authService.clinicId
    );
  }
  saveUserActiveSetting(userId: string, isActive: boolean) {
    return this.http.put(
      this.baseUrl +
        "User/PutUserActive/" +
        this.authService.userId +
        "/" +
        userId +
        "/" +
        isActive,
      {}
    );
  }
}
