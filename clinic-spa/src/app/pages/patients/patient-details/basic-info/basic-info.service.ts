import { BehaviorSubject } from "rxjs";
import { Injectable } from "@angular/core";

import { BasicInfo, NewPatient, EditPatient } from "./basic-info.model";

@Injectable({
  providedIn: "root"
})
export class BasicInfoService {

  constructor() {}

  // =====> get patient info by id:
  getPatientInfo(patientCodeId: number) {
    // =====> send to api pacientId(codeId) + clinicId to get all data for patient:
    const basicInfo:BasicInfo={
      patientId: "dfgfdgsgd",
      name: "حاتم قطاوي",
      mobile: "01545454645",
      age: 33,
      gender: true,
      status: "married",
      career: "مدرس",
      city: "Giza",
      area: "السادس من أكتوبر "
    };
    return basicInfo;
  }

  // =====> save new patient:
  saveNewPatient(newPatient:NewPatient){
    // must create codeId for patient on clinic level not on doctor level
  }

  // =====> update basic info:
  updatePatientInfo(patientInfo:EditPatient){

  }
}
