import { Injectable } from "@angular/core";

import {
  Disease,
  PrintInfo,
  Recorditem,
  BookingTypePrice,
  BookingSetting,
  BookingServicePrice,
  BookingDiscountPrice
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
    isSameTimeAllDays:true,
    workDaysTimes: [
      {
        day: 6,
        dayTitle: "Saturday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 0,
        dayTitle: "Sunday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 1,
        dayTitle: "Monday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 2,
        dayTitle: "Tuesday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 3,
        dayTitle: "Wednesday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 4,
        dayTitle: "Thursday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      },
      {
        day: 5,
        dayTitle: "Friday",
        isDayActive: true,
        timeFrom: new Date(2020, 1, 1, 8, 0, 0, 0),
        timeTo: new Date(2020, 1, 1, 22, 0, 0, 0)
      }
    ],
    bookingPeriod: 15,
    sortBookings: "manual",
    ConsultExpireDays: 15,
    bookingTypePrices: [
      {
        id: 1,
        type: "diagnose",
        title: "Diagnose",
        price: 50
      },
      {
        id: 2,
        type: "consult",
        title: "Consult",
        price: 20
      },
      {
        id: 3,
        type: "justService",
        title: "Just Service",
        price: 0
      },
      {
        id: 4,
        type: "urgentDiagnos",
        title: "Urgent Diagnose",
        price: 120
      }
    ],
    bookingServicePrices: [
      {
        id: 1,
        service: "xray",
        title: "X-Ray",
        price: 200
      },
      {
        id: 2,
        service: "sonar",
        title: "Sonar",
        price: 150
      },
      {
        id: 3,
        service: "laser",
        title: "Laser Session",
        price: 70
      }
    ],
    bookingDiscountPrices: [
      {
        id: 1,
        discount: "all",
        title: "خصم كامل",
        price: 100,
        isPercent:true
      },
      {
        id: 2,
        discount: "half",
        title: "خصم النصف",
        price: 50,
        isPercent:true
      },
      {
        id: 3,
        discount: "quarter",
        title: "خصم الربع",
        price: 25,
        isPercent:true
      },
      {
        id: 4,
        discount: "الأطباء",
        title: "نقابة الأطباء",
        price: 30,
        isPercent:false
      },
      {
        id: 5,
        discount: "المحامين",
        title: "نقابة المحامين",
        price: 15,
        isPercent:false
      }
    ]
  };

  printInfo: PrintInfo = {
    doctorName: "دكتور بهاء علي قرنة",
    doctorDegree: "أستاذ جراحة العظام والمفاصل جامعة الأزهر",
    clinicTitle: "مركز العظام والمفاصل للأطفال والكبار",
    logoUrl:"",
    phone1: "01254215215",
    phone2: "02315251512",
    phone3: "",
    address1: "المهندسين شارع نجيب محفوظ عمارة 5 شقة 6",
    address2: "شارع القصر العيني بجوار حدائق الأهرام الدور الخامس",
    address3: ""
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
    this.bookingSettings.workdays = bookingSetting.workDaysTimes
      .filter(d => d.isDayActive)
      .map(day => {
        return day.day;
      });
    this.bookingSettings.weekEnds = bookingSetting.workDaysTimes
      .filter(d => !d.isDayActive)
      .map(day => {
        return day.day;
      });
    this.bookingSettings.bookingTimeFrom = bookingSetting.bookingTimeFrom;
    this.bookingSettings.bookingTimeTo = bookingSetting.bookingTimeTo;
    this.bookingSettings.bookingPeriod = bookingSetting.bookingPeriod;
    this.bookingSettings.sortBookings = bookingSetting.sortBookings;
    this.bookingSettings.ConsultExpireDays = bookingSetting.ConsultExpireDays;
  }
  savePricesSetting(
    typePrices: BookingTypePrice[],
    servicePrices: BookingServicePrice[],
    discountPrices:BookingDiscountPrice[]
  ): void {
    this.bookingSettings.bookingTypePrices = typePrices;
    this.bookingSettings.bookingServicePrices = servicePrices;
    this.bookingSettings.bookingDiscountPrices = discountPrices
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
