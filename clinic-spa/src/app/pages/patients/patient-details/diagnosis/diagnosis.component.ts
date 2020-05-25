import { Component, OnInit, ViewChild, OnDestroy, Output, EventEmitter } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { Subscription } from 'rxjs';
import { map } from 'rxjs/operators';

import { DiagnosisService } from "./diagnosis.service";
import { DiagnosisValue, PatientDiagnosis, DiseaseValue, GetPatientDiagnosis, PutPatientDiagnosis } from "./diagnosis.model";
import { AlertService } from '../../../../shared/services/alert.service';

@Component({
  selector: "diagnosis",
  templateUrl: "./diagnosis.component.html",
  styleUrls: ["./diagnosis.component.scss"],
})
export class DiagnosisComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diagnosisValues:DiagnosisValue[];
  diseaseValues:DiseaseValue[];
  patientDiagnoses: PatientDiagnosis[]=[];
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private diagnosiService: DiagnosisService,
    private alertService:AlertService,
    public location: Location
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.diagnosiService
    .getPatientDiagnosis()
    .pipe(
      map((res: GetPatientDiagnosis) => {
        this.diagnosisValues = res.diagnosisValues;
        this.diseaseValues = res.diseaseValues;
        return res.patientDiagnosis;
      })
    )
    .subscribe(
      (res: PatientDiagnosis[]) => {
        this.patientDiagnoses = res;
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

  /* onAddNewItemToList(diagnoseName) {
    this.diagnosesNames.push(diagnoseName);
  } */

  // =====> on add new request to form from button:
  onAddDiagnose() {
    if(this.patientDiagnoses){
    this.patientDiagnoses.push({
      id : 0,
      diagnosisId :0,
      gradeId:null,
      note: "",
      createdOn: new Date()
    });
  }
  else{
    this.patientDiagnoses = [{
      id : 0,
      diagnosisId :0,
      gradeId:null,
      note: "",
      createdOn: new Date()
    }]
  }
  }

  onRemoveDiagnose(index) {
    this.patientDiagnoses.splice(index, 1);
  }

  onSave(){
    this.formLoading = true;
    const putObj:PutPatientDiagnosis = {
      patientDiagnosis:this.patientDiagnoses
    };
    this.setSubs = this.diagnosiService
      .savePatientDiagnosis(putObj)
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
