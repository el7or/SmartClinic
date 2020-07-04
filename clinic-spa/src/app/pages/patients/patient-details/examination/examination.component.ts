import { Component, OnInit, ViewChild, OnDestroy, Output, EventEmitter } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NgForm } from "@angular/forms";
import { Subscription } from 'rxjs';
import { map } from 'rxjs/operators';

import { ExaminationService } from "./examination.service";
import { PatientExaminationsDetails, ExaminationTypeValue, ExaminationAreaValue, GetPatientExaminations, BloodPressureValue } from "./examination.model";
import { AlertService } from '../../../../shared/services/alert.service';
import { TypeaheadMatch } from 'ngx-bootstrap';

@Component({
  selector: "examination",
  templateUrl: "./examination.component.html",
  styleUrls: ["./examination.component.scss"],
})
export class ExaminationComponent implements OnInit,OnDestroy {
  formLoading: boolean = false;
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  examinationsTypes: ExaminationTypeValue[];
  examinationsAreas: ExaminationAreaValue[];
  pressureValues:BloodPressureValue[];
  patientExaminations: PatientExaminationsDetails={
    examinations:[]
  };

  isAnyNameInvalid = false;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private examinationService: ExaminationService,
    private alertService:AlertService,
    public location: Location
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.examinationService
    .getPatientExaminations()
    .pipe(
      map((res: GetPatientExaminations) => {
        this.examinationsTypes = res.examinationTypeValues;
        this.examinationsAreas = res.examinationAreaValues;
        this.pressureValues = res.pressureValues;
        return res.patientExaminations;
      })
    )
    .subscribe(
      (res: PatientExaminationsDetails) => {
        this.patientExaminations = res;
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

onSelectType(event: TypeaheadMatch, index) {
  this.isAnyNameInvalid = false;
  this.patientExaminations.examinations[index].typeId = event.item.typeId;
}

onSelectArea(event: TypeaheadMatch, index) {
  this.isAnyNameInvalid = false;
  this.patientExaminations.examinations[index].areaId = event.item.areaId;
}

  /* onAddNewItemToList(name, type) {
    if (type == "type") {
      this.examinationsTypes.push(name);
    } else {
      this.examinationsAreas.push(name);
    }
  } */

  // =====> on add new request to form from button:
  onAddExamination() {
    this.patientExaminations.examinations.push({
      id: 0,
      typeId: 0,
      typeName:"",
      areaId: 0,
      areaName:"",
      createdOn: new Date()
    });
  }

  // =====> on remove row from requests:
  onRemoveExamination(index) {
    this.patientExaminations.examinations.splice(index, 1);
  }

  onSave() {
    this.formLoading = true;
    this.setSubs = this.examinationService
      .savePatientExaminations(this.patientExaminations)
      .subscribe(
        () => {
          this.formLoading = false;
          this.doneSwal.fire();
          this.onFinish.emit();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
