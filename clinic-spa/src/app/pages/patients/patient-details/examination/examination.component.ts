import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NgForm } from "@angular/forms";

import { ExaminationService } from "./examination.service";
import { PatientExaminationsDetails } from "./examination.model";

@Component({
  selector: "examination",
  templateUrl: "./examination.component.html",
  styleUrls: ["./examination.component.scss"],
})
export class ExaminationComponent implements OnInit {
  formLoading: boolean = false;
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diseaseSummary: string = "ضغط - سكر - حمل";
  complaintSummary: string = "صداع - آلام الركبة";

  patientExaminations: PatientExaminationsDetails;
  examinationsTypes: string[];
  examinationsAreas: string[];

  constructor(
    private examinationService: ExaminationService,
    public location: Location
  ) {}

  ngOnInit() {
    this.examinationsTypes = this.examinationService.getExaminationTypes();
    this.examinationsAreas = this.examinationService.getExaminationAreas();
    this.patientExaminations = this.examinationService.getPatientExaminations();
  }

  onAddNewItemToList(name, type) {
    if (type == "type") {
      this.examinationsTypes.push(name);
    } else {
      this.examinationsAreas.push(name);
    }
  }

  // =====> on add new request to form from button:
  onAddExamination() {
    this.patientExaminations.examinations.push({
      id: 0,
      type: "",
      isTypeValid: true,
      area: "",
      isAreaValid: true,
      createdOn: new Date(),
    });
  }

  // =====> on remove row from requests:
  onRemoveExamination(index) {
    this.patientExaminations.examinations.splice(index, 1);
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    this.examinationService.setPatientExaminations(this.patientExaminations);
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
