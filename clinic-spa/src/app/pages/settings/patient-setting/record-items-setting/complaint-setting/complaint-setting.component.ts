import { AlertService } from "./../../../../../shared/services/alert.service";
import { SettingsService } from "./../../../settings.service";
import { AnyPatientFileValue } from "./../../../settings.model";
import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy } from "@angular/core";

@Component({
  selector: "complaint-setting",
  templateUrl: "./complaint-setting.component.html",
  styleUrls: ["./complaint-setting.component.scss"],
})
export class ComplaintSettingComponent implements OnInit, OnDestroy {
  formLoading = false;
  complaintValues: AnyPatientFileValue[];

  getSubs: Subscription;
  itemSubs: Subscription;

  constructor(
    private settingService: SettingsService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.settingService.getGeneralComplaintSetting().subscribe(
      (res: AnyPatientFileValue[]) => {
        this.complaintValues = res;
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
  }

  onAddItem() {
    /* this.itemSubs = this.dialogService
      .open(AddItemComponent, {
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      })
      .onClose.subscribe((newItem) => {
        if (newItem) {
          this.formLoading = true;
          this.accountingService.postExpenseItem(newItem).subscribe(
            (res: ExpenseItemValue) => {
              if (this.expenseItemValues) {
                this.expenseItemValues.push(res);
              } else {
                this.expenseItemValues = [res];
              }
              this.doneSwal.fire();
              this.formLoading = false;
            },
            (err) => {
              console.error(err);
              this.alertService.alertError();
              this.formLoading = false;
            }
          );
        }
      }); */
  }

  onEdit(){

  }

  onDelete(){

  }
}
