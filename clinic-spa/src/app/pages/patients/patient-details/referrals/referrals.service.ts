import {ReferralValue } from "./referrals.model";
import { Injectable } from "@angular/core";

@Injectable({
  providedIn: "root"
})
export class ReferralsService {
  referralForPrint:any[];

  constructor() {}

  getReferralValues(): ReferralValue[] {
    const values= [
      {
        specialtyId: "ssss",
        specialtyName: "عظام",
        doctors: [
          {
            doctorId: "aaaa",
            doctorName: "بهاء علي"
          }
        ]
      },
      {
        specialtyId: "zzzz",
        specialtyName: "روماتيزم",
        doctors: [
          {
            doctorId: "bbbb",
            doctorName: "هشام محمد"
          }
        ]
      }
    ];
    return values;
  }
}
