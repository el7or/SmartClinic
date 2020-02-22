import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { LanggService } from "./../../../../shared/services/langg.service";
import { DiseasesService } from "./../diseases/diseases.service";

@Component({
  selector: "complaints",
  templateUrl: "./complaints.component.html",
  styleUrls: ["./complaints.component.scss"]
})
export class ComplaintsComponent implements OnInit {
  formLoading: boolean = false;
  diseaseSummary: string;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  complaints: any[] = [{ name: "", isNameValid: true, period: "" }];
  complaintsNames: string[] = ["صداع", "آلام الركبة", "تنميل الإيد"];

  constructor(
    private diseasesService: DiseasesService,
    private langgService: LanggService,
    public location: Location
  ) {}

  ngOnInit() {
    this.diseaseSummary = this.diseasesService.diseasesList
      .filter(d => d.isYes)
      .map(disease => {
        return this.langgService.translateWord(disease.diseaseName);
      })
      .join(" - ");
      this.diseaseSummary==''?this.diseaseSummary='--':false;
  }

  onAddNewItemToList(complaintName) {
    this.complaintsNames.push(complaintName);
  }

  // =====> on add new request to form from button:
  onAddComplaint() {
    this.complaints.push({
      name: "",
      isNameValid: true,
      period: ""
    });
  }

  // =====> on remove row from requests:
  onRemoveComplaint(index) {
    this.complaints.splice(index, 1);
  }

  // =====> on save requests without print:
  onSave(form: NgForm) {
    this.complaints = [{ name: "", isNameValid: true, period: "" }];
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
