import { Injectable } from "@angular/core";
import {
  ComplaintDetailsValue,
  PatientComplaintDetails,
  PatientGeneralComplaint,
  ComplaintGeneralValue,
} from "./complaints.model";

@Injectable({
  providedIn: "root",
})
export class ComplaintsService {
  constructor() {}

  getComplaintsGeneralValues(): ComplaintGeneralValue[] {
    return [
      {
        compId: 1,
        compName: "تورم بالقدمين",
      },
      {
        compId: 2,
        compName: "آلام الركبة",
      },
    ];
  }

  getComplaintsDetailsValues(): ComplaintDetailsValue[] {
    return [
      {
        compId: 1,
        compName: "Pain",
        compChoises: [
          {
            choiceId: 1,
            choiceName: "EXERTIONAL",
          },
          {
            choiceId: 2,
            choiceName: "NOCTURNAL",
          },
          {
            choiceId: 3,
            choiceName: "WAKES FROM SLEEP",
          },
        ],
      },
      {
        compId: 2,
        compName: "Onest",
        compChoises: [
          {
            choiceId: 4,
            choiceName: "SUDDEN",
          },
          {
            choiceId: 5,
            choiceName: "GRADUAL",
          },
          {
            choiceId: 6,
            choiceName: "POST - PARTUM",
          },
        ],
      },
      {
        compId: 3,
        compName: "Course",
        compChoises: [
          {
            choiceId: 7,
            choiceName: "PROGRESSIVE",
          },
          {
            choiceId: 8,
            choiceName: "REGRESSIVE",
          },
          {
            choiceId: 9,
            choiceName: "PALINDROMIC",
          },
        ],
      },
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
