import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { DiseasesService } from './diseases.service';
import { Disease } from './diseases.model';

@Component({
  selector: "diseases",
  templateUrl: "./diseases.component.html",
  styleUrls: ["./diseases.component.scss"]
})
export class DiseasesComponent implements OnInit {
  formLoading = false;
  patientDiseases: Disease[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private diseaseService: DiseasesService
  ) {}

  ngOnInit() {
    this.patientDiseases = this.diseaseService.diseasesList;
  }

  onSubmit(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.diseaseService.diseasesList = this.patientDiseases;
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
