import { Injectable } from "@angular/core";
import { PatientVisit, PatientVisits } from "./visits.model";

@Injectable({
  providedIn: "root"
})
export class VisitsService {
  constructor() {}

  getVisitsList(patientCodeId: number): PatientVisits {
    // =====> (send codeId and clinicId to database to get visits list):
    const visits: PatientVisits = {
      patientId: "sadfdasfa",
      patientName: "محمد السيد أحمد",
      patientVisits: [
        {
          bookId: 1,
          date: new Date("2020/3/15"),
          type: "Diagnose",
          servcies: ["Sonar", "X-Ray"],
          isEnter: true,
          isCanceled: false
        },
        {
          bookId: 2,
          date: new Date("2020/3/6"),
          type: "Consult",
          servcies: ["Analysis"],
          isEnter: false,
          isCanceled: true
        },
        {
          bookId: 3,
          date: new Date("2020/2/15"),
          type: "Urgent Diagnose",
          servcies: [],
          isEnter: false,
          isCanceled: false
        }
      ]
    };
    return visits;
  }
}
