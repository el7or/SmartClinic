import { Component, OnInit, ViewChild } from "@angular/core";

import { ExpenseList, GetExpenseList } from "../../accounting.model";
import { Subscription } from "rxjs";
import { AccountingService } from "../../accounting.service";
import { AlertService } from "../../../../shared/services/alert.service";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "expenses-list",
  templateUrl: "./expenses-list.component.html",
  styleUrls: ["./expenses-list.component.scss"],
})
export class ExpensesListComponent implements OnInit {
  formLoading = false;
  allExpenses: GetExpenseList[] = [];
  monthExpenses: ExpenseList[];
  totalPaid: number;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  subs = new Subscription();

  constructor(
    private accountingService: AccountingService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.accountingService.getExpensesList().subscribe(
        (res: GetExpenseList[]) => {
          this.allExpenses = res;
          if (this.allExpenses.length) {
            this.monthExpenses = res[0].expensesList;
            this.totalPaid = res[0].expensesList.reduce(
              (acc, expense) => acc + expense.amount,
              0
            );
          }
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

  onChangeMonth(month) {
    this.monthExpenses = this.allExpenses.find(
      (m) => m.month == month
    ).expensesList;
    this.totalPaid = this.monthExpenses.reduce(
      (acc, expense) => acc + expense.amount,
      0
    );
  }

  // =====> on click delete in table:
  onDeleteExpense(id: number, index: number) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.subs.add(
          this.accountingService.deleteExpense(id).subscribe(
            () => {
              this.formLoading = false;
              this.doneSwal.fire();
              this.monthExpenses.splice(index, 1);
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
