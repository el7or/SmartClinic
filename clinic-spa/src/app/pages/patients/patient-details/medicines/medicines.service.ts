import { Injectable } from "@angular/core";
import { HttpClient } from "@angular/common/http";

import {
  GetPatientPrescriptions,
  PatientPrescription,
  PrescriptionForPrint,
} from "./medicines.model";
import { environment } from "../../../../../environments/environment";
import { AuthService } from "../../../../auth/auth.service";
import { PatientsService } from "../../patients.service";
import {
  AnyPatientFileValue,
  ItemsType,
} from "../../../settings/patient-setting/record-items-setting/record-items-setting.model";

@Injectable({
  providedIn: "root",
})
export class MedicinesService {
  baseUrl = environment.API_URL;

  private _prescriptionForPrint: PrescriptionForPrint;
  public get prescriptionForPrint(): PrescriptionForPrint {
    return this._prescriptionForPrint;
  }
  public set prescriptionForPrint(v: PrescriptionForPrint) {
    this._prescriptionForPrint = v;
  }

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private patientService: PatientsService
  ) {}

  getPatientPrescriptions() {
    return this.http.get<GetPatientPrescriptions>(
      this.baseUrl +
        "PatientDetails/GetPatientPresc/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId
    );
  }

  savePatientPrescription(patientPrescription: PatientPrescription) {
    return this.http.post(
      this.baseUrl +
        "PatientDetails/PostPatientPresc/" +
        this.authService.userId +
        "/" +
        this.patientService.patientId +
        "/" +
        this.authService.doctorId,
      patientPrescription
    );
  }

  sendPatientPrescription(prescId: number, pharmacyId: string) {
    return this.http.get(
      this.baseUrl +
        "PatientDetails/SendPresc/" +
        this.authService.userId +
        "/" +
        prescId +
        "/" +
        pharmacyId
    );
  }

  postMedicineValue(medicineValue: string) {
    const postObj: AnyPatientFileValue = {
      id: 0,
      text: medicineValue,
    };
    return this.http.post<AnyPatientFileValue>(
      this.baseUrl +
        "RecordSetting/" +
        this.authService.userId +
        "/" +
        this.authService.doctorId +
        "/" +
        ItemsType.Medicine,
      postObj
    );
  }
}
