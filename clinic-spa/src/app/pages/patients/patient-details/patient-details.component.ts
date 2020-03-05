import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy, ChangeDetectorRef, AfterViewInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { Location } from "@angular/common";

import { BasicInfo } from "./basic-info/basic-info.model";
import { AuthService } from "./../../../auth/auth.service";
import { BasicInfoService } from "./basic-info/basic-info.service";
import { LanggService } from "./../../../shared/services/langg.service";
import { UserRole } from "../../../auth/auth.model";

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
          >: <span>{{ patientInfo?.name }}</span>
        </h5>
        <label *ngIf="patientInfo"
          ><span langg>Age</span>: <span>{{ patientInfo?.age }}</span> |
          <span langg>Visits Count</span>:
          <span>{{ patientInfo?.visitsCount }}</span></label
        >
      </nb-card-header>
      <nb-card-body>
        <nb-route-tabset [tabs]="patientTabs"></nb-route-tabset>
      </nb-card-body>
    </nb-card>
  `,
  styleUrls: ["./patient-details.component.scss"]
})
export class PatientDetailsComponent implements OnInit, AfterViewInit, OnDestroy {
  pageHeader: string;
  isNewPatient:boolean;
  patientInfo: BasicInfo;

  routeSubs: Subscription;
  infoSubs:Subscription;

  patientTabs: any[];

  constructor(
    private route: ActivatedRoute,
    public location: Location,
    private basicInfoService: BasicInfoService,
    private authService: AuthService,
    private langgService: LanggService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {
    // =====> check if new patient or details of old patient:
    this.routeSubs= this.route.paramMap.subscribe(paramMap => {
      const patientId = paramMap.get("id");
      if (patientId == "new") {
        this.isNewPatient = true;
        this.pageHeader = "Add New Patient";
      } else {
        this.isNewPatient = false;
        this.pageHeader = "Patient Profile";
        this.infoSubs= this.basicInfoService.patientInfo
          .asObservable()
          .subscribe(data => (this.patientInfo = data));
      }

      // =====> create tabs based on user role:
      if (this.authService.roleName == UserRole.Employee) {
        this.patientTabs = [
          {
            title: this.langgService.translateWord("Basic info"),
            route: "./basic"
          },
          {
            title: this.langgService.translateWord("Associated Diseases"),
            route: "./diseases",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("All Visits"),
            route: "./visits",
            disabled: this.isNewPatient
          }
        ];
      } else {
        this.patientTabs = [
          {
            title: this.langgService.translateWord("Basic info"),
            route: "./basic"
          },
          {
            title: this.langgService.translateWord("Associated Diseases"),
            route: "./diseases",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("Patient Record"),
            route: "./record",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("Prescription"),
            route: "./prescription",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("Request X-Ray & Analysis"),
            route: "./request",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("External Referrals"),
            route: "./referral",
            disabled: this.isNewPatient
          },
          {
            title: this.langgService.translateWord("All Visits"),
            route: "./visits",
            disabled: this.isNewPatient
          }
        ];
      }
    });
  }

  ngAfterViewInit() {
    this.cd.detectChanges();
  }

  ngOnDestroy() {
    this.routeSubs.unsubscribe();
    if (this.infoSubs) {
      this.infoSubs.unsubscribe();
    }
  }
}
