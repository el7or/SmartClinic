import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy } from "@angular/core";
import { ActivatedRoute } from "@angular/router";
import { Location } from "@angular/common";

import { PatientsService } from "./../patients.service";
import { AuthService } from "./../../../auth/auth.service";
import { LanggService } from "./../../../shared/services/langg.service";
import { UserRole } from "../../../auth/auth.model";
import { PatientHeaderInfo } from "../patients.model";
import { AlertService } from "../../../shared/services/alert.service";

@Component({
  selector: "patient-details",
  template: `
    <nb-card>
      <nb-card-header>
        <nav class="navigation">
          <a
            [routerLink]=""
            routerLinkActive="router-link-active"
            (click)="location.back()"
            class="link back-link"
            aria-label="Back"
          >
            <nb-icon icon="arrow-back"></nb-icon>
          </a>
        </nav>
        <h5>
          <span>{{ pageHeader | langg }}</span
          >: <span>{{ patientHeaderInfo?.name }}</span>
        </h5>
        <label *ngIf="patientHeaderInfo"
          ><span langg>Age</span>: <span>{{ patientHeaderInfo?.age ? patientHeaderInfo?.age : '0' }}</span> |
          <span langg>Visits Count</span>:
          <span>{{ patientHeaderInfo?.visitsCount }}</span>
          <span *ngIf="patientHeaderInfo.areaTextEN"> | <span langg>Area</span>: {{langgService.locale=='en'? patientHeaderInfo.areaTextEN : patientHeaderInfo.areaTextAR}}</span>
          </label
        >
      </nb-card-header>
      <nb-card-body [nbSpinner]="formLoading" nbSpinnerStatus="success">
        <nb-route-tabset *ngIf="!formLoading" [tabs]="patientTabs"></nb-route-tabset>
      </nb-card-body>
    </nb-card>
  `,
  styleUrls: ["./patient-details.component.scss"],
})
export class PatientDetailsComponent implements OnInit, OnDestroy {
  formLoading = false;
  patientTabs: any[];
  pageHeader: string;
  isNewPatient: boolean;
  patientHeaderInfo: PatientHeaderInfo;
  patientCodeId: string;

  routeSubs: Subscription;
  GetInfoSubs: Subscription;

  constructor(
    private route: ActivatedRoute,
    public location: Location,
    private patientsService: PatientsService,
    private authService: AuthService,
    private alertService: AlertService,
    public langgService: LanggService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    // =====> check if new patient or details of old patient:
    this.routeSubs = this.route.paramMap.subscribe((paramMap) => {
      this.patientCodeId = paramMap.get("id");
      if (this.patientCodeId == "new") {
        this.patientsService.patientId = "new";
        this.isNewPatient = true;
        this.pageHeader = "Add New Patient";
        this.createTabs();
        this.formLoading = false;
      } else {
        this.isNewPatient = false;
        this.pageHeader = "Patient Profile";
        this.GetInfoSubs = this.patientsService
          .getPatientHeaderInfo(+this.patientCodeId)
          .subscribe(
            (res: PatientHeaderInfo) => {
              this.patientHeaderInfo = res;
              this.createTabs();
              this.formLoading = false;
            },
            (err) => {
              console.error(err);
              this.alertService.alertError();
              this.formLoading = false;
            }
          );
      }
    });
  }

  createTabs() {
    // =====> create tabs based on user role:
    if (this.authService.roleName == UserRole.employee) {
      this.patientTabs = [
        {
          title: this.langgService.translateWord("Basic info"),
          route: "./basic",
        },
        {
          title: this.langgService.translateWord("Associated Diseases"),
          route: "./diseases",
          disabled: this.isNewPatient,
        },
        /* {
          title: this.langgService.translateWord("Prescription"),
          route: "./prescription",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("Request X-Ray & Analysis"),
          route: "./request",
          disabled: this.isNewPatient,
        }, */
        {
          title: this.langgService.translateWord("All Visits"),
          route: "./visits",
          disabled: this.isNewPatient,
        },
      ];
    } else {
      this.patientTabs = [
        {
          title: this.langgService.translateWord("Basic info"),
          route: "./basic",
        },
        {
          title: this.langgService.translateWord("Associated Diseases"),
          route: "./diseases",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("Patient Record"),
          route: "./record",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("Prescription"),
          route: "./prescription",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("Request X-Ray & Analysis"),
          route: "./request",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("External Referrals"),
          route: "./referral",
          disabled: this.isNewPatient,
        },
        {
          title: this.langgService.translateWord("All Visits"),
          route: "./visits",
          disabled: this.isNewPatient,
        },
      ];
    }
  }

  ngOnDestroy() {
    this.routeSubs.unsubscribe();
    if (this.GetInfoSubs) this.GetInfoSubs.unsubscribe();
  }
}
