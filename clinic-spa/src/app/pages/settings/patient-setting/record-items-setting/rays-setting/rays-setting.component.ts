import { Component, OnInit, ViewChild } from '@angular/core';
import { AnyPatientFileValue, ItemsType } from '../record-items-setting.model';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { Subscription } from 'rxjs';
import { RecordItemsSettingService } from '../record-items-setting.service';
import { NbDialogService } from '@nebular/theme';
import { AlertService } from '../../../../../shared/services/alert.service';
import { ItemSettingComponent } from '../item-setting/item-setting.component';

@Component({
  selector: 'rays-setting',
  templateUrl: './rays-setting.component.html',
  styleUrls: ['./rays-setting.component.scss']
})
export class RaysSettingComponent implements OnInit {
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
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.recordItemService.getItemValues(ItemsType.Ray).subscribe(
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
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onAddItem() {
    this.subs.add(
      this.dialogService
        .open(ItemSettingComponent, {
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((itemText: string) => {
          if (itemText) {
            if (this.itemValues.some((i) => i.text.trim() == itemText.trim())) {
              this.duplicatSwal.fire();
            } else {
              this.formLoading = true;
              const itemObj: AnyPatientFileValue = {
                id: 0,
                text: itemText,
              };
              this.subs.add(
                this.recordItemService
                  .postItemValues(itemObj, ItemsType.Ray)
                  .subscribe(
                    (res: AnyPatientFileValue) => {
                      if (this.itemValues) {
                        this.itemValues.push(res);
                      } else {
                        this.itemValues = [res];
                      }
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
            }
          }
        })
    );
  }

  onEditItem(item: AnyPatientFileValue) {
    this.subs.add(
      this.dialogService
        .open(ItemSettingComponent, {
          context: {
            itemValue: item.text,
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((itemText: string) => {
          if (itemText && itemText.trim() != item.text.trim()) {
            if (
              this.itemValues.some(
                (i) => i.text.trim() == itemText.trim() && i.id != item.id
              )
            ) {
              this.duplicatSwal.fire();
            } else {
              this.formLoading = true;
              item.text = itemText;
              this.subs.add(
                this.recordItemService
                  .putItemValues(item, ItemsType.Ray)
                  .subscribe(
                    () => {
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
            }
          }
        })
    );
  }

  onDelete(itemId: number, index) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.subs.add(
          this.recordItemService
            .deleteItemValues(itemId, ItemsType.Ray)
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
