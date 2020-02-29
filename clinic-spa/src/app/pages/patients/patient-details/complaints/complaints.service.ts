import { Injectable } from "@angular/core";
import {
  ComplaintDetailsValue,
  PatientComplaintDetails,
  PatientGeneralComplaint
} from "./complaints.model";

@Injectable({
  providedIn: "root"
})
export class ComplaintsService {
  constructor() {}

  getComplaintsGeneralValues(): string[] {
    return ["تورم بالقدمين", "آلام الركبة"];
  }

  getComplaintsDetailsValues(): ComplaintDetailsValue[] {
    return [
      {
        compId: 1,
        compName: "Pain",
        compChoises: [
          "EXERTIONAL",
          "WEIGHT  BEARING",
          "NOCTURNAL",
          "WAKES FROM SLEEP"
        ]
      },
      {
        compId: 2,
        compName: "Onest",
        compChoises: ["GRADUAL", "SUDDEN", "POST - PARTUM"]
      },
      {
        compId: 3,
        compName: "Course",
        compChoises: [
          "PROGRESSIVE",
          "REGRESSIVE",
          "INTERMITTENT",
          "PALINDROMIC",
          "MIGRATORY",
          "REMITTIVE"
        ]
      }
    ];
  }

  getPatientGeneralComplaints(patientId: string): PatientGeneralComplaint[] {
    return [];
  }
  setPatientGeneralComplaints(patientComplaints: PatientGeneralComplaint[]) {}

  getPatientDetailsComplaints(patientId: string): PatientComplaintDetails[] {
    return [];
  }
  setPatientDetailsComplaints(patientComplaints: PatientComplaintDetails[]) {}
}
