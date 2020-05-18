import { PatientsService } from "./../../patients.service";
import { AlertService } from "./../../../../shared/services/alert.service";
import { Router } from "@angular/router";
import { ReferralsService } from "./referrals.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { NgForm } from "@angular/forms";
import {
  SpecialtyValue,
  PatientDiagnosis,
  DoctorValue,
  GetPatientReferrals,
  PutPatientReferral,
  PatientReferral,
} from "./referrals.model";
import { Subscription } from "rxjs";

@Component({
  selector: "referrals",
  templateUrl: "./referrals.component.html",
  styleUrls: ["./referrals.component.scss"],
})
export class ReferralsComponent implements OnInit {
  formLoading: boolean = false;
  specialtyValues: SpecialtyValue[];
  doctorValues: DoctorValue[] = [];
  patientDiagnosis: PatientDiagnosis[] = [];
  prevPatientReferrals: PatientReferral[]=[];
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private referralService: ReferralsService,
    private router: Router,
    private alertService: AlertService,
    private patientsService: PatientsService,
    public location: Location
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.referralService.getPatientReferral().subscribe(
      (res: GetPatientReferrals) => {
        this.specialtyValues = res.specialtyValues;
        this.patientDiagnosis = res.patientDiagnosis;
        this.prevPatientReferrals = res.prevPatientReferrals;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  // =====> on choose specialty from drop down list:
  onChangeReferralValue(event) {
    this.doctorValues = this.specialtyValues.find(
      (c) => c.specialtyId == event
    ).doctors;
  }

  /* // =====> on remove row from requests:
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
  } */

  // =====> on save requests without print:
  onSave(form: NgForm, isPrint: boolean) {
    this.formLoading = true;
    const putObj: PutPatientReferral = {
      specialtyId: form.value.specialty,
      doctorId: form.value.doctor,
      diagnosisId: form.value.diagnose,
      note: form.value.note,
    };
    this.setSubs = this.referralService.savePatientReferral(putObj).subscribe(
      () => {
        if (isPrint) {
          this.createRequestForPrint(putObj);
          this.router.navigate(["/print/medicines"], {
            queryParams: { type: "referral" },
          });
        } else {
          this.prevPatientReferrals.push({
            id: 0,
            specialtyName: this.specialtyValues.find(
              (i) => i.specialtyId == putObj.specialtyId
            ).specialtyName,
            doctorName: this.doctorValues.find(
              (i) => i.doctorId == putObj.doctorId
            ).doctorName,
            diagnosisName: putObj.diagnosisId
              ? this.patientDiagnosis.find((i) => i.id == putObj.diagnosisId)
                  .text
              : null,
            note: putObj.note,
            createdOn: new Date(),
          });
          this.doctorValues = [];
          form.reset();
          this.formLoading = false;
          this.doneSwal.fire();
        }
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  createRequestForPrint(item: PutPatientReferral) {
    this.referralService.referralForPrint = {
      patientCodeId: this.patientsService.patientCodeId,
      patientName: this.patientsService.patientName,
      specialtyName: this.specialtyValues.find(
        (i) => i.specialtyId == item.specialtyId
      ).specialtyName,
      doctorName: this.doctorValues.find((i) => i.doctorId == item.doctorId)
        .doctorName,
      diagnosisName: item.diagnosisId
        ? this.patientDiagnosis.find((i) => i.id == item.diagnosisId).text
        : null,
      note: item.note,
      createdOn: new Date(),
    };
  }

  /* onDeleteReferral() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  } */
}
