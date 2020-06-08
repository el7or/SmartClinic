import { Injectable, OnDestroy } from "@angular/core";
import { BehaviorSubject, Subscription } from "rxjs";
import { Title } from "@angular/platform-browser";
import { registerLocaleData } from "@angular/common";
import localeArabic from "@angular/common/locales/ar";
import localeEnglish from "@angular/common/locales/en";
import { NbLayoutDirectionService, NbLayoutDirection } from "@nebular/theme";

// @ts-ignore
import * as words from "../../../assets/locale/translation.json";

@Injectable({
  providedIn: "root",
})
export class LanggService implements OnDestroy {
  _words = [];
  language = new BehaviorSubject<string>(
    localStorage.getItem("langg") == "en" ? "en" : "ar"
  );
  lang = this.language.asObservable();
  langLoading = new BehaviorSubject<boolean>(false);
  langgSubscription: Subscription;

  _locale: string;
  set locale(value: string) {
    this._locale = value;
  }
  get locale(): string {
    return localStorage.getItem("langg") || "ar";
  }

  constructor(
    titleService: Title,
    private dirService: NbLayoutDirectionService
  ) {
    // =====> change language based on value of BehaviorSubject 'language':
    this.langgSubscription = this.lang.subscribe((lang) => {
      if (lang == "en") {
        localStorage.setItem("langg", "en");
        titleService.setTitle("Smart Clinic");
        this.registerCulture("en");
        if (this.dirService.isRtl) {
          this.dirService.setDirection(NbLayoutDirection.LTR);
        }
      } else {
        localStorage.setItem("langg", "ar");
        titleService.setTitle("العيادة الذكية");
        this.registerCulture("ar");
        if (this.dirService.isLtr) {
          this.dirService.setDirection(NbLayoutDirection.RTL);
        }
      }
    });

    // =====> get list of translations from json file:
    this._words = words.default;
  }

  ngOnDestroy() {
    this.langgSubscription.unsubscribe();
  }

  // =====> register culture for providers in app module:
  registerCulture(culture: string) {
    if (!culture) {
      return;
    }
    this.locale = culture;
    switch (culture) {
      case "ar": {
        registerLocaleData(localeArabic);
        break;
      }
      case "en": {
        registerLocaleData(localeEnglish);
        break;
      }
    }
  }

  // =====> translate any words from json file:
  translateWord(value) {
    try {
      let words = this._words.filter((o) =>
        Object.keys(o).some((k) => o[k] == value)
      );
      value = words[0][this.locale];
      return value;
    } catch (error) {
      return value;
    }
  }
}
