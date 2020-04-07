import { Injectable } from "@angular/core";
import {
  PatientExamination,
  PatientExaminationsDetails,
} from "./examination.model";

@Injectable({
  providedIn: "root",
})
export class ExaminationService {
  constructor() {}

  getExaminationTypes(): string[] {
    return ["تورم بالجسم", "طفح جلدي"];
  }

  getExaminationAreas(): string[] {
    return ["القدم اليسرى", "اليد اليمنى"];
  }

  getPatientExaminations(): PatientExaminationsDetails {
    return {
      weight: 75,
      length: 175,
      mass: 354,
      pressure: 2,
      temperature: 36.5,
      examinations: [
        {
          id: 1,
          type: "طفح جلدي",
          isTypeValid: true,
          area: "اليد اليمنى",
          isAreaValid: true,
          createdOn: new Date(),
        },
        {
          id: 2,
          type: "تورم بالجسم",
          isTypeValid: true,
          area: "القدم اليسرى",
          isAreaValid: true,
          createdOn: new Date(),
        },
      ],
    };
  }

  setPatientExaminations(patientExaminations: PatientExaminationsDetails) {}
}
