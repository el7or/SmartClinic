import { Component, OnInit, ViewChild, OnDestroy } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { Subscription } from 'rxjs';
import { NbDialogService } from '@nebular/theme';

import { AnyPatientFileValue, ItemsType } from '../record-items-setting/record-items-setting.model';
import { RecordItemsSettingService } from '../record-items-setting/record-items-setting.service';
import { AlertService } from '../../../../shared/services/alert.service';
import { MedicineItemSettingComponent } from './medicine-item-setting/medicine-item-setting.component';

@Component({
  selector: 'medicines-setting',
  templateUrl: './medicines-setting.component.html',
  styleUrls: ['./medicines-setting.component.scss']
})
export class MedicinesSettingComponent implements OnInit, OnDestroy {
  formLoading = false;
  itemValues: AnyPatientFileValue[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("duplicatSwal", { static: false }) duplicatSwal: SwalComponent;

  subs = new Subscription();

  constructor(
    private recordItemService: RecordItemsSettingService,
    private dialogService: NbDialogService,
    private alertService: AlertService
  ) { }

  ngOnInit() {
    this.populateMedicines();
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  populateMedicines() {
    this.formLoading = true;
    this.subs.add(
      this.recordItemService.getItemValues(ItemsType.Medicine).subscribe(
        (res: AnyPatientFileValue[]) => {
          this.itemValues = res;
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

  onAddItem() {
    this.subs.add(
      this.dialogService
        .open(MedicineItemSettingComponent, {
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((medicineItemValue: AnyPatientFileValue) => {
          if (medicineItemValue && medicineItemValue.text) {
            if (this.itemValues.some((i) => i.text.trim() == medicineItemValue.text.trim())) {
              this.duplicatSwal.fire();
            } else {
              this.formLoading = true;
              this.subs.add(
                this.recordItemService
                  .postItemValues(medicineItemValue, ItemsType.Medicine)
                  .subscribe(
                    () => {
                      this.populateMedicines();
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
          }
        })
    );
  }

  onEditItem(item: AnyPatientFileValue) {
    this.subs.add(
      this.dialogService
        .open(MedicineItemSettingComponent, {
          context: {
            medicineItemValue: item,
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((medicineItemValue: AnyPatientFileValue) => {
          this.formLoading = true;
          this.subs.add(
            this.recordItemService
              .putItemValues(medicineItemValue, ItemsType.Medicine)
              .subscribe(
                () => {
                  this.populateMedicines();
                  this.doneSwal.fire();
                  this.formLoading = false;
                },
                (err) => {
                  console.error(err);
                  this.alertService.alertError();
                  this.formLoading = false;
                }
              )
          );
        })
    );
  }

  onDelete(itemId: number, index) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.subs.add(
          this.recordItemService
            .deleteItemValues(itemId, ItemsType.Medicine)
            .subscribe(
              () => {
                this.formLoading = false;
                this.doneSwal.fire();
                this.itemValues.splice(index, 1);
              },
              (error) => {
                console.error(error);
                this.alertService.alertError();
                this.formLoading = false;
              }
            )
        );
      }
    });
  }
}
