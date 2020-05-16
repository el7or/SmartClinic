import { PatientsService } from "./../../patients.service";
import { Router } from "@angular/router";
import { NbDialogService, NbLayoutScrollService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";
import { map } from "rxjs/operators";

import { MedicinesService } from "./medicines.service";
import {
  MedicineValue,
  ConcentrationValue,
  FormValue,
  DoseValue,
  TimingValue,
  PeriodValue,
  PatientPrescription,
  GetPatientPrescriptions,
  MedicinesForPrint,
} from "./medicines.model";
import { AlertService } from "../../../../shared/services/alert.service";
import { TypeaheadMatch } from "ngx-bootstrap";

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"],
})
export class MedicinesComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  medicineValues: MedicineValue[];
  concentrationValues: ConcentrationValue[];
  formValues: FormValue[];
  doseValues: DoseValue[];
  timingValues: TimingValue[];
  periodValues: PeriodValue[];
  newPatientPrescription: PatientPrescription = {
    id: 0,
    medicines: [{ medicineId: 0, medicineName: "" }],
    note: "",
  };
  prevPatientPrescriptions: PatientPrescription[] = [];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  isAnyNameInvalid = true;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private router: Router,
    private medicineService: MedicinesService,
    private patientsService: PatientsService,
    private alertService: AlertService,
    private scrollService: NbLayoutScrollService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.medicineService.getPatientPrescriptions().subscribe(
      (res: GetPatientPrescriptions) => {
        this.medicineValues = res.medicineValues;
        this.concentrationValues = res.concentrationValues;
        this.formValues = res.formValues;
        this.doseValues = res.doseValues;
        this.timingValues = res.timingValues;
        this.periodValues = res.periodValues;
        this.prevPatientPrescriptions = res.prevPatientPrescriptions;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
    if (this.setSubs) this.setSubs.unsubscribe();
  }

  // =====> bind medicineId on select medicine from typehead:
  onSelectMedicine(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newPatientPrescription.medicines[index].medicineId = event.item.id;
  }

  // =====> on add new row in prescription:
  onAddMedicine() {
    this.newPatientPrescription.medicines.push({
      medicineId: 0,
      medicineName: "",
    });
  }

  // =====> on remove row from prescription:
  onRemoveMedicine(index) {
    this.newPatientPrescription.medicines.splice(index, 1);
  }

  // =====> on save prescription:
  onSave(isPrint: boolean) {
    this.formLoading = true;
    this.newPatientPrescription.isPrint = isPrint;
    this.newPatientPrescription.createdOn = new Date();
    this.setSubs = this.medicineService
      .savePatientPrescription(this.newPatientPrescription)
      .subscribe(
        () => {
          if (isPrint) {
            this.createPrescForPrint(this.newPatientPrescription);
            this.router.navigate(["/print/medicines"], {
              queryParams: { type: "medicine" },
            });
          } else {
            let medicinesNamesArray = this.newPatientPrescription.medicines.map(
              (m) => {
                return m.medicineName;
              }
            );
            this.newPatientPrescription.medicinesNames = medicinesNamesArray.toString();
            this.prevPatientPrescriptions.push(this.newPatientPrescription);
            this.newPatientPrescription = {
              id: 0,
              medicines: [{ medicineId: 0, medicineName: "" }],
              note: "",
            };
            this.formLoading = false;
            this.doneSwal.fire();
          }
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }

  // =====> on make copy from previous prescription:
  onCopy(item: PatientPrescription) {
    item.medicines.forEach((m) => (m.isNameValid = true));
    this.isAnyNameInvalid = false;
    this.newPatientPrescription = item;
    // =====> scroll to top:
    this.scrollService.scrollTo(0, 0);
  }

  // =====> on print from previous prescription:
  onPrint(item: PatientPrescription) {
    this.createPrescForPrint(item);
    this.router.navigate(["/print/medicines"], {
      queryParams: { type: "medicine" },
    });
  }

  createPrescForPrint(item: PatientPrescription) {
    this.medicineService.prescriptionForPrint = {
      patientCodeId: this.patientsService.patientCodeId,
      patientName: this.patientsService.patientName,
      note: item.note,
      createdOn: new Date(),
      medicinesForPrint: item.medicines.map((m) => {
        return {
          medicine: this.medicineValues.find((v) => v.id == m.medicineId).text,
          concentration: m.concentrationId
            ? this.concentrationValues.find((v) => v.id == m.concentrationId)
                .text
            : "",
          form: m.formId
            ? this.formValues.find((v) => v.id == m.formId).text
            : "",
          dose: m.doseId
            ? this.doseValues.find((v) => v.id == m.doseId).text
            : "",
          timing: m.timingId
            ? this.timingValues.find((v) => v.id == m.timingId).text
            : "",
          period: m.periodId
            ? this.periodValues.find((v) => v.id == m.periodId).text
            : "",
        };
      }),
    };
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
}
