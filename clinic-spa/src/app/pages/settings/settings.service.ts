import { Injectable } from "@angular/core";

import {
  Disease,
  PrintInfo,
  Recorditem,
  BookingTypePrice,
  BookingSetting
} from "./settings.model";

@Injectable({
  providedIn: "root"
})
export class SettingsService {
  workdays: number[] = [6, 0, 1, 2, 3, 4, 5];
  sortBookingsBy: string = "manual";
  bookingTimeFrom: Date = new Date(2020, 1, 1, 8, 0, 0, 0);
  bookingTimeTo: Date = new Date(2020, 1, 1, 22, 0, 0, 0);
  bookingPeriod: string = "30m";

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
  bookingTypePrices: BookingTypePrice[] = [
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
      type: "urgentDiagnos",
      title: "Urgent Diagnose",
      price: 120,
      isActive: true
    }
  ];

  constructor() {}

  // =====> get/set booking setting:
  getBookingSetting() {}
  saveBookingSetting(bookingSetting: BookingSetting): void {
    this.workdays = bookingSetting.workdays;
    this.sortBookingsBy = bookingSetting.sortBookings;
    this.bookingTimeFrom = bookingSetting.bookingTimeFrom;
    this.bookingTimeTo = bookingSetting.bookingTimeTo;
    this.bookingPeriod = bookingSetting.bookPeriod;
  }

  // =====> get week end days to disable it in datepickers & calendar:
  getWeekEndsDays(): number[] {
    const weekDays = [6, 0, 1, 2, 3, 4, 5];
    let Weekend = weekDays.filter(item => this.workdays.indexOf(item) < 0);
    return Weekend;
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

  // =====> get/set bookings types prices:
  getBookingTypePrices() {
    return this.bookingTypePrices.sort((a, b) => a.id - b.id);
  }
  saveBookingTypePrices(bookingPrices: BookingTypePrice[]) {
    this.bookingTypePrices = bookingPrices;
  }
}
