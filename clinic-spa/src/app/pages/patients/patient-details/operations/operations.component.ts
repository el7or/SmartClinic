import { DateTimeService } from './../../../../shared/services/date-time.service';
import { OperationsService } from './operations.service';
import { Component, OnInit, ViewChild, Output, EventEmitter } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { BsLocaleService } from "ngx-bootstrap";
import { NgForm } from '@angular/forms';
import { Subscription } from 'rxjs';

import { PatientOperation, OperationTypeValue, GetPatientOperations, PostPatientOperation } from './operations.model';
import { AlertService } from '../../../../shared/services/alert.service';

@Component({
  selector: "operations",
  templateUrl: "./operations.component.html",
  styleUrls: ["./operations.component.scss"]
})
export class OperationsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  operationTypeValues:OperationTypeValue[];
  prevPatientOperations:PatientOperation[];
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private operationService:OperationsService,
    public location: Location,
    private alertService: AlertService,
    private dateTimeSetvice:DateTimeService,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.operationService.getPatientOperations().subscribe(
      (res: GetPatientOperations) => {
        this.operationTypeValues = res.operationTypeValues;
        this.prevPatientOperations = res.prevPatientOperations;
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
    if (this.setSubs) this.setSubs.unsubscribe();
  }

  /* onDeleteOperation() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  } */

  onSave(form:NgForm) {
    this.formLoading = true;
    const postObj: PostPatientOperation = {
      typeId: form.value.type,
      date: this.dateTimeSetvice.dateWithoutTime(form.value.date),
      place: form.value.place,
      cost: form.value.cost,
      note: form.value.note,
    };
    this.setSubs = this.operationService.savePatientOperation(postObj).subscribe(
      () => {
          form.reset();
          this.onFinish.emit();
          this.formLoading = false;
          this.doneSwal.fire();
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
}
