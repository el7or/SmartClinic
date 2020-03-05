import { Router } from '@angular/router';
import { ReferralsService } from './referrals.service';
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";
import { Referral, ReferralValue } from './referrals.model';

@Component({
  selector: "referrals",
  templateUrl: "./referrals.component.html",
  styleUrls: ["./referrals.component.scss"]
})
export class ReferralsComponent implements OnInit {
  formLoading: boolean = false;
  referrals: Referral[] = [];
  referralsValues: ReferralValue[];
  diagnosesNames = ['التشخيص 1','التشخيص 2','التشخيص 3'];
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(private referralService:ReferralsService,
    private router:Router,
    public location: Location) {}

  ngOnInit() {
    this.referralsValues = this.referralService.getReferralValues();
  }

  // =====> on choose specialty from drop down list:
  onChangeReferralValue(event, item) {
    item.doctors = this.referralsValues.find(
      c => c.specialtyName == event
    ).doctors;
  }

  // =====> on remove row from requests:
  onRemoveReferral(index) {
    this.referrals.splice(index, 1);
  }

  // =====> on add new referral to form from button:
  onAddReferral(type: string) {
    if (type == "doctor") {
      this.referrals.push({
        refId:0,
        specialtyId: "",
        specialtyName:'',
        doctorId: "",
        doctorName:'',
        diagnose: "",
        note: "",
        doctors:[]
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
    this.formLoading = true;
    this.referralService.referralForPrint = this.referrals;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigate(["/print/medicines"], {
        queryParams: { type: "referral" }
      });
    }, 500);
  }

  onDeleteReferral() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
