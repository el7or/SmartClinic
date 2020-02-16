import { Router } from "@angular/router";
import { NbDialogService, NbLayoutScrollService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { NgForm, } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { MedicinesService } from "./medicines.service";
import { MedicinesSummaryComponent } from "./medicines-summary/medicines-summary.component";
import { medicinesValues } from "./medicines.model";

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"]
})
export class MedicinesComponent implements OnInit {
  formLoading: boolean = false;
  medicinesValues: medicinesValues;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  medicines: any[] = [
    {
      name: "",
      isNameValid: true,
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
    private medicineService: MedicinesService,
    private scrollService:NbLayoutScrollService
  ) {}

  ngOnInit() {
    this.medicinesValues = this.medicineService.medicinesValues;
  }

  // =====> on add new row in prescription:
  onAddMedicine() {
    this.medicines.push({
      name: "",
      isNameValid: true,
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
  onAddNewMedicineToList(medicineName) {
    this.medicinesValues.names.push(medicineName);
    this.doneSwal.fire();
  }

  // =====> on save prescription without print:
  onSave(form: NgForm) {
    this.medicines = [
      {
        name: "",
        isNameValid: true,
        concentration: "",
        form: "",
        dose: "",
        timing: "",
        period: ""
      }
    ];
    this.doneSwal.fire();
  }

  // =====> on save prescription with print:
  onSavePrint(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      if (form.value.note) {
        this.medicines.push({
          name: form.value.note,
          isNameValid: true,
          concentration: "",
          form: "",
          dose: "",
          timing: "",
          period: ""
        });
      }
      this.medicineService.medicinesForPrint = this.medicines;
      this.formLoading = false;
      this.router.navigate(["/print/medicines"], {
        queryParams: { type: "medicine" }
      });
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

  // =====> on make copy from previous prescription:
  onCopy() {
    this.medicines = [
      {
        name: "Antox",
        isNameValid: true,
        concentration: "1 mg",
        form: "Tab",
        dose: "",
        timing: "",
        period: ""
      },
      {
        name: "Cornivita",
        isNameValid: true,
        concentration: "2 mg",
        form: "Caps",
        dose: "",
        timing: "",
        period: ""
      },
      {
        name: "Plaquanile",
        isNameValid: true,
        concentration: "5 mg",
        form: "Vail",
        dose: "",
        timing: "",
        period: ""
      }
    ];

    // =====> scroll to top:
    this.scrollService.scrollTo(0,0);
  }
}
