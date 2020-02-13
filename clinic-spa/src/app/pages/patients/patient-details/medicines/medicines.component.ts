import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { MedicinesSummaryComponent } from "./medicines-summary/medicines-summary.component";
import {
  PrintService,
  printSections
} from "./../../../../shared/services/print.service";

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"]
})
export class MedicinesComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
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
    public location: Location,
    private dialogService: NbDialogService,
    private printService: PrintService
  ) {}

  ngOnInit() {}

  onAddPrescription(form: NgForm) {}

  onOpenMedicinesSummary() {
    this.dialogService.open(MedicinesSummaryComponent, {
      context: {
        patientDetails: "روشتة المريض: أحمد محمد علي، بتاريخ: 15/3/2020"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onAddMedicine() {
    this.medicines.push({
      name: "",
      concentration: "",
      form: "",
      dose: "",
      timing: "",
      period: ""
    });
  }

  onRemoveMedicine(index) {
    this.medicines.splice(index, 1);
  }

  onSavePrint() {
    this.formLoading = true;
    this.printService.printSection.next(printSections.printMedicines);
    setTimeout(() => {
      window.print();
      this.formLoading = false;
      this.doneSwal.fire();
    }, 1000);
  }
}
