import { ComplaintsService } from "./complaints.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { LanggService } from "./../../../../shared/services/langg.service";
import { DiseasesService } from "./../diseases/diseases.service";
import {
  ComplaintDetailsValue,
  PatientComplaintDetails,
  PatientGeneralComplaint
} from "./complaints.model";

@Component({
  selector: "complaints",
  templateUrl: "./complaints.component.html",
  styleUrls: ["./complaints.component.scss"]
})
export class ComplaintsComponent implements OnInit {
  formLoading: boolean = false;
  today: Date = new Date();
  diseaseSummary: string;
  complaintsGeneralValues: string[];
  complaintsDetailsValues: ComplaintDetailsValue[];
  patientGeneralComplaints: PatientGeneralComplaint[] = [{compId:0 ,compName: "", isNameValid: true, note: "" }];
  patientComplaintsDetails: PatientComplaintDetails[] = [];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(
    private diseasesService: DiseasesService,
    private langgService: LanggService,
    private complantService: ComplaintsService,
    public location: Location
  ) {}

  ngOnInit() {
    // =====> get summary of disease:
    this.diseaseSummary = this.diseasesService.diseasesList
      .filter(d => d.isYes)
      .map(disease => {
        return this.langgService.translateWord(disease.diseaseName);
      })
      .join(" - ");
    this.diseaseSummary == "" ? (this.diseaseSummary = "--") : false;

    // =====> get complaints values to dropdownlist:
    this.complaintsGeneralValues = this.complantService.getComplaintsGeneralValues();
    this.complaintsDetailsValues = this.complantService.getComplaintsDetailsValues();
  }

  // =====> on add new item to general complaints values:
  onAddNewItemToList(complaintName) {
    this.complaintsGeneralValues.push(complaintName);
  }

  // =====> on select Complaint details from dropDownList:
  onChangeComplaintValue(event, item: PatientComplaintDetails) {
    item.allChoises = this.complaintsDetailsValues.find(
      c => c.compId == event
    ).compChoises;
  }

  // =====> on add new complaint to form from button:
  onAddComplaint(type: string) {
    if (type == "general") {
      this.patientGeneralComplaints.push({
        compId: 0,
        compName: "",
        note: "",
        isNameValid:true
      });
    } else {
      this.patientComplaintsDetails.push({
        compId: 0,
        compName: "",
        choiseName: "",
        period: "",
        note: "",
        allChoises: []
      });
    }
  }

  // =====> on remove row from requests:
  onRemoveComplaint(index,type) {
    if (type == "general") {this.patientGeneralComplaints.splice(index, 1);}
    else{this.patientComplaintsDetails.splice(index, 1);}
  }

  // =====> on save requests without print:
  onSave(form: NgForm) {
    this.formLoading=true;
    setTimeout(() => {
    this.patientGeneralComplaints = [];
    this.patientComplaintsDetails = [];
    this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
