import { Injectable } from "@angular/core";
import { Disease } from "./diseases.model";

@Injectable({
  providedIn: "root"
})
export class DiseasesService {
  diseasesList: Disease[] = [
    {
      id: 1,
      diseaseName: "Blood pressure",
      questionText: "Do you have blood pressure",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 2,
      diseaseName: "Blood thinners",
      questionText: "Do you have blood thinners",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 3,
      diseaseName: "Diabetes",
      questionText: "Do you have diabetes",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 4,
      diseaseName: "Heart disease",
      questionText: "Do you have heart disease",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 5,
      diseaseName: "Liver disease",
      questionText: "Do you have liver disease",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 6,
      diseaseName: "Kidney disease",
      questionText: "Do you have kidney disease",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 7,
      diseaseName: "Chest diseases",
      questionText: "Do you have chest diseases",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 8,
      diseaseName: "Psoriasis",
      questionText: "Do you have psoriasis",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 9,
      diseaseName: "Thyroid disorders",
      questionText: "Do you have thyroid disorders",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 10,
      diseaseName: "Pregnancy",
      questionText: "Do you have a pregnancy",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 11,
      diseaseName: "Breastfeeding",
      questionText: "Do you have breastfeeding",
      isActive: true,
      isYes: false,
      note: ""
    },
    {
      id: 12,
      diseaseName: "Surgery",
      questionText: "Have you had any surgery in the last six months",
      isActive: true,
      isYes: false,
      note: ""
    }
  ];

  constructor() {}

  getDiseasesList(patientId: string) {}
  setDiseasesList(patientId: string, patientDiseases: Disease[]) {}
}
