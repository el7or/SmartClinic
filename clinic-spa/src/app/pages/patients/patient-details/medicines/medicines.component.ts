import { Router } from "@angular/router";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { MedicinesService } from "./medicines.service";
import { MedicinesSummaryComponent } from "./medicines-summary/medicines-summary.component";

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
    private router: Router,
    private medicineService: MedicinesService
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

  onSave() {
    this.formLoading = true;
    setTimeout(() => {
      this.formLoading = false;
      this.doneSwal.fire();
      this.medicines = [
        {
          name: "",
          concentration: "",
          form: "",
          dose: "",
          timing: "",
          period: ""
        }
      ];
    }, 1000);
  }

  onSavePrint(form) {
    this.medicines.push({
      name: form.value.note,
      concentration: "",
      form: "",
      dose: "",
      timing: "",
      period: ""
    })
    this.formLoading = true;
    this.medicineService.medicinesForPrint = this.medicines;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigateByUrl("/print/medicines");
    }, 1000);
  }
}
