import { Router } from "@angular/router";
import { Component, OnInit, AfterViewInit } from "@angular/core";

import { MedicinesService } from "../../../../pages/patients/patient-details/medicines/medicines.service";

@Component({
  selector: "print-medicines",
  templateUrl: "./print-medicines.component.html",
  styleUrls: ["./print-medicines.component.scss"]
})
export class PrintMedicinesComponent implements OnInit, AfterViewInit {
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
    private medicineService: MedicinesService
  ) {}

  ngOnInit() {
    this.medicines = this.medicineService.medicinesForPrint;
  }

  ngAfterViewInit() {
    setTimeout(() => {
      window.print();
      this.router.navigate(["/pages/patients/details", 1, "prescription"]);
    }, 1000);
  }
}
