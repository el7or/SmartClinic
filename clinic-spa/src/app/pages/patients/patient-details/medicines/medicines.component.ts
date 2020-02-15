import { Router } from "@angular/router";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { NgForm, NgModel } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { MedicinesService } from "./medicines.service";
import { MedicinesSummaryComponent } from "./medicines-summary/medicines-summary.component";
import { medicinesValues } from './medicines.model';

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"]
})
export class MedicinesComponent implements OnInit {
  formLoading: boolean = false;
  medicinesValues:medicinesValues;
  noResultAutoComplete: boolean = false;
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

  ngOnInit() {
    this.medicinesValues = this.medicineService.medicinesValues;
  }

  // =====> on add new row in prescription:
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

  // =====> on remove row from prescription:
  onRemoveMedicine(index) {
    this.medicines.splice(index, 1);
  }

  // =====> on add new medication name to medicines list:
  onAddNewMedicinetoList(input:NgModel) {
    if(!this.medicinesValues.names.find(n => n==input.value)){
    this.medicinesValues.names.push(input.value);
    }
    input.reset();
    this.doneSwal.fire();
  }

  // =====> on save prescription without print:
  onSave(form: NgForm) {}

    // =====> on save prescription with print:
  onSavePrint(form: NgForm) {
    this.formLoading = true;
    if (form.value.note) {
      this.medicines.push({
        name: form.value.note,
        concentration: "",
        form: "",
        dose: "",
        timing: "",
        period: ""
      });
    }
    this.medicineService.medicinesForPrint = this.medicines;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigateByUrl("/print/medicines");
    }, 1000);
  }

  // =====> on click on info icon in table of previuos prescriptions:
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
}
