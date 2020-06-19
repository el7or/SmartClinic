import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { AnyPatientFileValue, ItemsType } from "./record-items-setting.model";

@Injectable({
  providedIn: "root",
})
export class RecordItemsSettingService {
  baseUrl = environment.API_URL;

  constructor(private http: HttpClient, private authService: AuthService) {}

  getItemValues(type: ItemsType) {
    return this.http.get<AnyPatientFileValue[]>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        type
    );
  }

  postItemValues(item: AnyPatientFileValue, type: ItemsType) {
    return this.http.post<AnyPatientFileValue>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        type,
      item
    );
  }

  putItemValues(item: AnyPatientFileValue, type: ItemsType) {
    return this.http.put(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        type,
      item
    );
  }

  deleteItemValues(itemId: number, type: ItemsType) {
    return this.http.delete<AnyPatientFileValue[]>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        type +
        "/" +
        itemId
    );
  }
}
