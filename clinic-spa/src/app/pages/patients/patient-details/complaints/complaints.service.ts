import { Injectable } from "@angular/core";
import { ComplaintValue, PatientComplaint } from "./complaints.model";

@Injectable({
  providedIn: "root"
})
export class ComplaintsService {
  complaintsValues: ComplaintValue[];
  patientComplaints: PatientComplaint[];

  constructor() {}

  getComplaintsValues():ComplaintValue[] {
    this.complaintsValues = [
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
        compChoises: [
          "GRADUAL",
          "SUDDEN",
          "POST - PARTUM"
        ]
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
      },
    ];
    return this.complaintsValues;
  }

  getPatientComplaints(patientId: string): PatientComplaint[] {
    // =====> if no complaints for this patient:
    /* this.patientComplaints = [{
      compId : 1,
      compName: "Pain",
      choiseName: "EXERTIONAL",
      period:"",
      note:"",
      allChoises:[]
    }] */
    return this.patientComplaints;
  }
  setPatientComplaints(patientComplaints: PatientComplaint[]) {}
}
