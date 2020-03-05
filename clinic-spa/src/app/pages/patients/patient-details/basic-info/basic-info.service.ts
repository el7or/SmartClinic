import { BehaviorSubject } from "rxjs";
import { Injectable } from "@angular/core";

import { BasicInfo, NewPatient, EditPatient } from "./basic-info.model";

@Injectable({
  providedIn: "root"
})
export class BasicInfoService {
  patientInfo = new BehaviorSubject<BasicInfo>(null);

  constructor() {}

  // =====> get patient info by id:
  getPatientInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get all data for patient:
    this.patientInfo.next({
      id: "dfgfdgsgd",
      name: "حاتم قطاوي",
      mobile: "01545454645",
      age: 33,
      gender: true,
      status: "married",
      career: "مدرس",
      city: "Giza",
      area: "السادس من أكتوبر ",
      visitsCount: 15
    });
    return this.patientInfo.asObservable();
  }

  // =====> save new patient:
  saveNewPatient(newPatient:NewPatient){

  }

  // =====> update basic info:
  updatePatientInfo(patientInfo:EditPatient){

  }
}
