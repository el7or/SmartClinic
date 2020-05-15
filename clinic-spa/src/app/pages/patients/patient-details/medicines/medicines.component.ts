import { Router } from "@angular/router";
import { NbDialogService, NbLayoutScrollService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { MedicinesService } from "./medicines.service";
import { MedicinesSummaryComponent } from "./medicines-summary/medicines-summary.component";
import {
  MedicineValue,
  ConcentrationValue,
  FormValue,
  DoseValue,
  TimingValue,
  PeriodValue,
  PatientPrescription,
} from "./medicines.model";

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"],
})
export class MedicinesComponent implements OnInit {
  formLoading: boolean = false;
  medicineValues: MedicineValue[];
  concentrationValues: ConcentrationValue[];
  formValues: FormValue[];
  doseValues: DoseValue[];
  timingValues: TimingValue[];
  periodValues: PeriodValue[];
  newPatientPrescription: PatientPrescription = {
    id: 0,
    medicines: [],
    note: "",
  };
  prevPatientPrescriptions: PatientPrescription[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private router: Router,
    private medicineService: MedicinesService,
    private scrollService: NbLayoutScrollService
  ) {}

  ngOnInit() {}

  // =====> on select medicine:
  onSelectMedicine(item, index) {
    //this.newPatientPrescription.medicines[index].medicineId = item.
  }

  // =====> on add new row in prescription:
  onAddMedicine() {
    this.newPatientPrescription.medicines.push({
      medicineId: 0,
      medicineName: "",
      concentrationId: 0,
      doseId: 0,
      formId: 0,
      periodId: 0,
      timingId: 0,
    });
  }

  // =====> on remove row from prescription:
  onRemoveMedicine(index) {
    this.newPatientPrescription.medicines.splice(index, 1);
  }

  // =====> on save prescription without print:
  onSave() {}

  // =====> on save prescription with print:
  onSavePrint(item?:PatientPrescription) {
    //this.medicineService.medicinesForPrint = this.medicines;
  }

  /* // =====> on click on info icon in table of previuos prescriptions:
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
  } */

  // =====> on make copy from previous prescription:
  onCopy() {
    //this.newPatientPrescription =

    // =====> scroll to top:
    this.scrollService.scrollTo(0, 0);
  }
}
