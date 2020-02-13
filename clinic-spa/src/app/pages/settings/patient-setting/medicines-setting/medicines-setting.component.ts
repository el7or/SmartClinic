import { Component, OnInit, ViewChild } from "@angular/core";
import { TypeaheadMatch } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

@Component({
  selector: "medicines-setting",
  templateUrl: "./medicines-setting.component.html",
  styleUrls: ["./medicines-setting.component.scss"]
})
export class MedicinesSettingComponent implements OnInit {
  noResultAutoComplete: boolean = false;
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  allMedicinesList: string[] = ["Antox", "Cornivita", "Plaquanile"];
  chosenMedicines: string[] = ["Tolmet", "Multirelax"];

  constructor(public location: Location) {}

  ngOnInit() {}

  onSelectAutocomplete(event: TypeaheadMatch) {
    this.allMedicinesList.splice(this.allMedicinesList.findIndex(m => m== event.item),1);
    this.chosenMedicines.push(event.item);
  }

  onRemoveMedicine(index,item) {
    this.allMedicinesList.push(item);
    this.chosenMedicines.splice(index, 1);
  }

  onSaveMedicines() {
    this.formLoading = true;
    setTimeout(() => {
      //this.settingService.saveQuestionSetting(this.questionsList);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
