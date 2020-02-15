import { SettingsService } from './../../../../pages/settings/settings.service';
import { Router } from "@angular/router";
import { Component, OnInit, AfterViewInit } from "@angular/core";

import { MedicinesService } from "../../../../pages/patients/patient-details/medicines/medicines.service";

@Component({
  selector: "print-medicines",
  templateUrl: "./print-medicines.component.html",
  styleUrls: ["./print-medicines.component.scss"]
})
export class PrintMedicinesComponent implements OnInit, AfterViewInit {
  printInfoSetting:any;
  medicines: any[] = [
    {
      name: "",
      concentration: "",
      form: "",
      dose: "",
      timing: "",
      period: ""
    }
  ];

  constructor(
    private router: Router,
    private medicineService: MedicinesService,
    private settingsService:SettingsService
  ) {}

  ngOnInit() {
    this.medicines = this.medicineService.medicinesForPrint;
    this.printInfoSetting =  this.settingsService.printInfo;
  }

  ngAfterViewInit() {
    setTimeout(() => {
      window.print();
      this.router.navigate(["/pages/patients/details", 1],{queryParams:{tab:8}});
    }, 1000);
  }
}
