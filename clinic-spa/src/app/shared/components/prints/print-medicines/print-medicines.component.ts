import { Subscription } from 'rxjs';
import { ReferralsService } from "./../../../../pages/patients/patient-details/referrals/referrals.service";
import { Router, ActivatedRoute } from "@angular/router";
import { Component, OnInit, OnDestroy } from "@angular/core";

import { RequestsService } from "./../../../../pages/patients/patient-details/requests/requests.service";
import { SettingsService } from "./../../../../pages/settings/settings.service";
import { MedicinesService } from "../../../../pages/patients/patient-details/medicines/medicines.service";
import { GetPrintSetting } from "../../../../pages/settings/settings.model";

@Component({
  selector: "print-medicines",
  templateUrl: "./print-medicines.component.html",
  styleUrls: ["./print-medicines.component.scss"]
})
export class PrintMedicinesComponent implements OnInit, OnDestroy {
  printInfoSetting: GetPrintSetting;
  printType: string;
  medicines: any[];
  requests: any[];
  referrals: any[];

  printSubs:Subscription;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private medicineService: MedicinesService,
    private requestService: RequestsService,
    private referralService: ReferralsService,
    private settingsService: SettingsService
  ) {}

  ngOnInit() {
    this.printSubs = this.settingsService.getPrintSetting().subscribe(
      (res:GetPrintSetting) => {
        this.printInfoSetting = res;
        // =====> check query param for type of print:
    this.printType = this.route.snapshot.queryParamMap.get("type");
    if (this.printType == "medicine") {
      //this.medicines = this.medicineService.medicinesForPrint;
    }
    if (this.printType == "request") {
      this.requests = this.requestService.requestsForPrint;
    }
    if (this.printType == "referral") {
      this.referrals = this.referralService.referralForPrint;
    }
      },
      err => {
        console.error(err);
      }
    );
  }

  onImageLoad(event) {
    if (this.printType == "medicine") {
      this.router.navigate(["/pages/patients/details", 1, "prescription"]);
    }
    if (this.printType == "request") {
      this.router.navigate(["/pages/patients/details", 1, "request"]);
    }
    if (this.printType == "referral") {
      this.router.navigate(["/pages/patients/details", 1, "referral"]);
    }
  }

  ngOnDestroy() {
    window.print();
    this.printSubs.unsubscribe();
  }
}
