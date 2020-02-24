import { ComplaintsService } from './complaints.service';
import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { LanggService } from "./../../../../shared/services/langg.service";
import { DiseasesService } from "./../diseases/diseases.service";
import { ComplaintValue, PatientComplaint } from './complaints.model';

@Component({
  selector: "complaints",
  templateUrl: "./complaints.component.html",
  styleUrls: ["./complaints.component.scss"]
})
export class ComplaintsComponent implements OnInit {
  formLoading: boolean = false;
  today:Date= new Date();
  diseaseSummary: string;
  complaintsValues: ComplaintValue[];
  patientComplaints: PatientComplaint[]=[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(
    private diseasesService: DiseasesService,
    private langgService: LanggService,
    private complantService:ComplaintsService,
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
    this.complaintsValues = this.complantService.getComplaintsValues();
  }

  // =====> on select Complaint from dropDownList:
  onChangeComplaintValue(event,item:PatientComplaint){
    item.allChoises = this.complaintsValues.find(c => c.compId==event).compChoises;
  }

  // =====> on add new complaint to form from button:
  onAddComplaint() {
    this.patientComplaints.push({
      compId : 0,
      compName: "",
      choiseName: "",
      period:"",
      note:"",
      allChoises:[]
    });
  }

  // =====> on remove row from requests:
  onRemoveComplaint(index) {
    this.patientComplaints.splice(index, 1);
  }

  // =====> on save requests without print:
  onSave(form: NgForm) {
    this.patientComplaints = [];
    this.doneSwal.fire();
  }

  onDeleteComplaint() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
