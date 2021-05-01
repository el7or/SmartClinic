import {
  Component,
  OnInit,
  Input,
  OnDestroy
} from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { Subscription } from "rxjs";
import { AlertService } from "../../../../../shared/services/alert.service";
import { QuantityValue, DoseValue, TimingValue, PeriodValue, GetPatientPrescriptions } from "../../../../patients/patient-details/medicines/medicines.model";
import { MedicinesService } from "../../../../patients/patient-details/medicines/medicines.service";
import { AnyPatientFileValue } from "../../record-items-setting/record-items-setting.model";

@Component({
  selector: 'medicine-item-setting',
  templateUrl: './medicine-item-setting.component.html',
  styleUrls: ['./medicine-item-setting.component.scss']
})
export class MedicineItemSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @Input() medicineItemValue?: AnyPatientFileValue = {
    id: 0,
    text: ''
  };
  medicineItemToUpdate?: AnyPatientFileValue = {
    id: 0,
    text: ''
  };
  quantityValues: QuantityValue[];
  doseValues: DoseValue[];
  timingValues: TimingValue[];
  periodValues: PeriodValue[];

  subs = new Subscription();

  constructor(public dialogRef: NbDialogRef<MedicineItemSettingComponent>,
    private medicineService: MedicinesService,
    private alertService: AlertService) { }

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.medicineService.getMedicineDefaults().subscribe(
        (res: GetPatientPrescriptions) => {
          this.quantityValues = res.quantityValues;
          this.doseValues = res.doseValues;
          this.timingValues = res.timingValues;
          this.periodValues = res.periodValues;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        },
        () => {
          this.medicineItemToUpdate = this.medicineItemValue;
        }
      )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onSave() {
    this.dialogRef.close(this.medicineItemToUpdate);
  }
}
