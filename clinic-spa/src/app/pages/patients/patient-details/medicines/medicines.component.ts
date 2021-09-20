import { PatientsService } from "./../../patients.service";
import { Router } from "@angular/router";
import { NbDialogService, NbLayoutScrollService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";

import { MedicinesService } from "./medicines.service";
import {
  MedicineValue,
  QuantityValue,
  DoseValue,
  TimingValue,
  PeriodValue,
  PatientPrescription,
  GetPatientPrescriptions,
  PharmacyValue,
  PrescriptionMedicine,
} from "./medicines.model";
import { AlertService } from "../../../../shared/services/alert.service";
import { TypeaheadMatch } from "ngx-bootstrap";
import { MedicineItemSettingComponent } from "../../../settings/patient-setting/medicines-setting/medicine-item-setting/medicine-item-setting.component";
import { AnyPatientFileValue, ItemsType } from "../../../settings/patient-setting/record-items-setting/record-items-setting.model";
import { RecordItemsSettingService } from "../../../settings/patient-setting/record-items-setting/record-items-setting.service";

@Component({
  selector: "medicines",
  templateUrl: "./medicines.component.html",
  styleUrls: ["./medicines.component.scss"],
})
export class MedicinesComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  medicineValues: MedicineValue[];
  quantityValues: QuantityValue[];
  doseValues: DoseValue[];
  timingValues: TimingValue[];
  periodValues: PeriodValue[];
  pharmacyValues: PharmacyValue[];
  doctorPharmacyId?: string;
  newPatientPrescription: PatientPrescription = {
    id: 0,
    medicines: [{ medicineId: 0, medicineName: "" }],
    note: "",
  };
  prevPatientPrescriptions: PatientPrescription[] = [];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("confirmSwal", { static: false }) confirmSwal: SwalComponent;
  isAnyNameInvalid = true;

  subs = new Subscription();

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private router: Router,
    private medicineService: MedicinesService,
    private patientsService: PatientsService,
    private recordItemService: RecordItemsSettingService,
    private alertService: AlertService,
    private scrollService: NbLayoutScrollService
  ) { }

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.medicineService.getPatientPrescriptions().subscribe(
        (res: GetPatientPrescriptions) => {
          this.medicineValues = res.medicineValues;
          this.quantityValues = res.quantityValues;
          this.doseValues = res.doseValues;
          this.timingValues = res.timingValues;
          this.periodValues = res.periodValues;
          this.pharmacyValues = res.pharmacyValues;
          this.doctorPharmacyId = res.doctorPharmacyId;
          this.prevPatientPrescriptions = res.prevPatientPrescriptions;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  // =====> add new medicine to doctor medicines list:
  onAddNewItemToList(item: PrescriptionMedicine) {
    this.subs.add(
      this.dialogService
        .open(MedicineItemSettingComponent, {
          context: {
            medicineItemValue: {
              id: 0,
              text: item.medicineName,
              defaultQuantityId: item.quantityId,
              defaultDoseId: item.doseId,
              defaultPeriodId: item.periodId,
              defaultTimingId: item.timingId
            },
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((medicineItemValue: AnyPatientFileValue) => {
          if (medicineItemValue && medicineItemValue.text) {
            this.formLoading = true;
            this.subs.add(
              this.recordItemService
                .postItemValues(medicineItemValue, ItemsType.Medicine)
                .subscribe(
                  (res: MedicineValue) => {
                    this.medicineValues.push(res);
                    item.medicineId = res.id;
                    item.quantityId = res.defaultQuantityId;
                    item.doseId = res.defaultDoseId;
                    item.timingId = res.defaultTimingId;
                    item.periodId = res.defaultPeriodId;
                    item.isNameValid = true
                    this.formLoading = false;
                    this.doneSwal.fire();
                  },
                  (err) => {
                    console.error(err);
                    this.alertService.alertError();
                    this.formLoading = false;
                  }
                )
            );
          }
        })
    );
    /* this.formLoading = true;
    this.subs.add(
      this.medicineService.postMedicineValue(item.medicineName).subscribe(
        (res: MedicineValue) => {
          this.medicineValues.push(res);
          item.medicineId = res.id;
          this.formLoading = false;
          this.doneSwal.fire();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    ); */
  }

  // =====> bind medicineId on select medicine from typehead:
  onSelectMedicine(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newPatientPrescription.medicines[index].medicineId = event.item.id;
    this.newPatientPrescription.medicines[index].quantityId = event.item.defaultQuantityId;
    this.newPatientPrescription.medicines[index].doseId = event.item.defaultDoseId;
    this.newPatientPrescription.medicines[index].timingId = event.item.defaultTimingId;
    this.newPatientPrescription.medicines[index].periodId = event.item.defaultPeriodId;
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
    this.confirmSwal.fire().then((result) => {
      this.formLoading = true;
      result.value
        ? (this.newPatientPrescription.pharmacyId = this.doctorPharmacyId)
        : (this.newPatientPrescription.pharmacyId = null);
      this.newPatientPrescription.isPrint = isPrint;
      if (!this.newPatientPrescription.id) {
        this.newPatientPrescription.createdOn = new Date();
      }
      this.subs.add(
        this.medicineService
          .savePatientPrescription(this.newPatientPrescription)
          .subscribe(
            (prescId: number) => {
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
                if (!this.newPatientPrescription.id) {
                  this.newPatientPrescription.id = prescId;
                  this.newPatientPrescription.medicinesNames = medicinesNamesArray.toString();
                  this.prevPatientPrescriptions.push(
                    this.newPatientPrescription
                  );
                } else {
                  this.prevPatientPrescriptions.find(
                    (i) => i.id == this.newPatientPrescription.id
                  ).medicinesNames = medicinesNamesArray.toString();
                }
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
          )
      );
    });
  }

  // =====> on make copy or edit from previous prescription:
  onReOpen(item: PatientPrescription, type: string) {
    let prescItem: PatientPrescription = {
      id: type == "copy" ? 0 : item.id,
      medicines: item.medicines,
      createdOn: type == "copy" ? new Date() : item.createdOn,
      isPrint: item.isPrint,
      medicinesNames: item.medicinesNames,
      note: item.note,
    };
    prescItem.medicines.forEach((m) => (m.isNameValid = true));
    this.isAnyNameInvalid = false;
    this.newPatientPrescription = prescItem;
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

  // =====> on send previous prescription to pharmacy:
  onSendPharmacy(item: PatientPrescription) {
    this.formLoading = true;
    this.subs.add(
      this.medicineService
        .sendPatientPrescription(item.id, this.doctorPharmacyId)
        .subscribe(
          () => {
            item.pharmacyId = this.doctorPharmacyId;
            this.formLoading = false;
            this.doneSwal.fire();
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        )
    );
  }

  createPrescForPrint(item: PatientPrescription) {
    this.medicineService.prescriptionForPrint = {
      patientCodeId: this.patientsService.patientCodeId,
      patientId: this.patientsService.patientId,
      patientName: this.patientsService.patientName,
      note: item.note,
      createdOn: new Date(),
      medicinesForPrint: item.medicines.map((m) => {
        return {
          medicine: this.medicineValues.find((v) => v.id == m.medicineId).text,
          quantity: m.quantityId
            ? this.quantityValues.find((v) => v.id == m.quantityId).text
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
