import { AlertService } from './../../../services/alert.service';
import { PatientsService } from './../../../../pages/patients/patients.service';
import { Subscription } from 'rxjs';
import { Router, ActivatedRoute } from "@angular/router";
import { Component, OnInit, OnDestroy } from "@angular/core";

import { ReferralsService } from "./../../../../pages/patients/patient-details/referrals/referrals.service";
import { RequestsService } from "./../../../../pages/patients/patient-details/requests/requests.service";
import { SettingsService } from "./../../../../pages/settings/settings.service";
import { MedicinesService } from "../../../../pages/patients/patient-details/medicines/medicines.service";
import { GetPrintSetting } from "../../../../pages/settings/settings.model";
import { PrescriptionForPrint } from '../../../../pages/patients/patient-details/medicines/medicines.model';

@Component({
  selector: "print-medicines",
  templateUrl: "./print-medicines.component.html",
  styleUrls: ["./print-medicines.component.scss"]
})
export class PrintMedicinesComponent implements OnInit, OnDestroy {
  printInfoSetting: GetPrintSetting;
  printType: string;
  prescription: PrescriptionForPrint;
  requests: any[];
  referrals: any[];

  printSubs:Subscription;

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private medicineService: MedicinesService,
    private requestService: RequestsService,
    private referralService: ReferralsService,
    private settingsService: SettingsService,
    private alertService:AlertService
  ) {}

  ngOnInit() {
    this.printSubs = this.settingsService.getPrintSetting().subscribe(
      (res: GetPrintSetting) => {
        this.printInfoSetting = res;
        this.printType = this.route.snapshot.queryParamMap.get("type");
        if (this.printType == "medicine") {
          this.prescription = this.medicineService.prescriptionForPrint;
        }
        if (this.printType == "request") {
          this.requests = this.requestService.requestsForPrint;
        }
        if (this.printType == "referral") {
          this.referrals = this.referralService.referralForPrint;
        }
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
      }
    );
  }

  onImageLoad(event) {
    if (this.printType == "medicine") {
      this.router.navigate(["/pages/patients/details", this.prescription.patientCodeId, "prescription"]);
    }
    if (this.printType == "request") {
      this.router.navigate(["/pages/patients/details", this.prescription.patientCodeId, "request"]);
    }
    if (this.printType == "referral") {
      this.router.navigate(["/pages/patients/details", this.prescription.patientCodeId, "referral"]);
    }
  }

  ngOnDestroy() {
    window.print();
    this.printSubs.unsubscribe();
  }
}
