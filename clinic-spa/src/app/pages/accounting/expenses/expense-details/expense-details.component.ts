import { NgForm } from "@angular/forms";
import { Location } from "@angular/common";
import { Component, OnInit } from "@angular/core";
import { BsLocaleService } from "ngx-bootstrap";
import { NbDialogService } from "@nebular/theme";
import { AddItemComponent } from "./add-item/add-item.component";

@Component({
  selector: "expense-details",
  templateUrl: "./expense-details.component.html",
  styleUrls: ["./expense-details.component.scss"],
})
export class ExpenseDetailsComponent implements OnInit {
  formLoading = false;
  expenseItemValues: any[];

  constructor(
    private localeService: BsLocaleService,
    private dialogService: NbDialogService,
    public location: Location
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {}

  onSave(form: NgForm) {}

  onAddItem() {
    this.dialogService
      .open(AddItemComponent, {
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      })
      .onClose.subscribe((newItem) => {
        if (this.expenseItemValues) {
          this.expenseItemValues.push({
            id: 1,
            text: newItem,
          });
        } else {
          this.expenseItemValues = [
            {
              id: 1,
              text: newItem,
            },
          ];
        }
      });
  }
}
