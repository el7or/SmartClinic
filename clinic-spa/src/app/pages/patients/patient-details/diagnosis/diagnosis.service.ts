import { Injectable } from "@angular/core";
import { PatientDiagnosis, DiagnosisValue } from "./diagnosis.model";

@Injectable({
  providedIn: "root",
})
export class DiagnosisService {
  constructor() {}

  getDiagnosisValues(): string[] {
    return ["التشخيص 1", "التشخيص 2", "التشخيص 3"];
  }

  getPatientDiagnosis(): PatientDiagnosis[] {
    return [
      {
        id: 1,
        name: "التشخيص 1",
        isNameValid: true,
        grade: 1,
        note: "",
        createdOn: new Date()
      },
      {
        id: 2,
        name: "التشخيص 2",
        isNameValid: true,
        grade: 3,
        note: "",
        createdOn: new Date()
      },
    ];
  }

  setPatientDiagnosis(patientDiagnosis: PatientDiagnosis[]) {}
}
