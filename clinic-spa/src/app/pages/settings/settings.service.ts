import { Injectable } from "@angular/core";

import { Question } from "./settings.model";

@Injectable({
  providedIn: "root"
})
export class SettingsService {
  workdays: number[] = [0, 1, 2, 3, 4, 5, 6];
  sortBookingsBy: string = "manual";
  questionsList: Question[] = [
    {
      id: 1,
      question: "Do you have blood pressure",
      isActive: true
    },
    {
      id: 2,
      question: "Do you have blood thinners",
      isActive: true
    },
    {
      id: 3,
      question: "Do you have diabetes",
      isActive: true
    },
    {
      id: 4,
      question: "Do you have heart disease",
      isActive: true
    },
    {
      id: 5,
      question: "Do you have liver disease",
      isActive: true
    },
    {
      id: 6,
      question: "Do you have kidney disease",
      isActive: true
    },
    {
      id: 7,
      question: "Do you have chest diseases",
      isActive: true
    },
    {
      id: 8,
      question: "Do you have psoriasis",
      isActive: true
    },
    {
      id: 9,
      question: "Do you have thyroid disorders",
      isActive: true
    },
    {
      id: 10,
      question: "Do you have a pregnancy",
      isActive: true
    },
    {
      id: 11,
      question: "Do you have breastfeeding",
      isActive: true
    },
    {
      id: 12,
      question: "Have you had any surgery in the last six months",
      isActive: true
    }
  ];

  constructor() {}

  // =====> get/set clinic setting:
  getClinicSetting() {}
  saveClinicSetting(days: number[], sortBy): void {
    this.workdays = days;
    this.sortBookingsBy = sortBy;
  }

  // =====> get week end days to disable it in datepickers & calendar:
  getWeekEndsDays(): number[] {
    const weekDays = [0, 1, 2, 3, 4, 5, 6];
    let Weekend = weekDays.filter(item => this.workdays.indexOf(item) < 0);
    return Weekend;
  }

  // =====> get/set questions setting:
  getQuestionSetting() {
    return this.questionsList;
  }
  saveQuestionSetting(questions: Question[]) {
    questions = this.questionsList;
  }
}
