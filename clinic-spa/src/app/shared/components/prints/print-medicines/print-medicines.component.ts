import { Router, ActivatedRoute } from "@angular/router";
import { Component, OnInit, AfterViewInit } from "@angular/core";

import { RequestsService } from "./../../../../pages/patients/patient-details/requests/requests.service";
import { SettingsService } from "./../../../../pages/settings/settings.service";
import { MedicinesService } from "../../../../pages/patients/patient-details/medicines/medicines.service";

@Component({
  selector: "print-medicines",
  templateUrl: "./print-medicines.component.html",
  styleUrls: ["./print-medicines.component.scss"]
})
export class PrintMedicinesComponent implements OnInit, AfterViewInit {
  printInfoSetting: any;
  printType: string;
  medicines: any[];
  requests: any[];

  constructor(
    private router: Router,
    private route: ActivatedRoute,
    private medicineService: MedicinesService,
    private requestService: RequestsService,
    private settingsService: SettingsService
  ) {}

  ngOnInit() {
    this.printInfoSetting = this.settingsService.printInfo;

    // =====> check query param for type of print:
    this.printType = this.route.snapshot.queryParamMap.get("type");
    if (this.printType == "medicine") {
      this.medicines = this.medicineService.medicinesForPrint;
    }
    if (this.printType == "request") {
      this.requests = this.requestService.requestsForPrint;
    }
  }

  ngAfterViewInit() {
    setTimeout(() => {
      window.print();
      this.router.navigate(["/pages/patients/details", 1,8]);
    }, 1000);
  }
}
