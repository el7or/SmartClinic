import { Injectable } from "@angular/core";
import { XraysList, XrayDetails } from "./xrays.model";

@Injectable({
  providedIn: "root",
})
export class XraysService {
  constructor() {}

  getXraysList(patientId: string): XraysList[] {
    return [
      {
        id: 1,
        xrayName: "PLAIN X RAY FILM",
        xrayArea: "القدم اليمنى",
        requestDate: new Date("2020-5-2"),
        isHasResult: true,
        resultDate: new Date("2020-5-7"),
        resultGrade: 1,
      },
      {
        id: 2,
        xrayName: "ISOTOPIC SCAN",
        xrayArea: "اليد اليسرى",
        requestDate: new Date("2020-4-1"),
        isHasResult: true,
        resultDate: new Date("2020-5-2"),
        resultGrade: 3,
      },
      {
        id: 3,
        xrayName: "ULTRASONOGRAPHY",
        xrayArea: "الظهر",
        requestDate: new Date("2020-5-2"),
        isHasResult: false,
        resultGrade: 0,
      },
    ];
  }

  getXrayDetails(xrayId: number): XrayDetails {
    return {
      id: 2,
      xrayName: "PLAIN X RAY FILM",
      xrayArea: "القدم اليمنى",
      requestDate: new Date("2020-5-2"),
      isHasResult: true,
      resultGrade: 1,
      resultDate: new Date("2020-5-7"),
      xraysFiles: [
        {
          id: 1,
          uploadDate: new Date("5/6/2020"),
          fileType: "X-Ray Image",
          fileUrl: "../../../../../../assets/images/team.png",
        },
        {
          id: 2,
          uploadDate: new Date("12/6/2020"),
          fileType: "Report File",
          fileUrl: "../../../../../../assets/images/team.png",
          fileNote: "مطلوب الإعادة",
        },
      ],
    };
  }
}
