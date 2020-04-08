import { Injectable } from "@angular/core";

import {
  OperationValue,
  PatientOperation,
  NewPatientOperation,
} from "./operations.model";

@Injectable({
  providedIn: "root",
})
export class OperationsService {
  constructor() {}

  getOperationsValues(): OperationValue[] {
    return [
      { id: 1, text: "جراحة" },
      { id: 2, text: "جبس" },
      { id: 3, text: "ولادة" },
    ];
  }

  getPatientOperations(): PatientOperation[] {
    return [
      {
        id: 1,
        type: "جبس",
        date: new Date("2020/05/01"),
        place: "الساق اليسرى",
        cost: 1500,
      },
      {
        id: 2,
        type: "تركيب مفصل",
        date: new Date("2010/05/01"),
        place: "الركبة اليمنى",
        cost: 48000,
      },
    ];
  }

  addPatientOperation(operation: NewPatientOperation) {}
}
