import { Injectable } from "@angular/core";

import {
  Disease,
  PrintInfo,
  Recorditem,
  BookingTypePrice,
  BookingSetting,
  BookingServicePrice
} from "./settings.model";

@Injectable({
  providedIn: "root"
})
export class SettingsService {
  bookingSettings: BookingSetting = {
    workdays: [6, 0, 1, 2, 3, 4, 5],
    weekEnds: [],
    bookingTimeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
    bookingTimeTo: new Date(2020, 1, 1, 22, 0, 0, 0),
    bookingPeriod: 15,
    sortBookings: "manual",
    bookingTypePrices: [
      {
        id: 1,
        type: "diagnose",
        title: "Diagnose",
        price: 50,
        isActive: true
      },
      {
        id: 2,
        type: "consult",
        title: "Consult",
        price: 20,
        isActive: true
      },
      {
        id: 3,
        type: "justService",
        title: "Just Service",
        price: 0,
        isActive: true
      },
      {
        id: 4,
        type: "urgentDiagnos",
        title: "Urgent Diagnose",
        price: 120,
        isActive: true
      }
    ],
    bookingServicePrices: [
      {
        id: 1,
        service: "xray",
        title: "X-Ray",
        price: 200,
        isActive: true
      },
      {
        id: 2,
        service: "sonar",
        title: "Sonar",
        price: 150,
        isActive: true
      },
      {
        id: 3,
        service: "laser",
        title: "Laser Session",
        price: 70,
        isActive: true
      }
    ]
  };

  printInfo: PrintInfo = {
    doctorName: "دكتور بهاء علي قرنة",
    doctorDegree: "أستاذ جراحة العظام والمفاصل جامعة الأزهر",
    clinicTitle: "مركز العظام والمفاصل للأطفال والكبار",
    phone1: "01254215215",
    phone2: "02315251512",
    phone3: "",
    address1: "المهندسين شارع نجيب محفوظ عمارة 5 شقة 6",
    address2: ""
  };
  diseasesList: Disease[] = [
    {
      id: 1,
      diseaseName: "Blood pressure",
      questionText: "Do you have blood pressure",
      isActive: true
    },
    {
      id: 2,
      diseaseName: "Blood thinners",
      questionText: "Do you have blood thinners",
      isActive: true
    },
    {
      id: 3,
      diseaseName: "Diabetes",
      questionText: "Do you have diabetes",
      isActive: true
    },
    {
      id: 4,
      diseaseName: "Heart disease",
      questionText: "Do you have heart disease",
      isActive: true
    },
    {
      id: 5,
      diseaseName: "Liver disease",
      questionText: "Do you have liver disease",
      isActive: true
    },
    {
      id: 6,
      diseaseName: "Kidney disease",
      questionText: "Do you have kidney disease",
      isActive: true
    },
    {
      id: 7,
      diseaseName: "Chest diseases",
      questionText: "Do you have chest diseases",
      isActive: true
    },
    {
      id: 8,
      diseaseName: "Psoriasis",
      questionText: "Do you have psoriasis",
      isActive: true
    },
    {
      id: 9,
      diseaseName: "Thyroid disorders",
      questionText: "Do you have thyroid disorders",
      isActive: true
    },
    {
      id: 10,
      diseaseName: "Pregnancy",
      questionText: "Do you have a pregnancy",
      isActive: true
    },
    {
      id: 11,
      diseaseName: "Breastfeeding",
      questionText: "Do you have breastfeeding",
      isActive: true
    },
    {
      id: 12,
      diseaseName: "Surgery",
      questionText: "Have you had any surgery in the last six months",
      isActive: true
    }
  ];
  recordItems: Recorditem[] = [
    {
      id: 1,
      recordName: "Patient Complaint",
      isActive: true
    },
    {
      id: 2,
      recordName: "Patient History",
      isActive: true
    },
    {
      id: 3,
      recordName: "Examination",
      isActive: true
    },
    {
      id: 4,
      recordName: "Diagnosis",
      isActive: true
    },
    {
      id: 5,
      recordName: "X-Rays",
      isActive: true
    },
    {
      id: 6,
      recordName: "Analyses",
      isActive: true
    },
    {
      id: 7,
      recordName: "Operations",
      isActive: true
    }
  ];

  constructor() {}

  // =====> get/set booking setting:
  getBookingSetting(): BookingSetting {
    return this.bookingSettings;
  }
  saveBookingSetting(bookingSetting: BookingSetting): void {
    this.bookingSettings.workdays = bookingSetting.workdays;
    this.bookingSettings.weekEnds = [6, 0, 1, 2, 3, 4, 5].filter(
      item => this.bookingSettings.workdays.indexOf(item) < 0
    );
    this.bookingSettings.bookingTimeFrom = bookingSetting.bookingTimeFrom;
    this.bookingSettings.bookingTimeTo = bookingSetting.bookingTimeTo;
    this.bookingSettings.bookingPeriod = bookingSetting.bookingPeriod;
    this.bookingSettings.sortBookings = bookingSetting.sortBookings;
  }
  savePricesSetting(typePrices: BookingTypePrice[],servicePrices:BookingServicePrice[]): void{
    this.bookingSettings.bookingTypePrices = typePrices;
    this.bookingSettings.bookingServicePrices = servicePrices;
  }

  // =====> get/set diseaseName setting:
  getDiseasesSetting() {
    return this.diseasesList;
  }
  saveDiseasesSetting(diseases: Disease[]) {
    diseases = this.diseasesList;
  }

  // =====> get/set record items setting:
  getRecordItemsSetting() {
    return this.recordItems.sort((a, b) => a.id - b.id);
  }
  saveRecordItemsSetting(recordItems: Recorditem[]) {
    this.recordItems = recordItems;
  }
}
