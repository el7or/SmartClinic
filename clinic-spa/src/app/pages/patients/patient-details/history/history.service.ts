import { Injectable } from "@angular/core";

import { PatientHistory } from "./history.model";

@Injectable({
  providedIn: "root",
})
export class HistoryService {
  constructor() {}

  getPatientHistory(): PatientHistory {
    return {
      children: 4,
      socialStatus: 2,
      prevMarriage: 0,
      prevMarriagePartner: 0,
      familyHistory: "",
      treatmentHistory: "",
    };
  }

  setPatientHistory(patientHistory: PatientHistory) {}
}
