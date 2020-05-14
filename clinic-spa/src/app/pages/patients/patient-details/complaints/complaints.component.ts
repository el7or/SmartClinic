import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { ComplaintsService } from "./complaints.service";
import { LanggService } from "./../../../../shared/services/langg.service";
import { DiseasesService } from "./../diseases/diseases.service";
import {
  ComplaintDetailsValue,
  PatientComplaintDetails,
  PatientGeneralComplaint,
  ComplaintGeneralValue
} from "./complaints.model";
import { TypeaheadMatch } from 'ngx-bootstrap';

@Component({
  selector: "complaints",
  templateUrl: "./complaints.component.html",
  styleUrls: ["./complaints.component.scss"]
})
export class ComplaintsComponent implements OnInit {
  formLoading: boolean = false;
  today: Date = new Date();
  diseaseSummary: string;
  complaintsGeneralValues: ComplaintGeneralValue[];
  complaintsDetailsValues: ComplaintDetailsValue[];
  patientGeneralComplaints: PatientGeneralComplaint[] = [];
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
    /* // =====> get summary of disease:
    this.diseaseSummary = this.diseasesService.diseasesList
      .filter(d => d.isYes)
      .map(disease => {
        return this.langgService.translateWord(disease.diseaseName);
      })
      .join(" - ");
    this.diseaseSummary == "" ? (this.diseaseSummary = "--") : false; */

    // =====> get complaints values to dropdownlist:
    this.complaintsGeneralValues = this.complantService.getComplaintsGeneralValues();
    this.complaintsDetailsValues = this.complantService.getComplaintsDetailsValues();
  }

  /* // =====> add chosen general complaint to patient general compliants:
  onSelectGeneralComplaint(event: TypeaheadMatch){
    console.log(event.item);
    this.patientGeneralComplaints.push({
      compId: event.item.compId,
      compName:event.item.compName,
      isNameValid:true,
      note:""
    })
  }

  // =====> on add new item to general complaints values:
  onAddNewItemToList(complaintName) {
    this.complaintsGeneralValues.push(complaintName);
  }*/

  // =====> on select Complaint details from dropDownList:
  onChangeComplaintDetails(event, item: PatientComplaintDetails) {
    item.allChoises = this.complaintsDetailsValues.find(
      c => c.compId == event
    ).compChoises;
  }

  // =====> on add new complaint to form from button:
  onAddComplaint(type: string) {
    if (type == "general") {
      this.patientGeneralComplaints.push({
        compId: 0,
        note: "",
        createdOn:new Date()
      });
    } else {
      this.patientComplaintsDetails.push({
        compId: 0,
        choiceId: 0,
        period: "",
        note: "",
        createdOn:new Date(),
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
    console.log(this.patientGeneralComplaints);
    this.formLoading=true;
    setTimeout(() => {
    //this.complantService.setPatientGeneralComplaints();
    this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
