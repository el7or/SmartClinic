import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { BsLocaleService } from "ngx-bootstrap";

@Component({
  selector: "operations",
  templateUrl: "./operations.component.html",
  styleUrls: ["./operations.component.scss"]
})
export class OperationsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(
    public location: Location,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {}

  onDeleteOperation() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
