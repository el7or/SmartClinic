import { DiagnosisService } from "./diagnosis.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { DiagnosisValue, PatientDiagnosis } from "./diagnosis.model";

@Component({
  selector: "diagnosis",
  templateUrl: "./diagnosis.component.html",
  styleUrls: ["./diagnosis.component.scss"],
})
export class DiagnosisComponent implements OnInit {
  formLoading: boolean = false;
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diagnosesNames: string[];
  patientDiagnoses: PatientDiagnosis[];

  constructor(
    private diagnosiService: DiagnosisService,
    public location: Location
  ) {}

  ngOnInit() {
    this.diagnosesNames = this.diagnosiService.getDiagnosisValues();
    this.patientDiagnoses = this.diagnosiService.getPatientDiagnosis();
  }

  onAddNewItemToList(diagnoseName) {
    this.diagnosesNames.push(diagnoseName);
  }

  // =====> on add new request to form from button:
  onAddDiagnose() {
    this.patientDiagnoses.push({
      name: "",
      isNameValid: true,
      note: "",
      createdOn: new Date()
    });
  }

  // =====> on remove row from requests:
  onRemoveDiagnose(index) {
    this.patientDiagnoses.splice(index, 1);
  }

  onDeleteDiagnosis() {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  onSave(){
    this.formLoading=true;
    this.diagnosiService.setPatientDiagnosis(this.patientDiagnoses);
    setTimeout(() => {
    this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
