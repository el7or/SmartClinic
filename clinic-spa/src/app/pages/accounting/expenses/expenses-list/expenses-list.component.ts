import { Component, OnInit } from "@angular/core";

import { ExpenseList, GetExpenseList } from "../../accounting.model";
import { Subscription } from "rxjs";
import { AccountingService } from "../../accounting.service";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "expenses-list",
  templateUrl: "./expenses-list.component.html",
  styleUrls: ["./expenses-list.component.scss"],
})
export class ExpensesListComponent implements OnInit {
  formLoading = false;
  allExpenses: GetExpenseList[];
  monthExpenses: ExpenseList[];

  getSubs: Subscription;

  constructor(
    private accountingService: AccountingService,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.accountingService.getExpensesList().subscribe(
      (res: GetExpenseList[]) => {
        this.allExpenses = res;
        if (this.allExpenses.length) {
          this.monthExpenses = res[0].expensesList;
        }
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

  onChangeMonth(month) {
    this.monthExpenses = this.allExpenses.find(
      (m) => m.month == month
    ).expensesList;
  }
}
