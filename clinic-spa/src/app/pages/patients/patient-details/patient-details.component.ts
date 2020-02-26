import { AuthService } from "./../../../auth/auth.service";
import { BasicInfoService } from "./basic-info/basic-info.service";
import { LanggService } from "./../../../shared/services/langg.service";
import { Component, OnInit } from "@angular/core";
import { ActivatedRoute, Router } from "@angular/router";
import { Location } from "@angular/common";
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
          <span langg>{{ pageHeader }}</span
          >: <span>{{ patientName }}</span>
        </h5>
        <label
          ><span langg>Age</span>: <span>25</span> |
          <span langg>Visits Count</span>: <span>15</span></label
        >
      </nb-card-header>
      <nb-card-body>
        <nb-route-tabset [tabs]="patientTabs"></nb-route-tabset>
      </nb-card-body>
    </nb-card>
  `,
  styleUrls: ["./patient-details.component.scss"]
})
export class PatientDetailsComponent implements OnInit {
  isNewPatient = false;
  pageHeader: string;
  patientName: string;
  tabNumber: number = 1;

  patientTabs: any[];

  constructor(
    private route: ActivatedRoute,
    public location: Location,
    private basicInfoService: BasicInfoService,
    private authService: AuthService,
    private langgService: LanggService
  ) {}

  ngOnInit() {
    // =====> check if new patient or details of old patient:
    this.route.paramMap.subscribe(paramMap => {
      const patientId = paramMap.get("id");
      if (patientId == "new") {
        this.isNewPatient = this.basicInfoService.isNewPatient = true;
        this.pageHeader = "Add New Patient";
        this.patientName = "";
      } else {
        this.isNewPatient = this.basicInfoService.isNewPatient = false;
        this.pageHeader = "Patient Profile";
        this.patientName = "أحمد محمد علي";
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
          }
        ];
      }
      else {
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
          }
        ];
      }
    });
  }
}
