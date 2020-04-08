import { OperationsService } from './operations.service';
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { BsLocaleService } from "ngx-bootstrap";
import { OperationValue, PatientOperation } from './operations.model';
import { NgForm } from '@angular/forms';

@Component({
  selector: "operations",
  templateUrl: "./operations.component.html",
  styleUrls: ["./operations.component.scss"]
})
export class OperationsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  operationsValues:OperationValue[];
  patientOperations:PatientOperation[];

  constructor(
    private operationService:OperationsService,
    public location: Location,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.operationsValues = this.operationService.getOperationsValues();
    this.patientOperations = this.operationService.getPatientOperations();
  }

  onDeleteOperation() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  onSave(form) {
    this.formLoading = true;
    this.operationService.addPatientOperation(form);
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
