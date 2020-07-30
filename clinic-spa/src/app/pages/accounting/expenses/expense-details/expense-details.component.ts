import { DateTimeService } from "./../../../../shared/services/date-time.service";
import { Router, ActivatedRoute } from "@angular/router";
import { Subscription } from "rxjs";
import { NgForm } from "@angular/forms";
import { Location } from "@angular/common";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { BsLocaleService } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { AddItemComponent } from "./add-item/add-item.component";
import {
  ExpenseItemValue,
  ExpenseDetails,
  GetExpenseDetails,
} from "../../accounting.model";
import { AccountingService } from "../../accounting.service";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "expense-details",
  templateUrl: "./expense-details.component.html",
  styleUrls: ["./expense-details.component.scss"],
})
export class ExpenseDetailsComponent implements OnInit, OnDestroy {
  formLoading = false;
  expenseDetails: ExpenseDetails;
  expenseDateValue: Date;
  expenseItemValues: ExpenseItemValue[];
  expenseTypeValues: ExpenseItemValue[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  subs = new Subscription();

  constructor(
    private localeService: BsLocaleService,
    private dialogService: NbDialogService,
    private accountingService: AccountingService,
    private dateTimeService: DateTimeService,
    private alertService: AlertService,
    private router: Router,
    private route: ActivatedRoute,
    public location: Location
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.formLoading = true;
    // =====> check if new expense or details of old one:
    this.subs.add(
      this.route.paramMap.subscribe((paramMap) => {
        this.subs.add(
          this.accountingService
            .getExpenseDetails(
              paramMap.get("id") == "new" ? 0 : +paramMap.get("id")
            )
            .subscribe(
              (res: GetExpenseDetails) => {
                this.expenseDetails = res.expenseDetails;
                this.expenseDateValue = res.expenseDetails ? new Date(res.expenseDetails.date) : new Date();
                this.expenseItemValues = res.expenseItemValues;
                this.expenseTypeValues = res.expenseTypeValues;
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
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onAddItem() {
    this.subs.add(
      this.dialogService
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
        })
    );
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    if (!this.expenseDetails) {
      const postObj: ExpenseDetails = {
        date: this.dateTimeService.dateWithoutTime(form.value.expenseDate),
        amount: form.value.expenseAmount,
        itemId: form.value.expenseItem,
        typeId: form.value.expenseType,
        note: form.value.note,
      };
      this.subs.add(
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
        )
      );
    } else {
      const putObj: ExpenseDetails = {
        id: this.expenseDetails.id,
        date: this.dateTimeService.dateWithoutTime(form.value.expenseDate),
        amount: form.value.expenseAmount,
        itemId: form.value.expenseItem,
        typeId: form.value.expenseType,
        note: form.value.note,
      };
      this.subs.add(
        this.accountingService.putExpense(putObj).subscribe(
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
        )
      );
    }
  }
}
