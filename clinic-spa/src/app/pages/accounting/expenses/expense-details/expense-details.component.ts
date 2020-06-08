import { DateTimeService } from "./../../../../shared/services/date-time.service";
import { Router } from "@angular/router";
import { Subscription } from "rxjs";
import { NgForm } from "@angular/forms";
import { Location } from "@angular/common";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { BsLocaleService } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { AddItemComponent } from "./add-item/add-item.component";
import { ExpenseItemValue, PostExpense } from "../../accounting.model";
import { AccountingService } from "../../accounting.service";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "expense-details",
  templateUrl: "./expense-details.component.html",
  styleUrls: ["./expense-details.component.scss"],
})
export class ExpenseDetailsComponent implements OnInit, OnDestroy {
  formLoading = false;
  expenseItemValues: ExpenseItemValue[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  getSubs: Subscription;
  itemSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private localeService: BsLocaleService,
    private dialogService: NbDialogService,
    private accountingService: AccountingService,
    private dateTimeService: DateTimeService,
    private alertService: AlertService,
    private router: Router,
    public location: Location
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.accountingService.getExpensesItems().subscribe(
      (res: ExpenseItemValue[]) => {
        this.expenseItemValues = res;
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
    if (this.itemSubs) this.itemSubs.unsubscribe;
    if (this.setSubs) this.setSubs.unsubscribe();
  }

  onAddItem() {
    this.itemSubs = this.dialogService
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
      });
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    const postObj: PostExpense = {
      date: this.dateTimeService.dateWithoutTime(form.value.expenseDate),
      amount: form.value.expenseAmount,
      itemId: form.value.expenseItem,
      note: form.value.note,
    };
    this.accountingService.postExpense(postObj).subscribe(
      () => {
        this.doneSwal.fire();
        this.formLoading = false;
        this.router.navigateByUrl("pages/accounting/expense/list");
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
}
