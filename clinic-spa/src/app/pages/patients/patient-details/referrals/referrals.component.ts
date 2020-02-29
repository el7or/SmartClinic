import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";

@Component({
  selector: "referrals",
  templateUrl: "./referrals.component.html",
  styleUrls: ["./referrals.component.scss"]
})
export class ReferralsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  referrals: any[] = [];

  ptNames: string[] = [];
  hospitalNames: string[] = [];
  doctorNames: string[] = [];

  constructor(public location: Location) {}

  ngOnInit() {}

  // =====> on add new referral name to thier list:
  onAddNewItemToList(itemName, itemType) {
    if (itemType == "pt") {
      this.ptNames.push(itemName);
    } else if (itemType == "hospital") {
      this.hospitalNames.push(itemName);
    } else {
      this.doctorNames.push(itemName);

    }
    this.doneSwal.fire();
  }

  // =====> on remove row from requests:
  onRemoveReferral(index) {
    this.referrals.splice(index, 1);
  }

  // =====> on add new request to form from button:
  onAddReferral(type) {
    if (type == "pt") {
      this.referrals.push({
        type: "pt",
        name: "",
        isNameValid: true,
        note: ""
      });
    } else if (type == "hospital") {
      this.referrals.push({
        type: "hospital",
        name: "",
        isNameValid: true,
        note: ""
      });
    } else {
      this.referrals.push({
        type: "doctor",
        name: "",
        isNameValid: true,
        note: ""
      });
    }
  }

  // =====> on save requests without print:
  onSave(form: NgForm) {
    this.referrals = [];
    this.doneSwal.fire();
  }

  // =====> on save requests with print:
  onSavePrint(form: NgForm) {
    /* this.formLoading = true;
    this.requestService.requestsForPrint = this.requests;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigate(["/print/medicines"], {
        queryParams: { type: "request" }
      });
    }, 1000); */
  }

  onDeleteReferral() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
