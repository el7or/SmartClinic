import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class CitiesService {
  EgyptCities = [
    {
      "ar": "الإسكندرية",
      "en": "Alexandria"
    },
    {
      "ar": "الإسماعيلية",
      "en": "Ismailia"
    },
    {
      "ar": "أسوان",
      "en": "Aswan"
    },
    {
      "ar": "أسيوط",
      "en": "Asyut"
    },
    {
      "ar": "الأقصر",
      "en": "Luxor"
    },
    {
      "ar": "البحر الأحمر",
      "en": "Red Sea"
    },
    {
      "ar": "البحيرة",
      "en": "Beheira"
    },
    {
      "ar": "بني سويف ",
      "en": "Beni Suef"
    },
    {
      "ar": "بورسعيد",
      "en": "Port Said"
    },
    {
      "ar": "جنوب سيناء",
      "en": "South Sinai"
    },
    {
      "ar": "الجيزة",
      "en": "Giza"
    },
    {
      "ar": "الدقهلية",
      "en": "Dakahlia"
    },
    {
      "ar": "دمياط",
      "en": "Damietta"
    },
    {
      "ar": "سوهاج",
      "en": "Sohag"
    },
    {
      "ar": "السويس",
      "en": "Suez"
    },
    {
      "ar": "الشرقية",
      "en": "Sharqia"
    },
    {
      "ar": "شمال سيناء",
      "en": "North Sinai"
    },
    {
      "ar": "الغربية",
      "en": "Gharbia"
    },
    {
      "ar": "الفيوم",
      "en": "Faiyum"
    },
    {
      "ar": "القاهرة",
      "en": "Cairo"
    },
    {
      "ar": "القليوبية",
      "en": "Qalyubia"
    },
    {
      "ar": "قنا",
      "en": "Qena"
    },
    {
      "ar": "كفر الشيخ",
      "en": "Kafr El Sheikh"
    },
    {
      "ar": "مطروح",
      "en": "Matruh"
    },
    {
      "ar": "المنوفية",
      "en": "Monufia"
    },
    {
      "ar": "المنيا",
      "en": "Minya"
    },
    {
      "ar": "الوادي الجديد",
      "en": "New Valley"
    }
  ];


  constructor() { }
}
