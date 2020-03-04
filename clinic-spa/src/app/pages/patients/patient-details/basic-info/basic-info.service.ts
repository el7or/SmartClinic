import { BehaviorSubject } from "rxjs";
import { Injectable } from "@angular/core";

import { BasicInfo } from "./basic-info.model";

@Injectable({
  providedIn: "root"
})
export class BasicInfoService {
  isNewPatient: boolean;

  constructor() {}

  // =====> get patient info by id:
  getPatientInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get all data for patient:
    const patientInfo: BasicInfo = {
      id: "dfgfdgsgd",
      name: "محمد أحمد السيد",
      mobile: "01545454645",
      age: 33,
      gender: true,
      status: "married",
      career: "مدرس",
      city: "Giza",
      area: "السادس من أكتوبر ",
      visitsCount: 15
    };
    return patientInfo;
  }
}
