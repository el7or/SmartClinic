import { PatientsService } from "./../../patients.service";
import { XRayDetailComponent } from "./../xrays/xray-detail/xray-detail.component";
import { AlertService } from "./../../../../shared/services/alert.service";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { Router, ActivatedRoute } from "@angular/router";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { RequestsService } from "./requests.service";
import { AnalysisDetailComponent } from "../analysis/analysis-detail/analysis-detail.component";
import {
  PatientRequest,
  RayValue,
  RayAreaValue,
  AnalysisValue,
  GetPatientRequests,
  PutPatientRequests,
} from "./requests.model";
import { Subscription } from "rxjs";
import { TypeaheadMatch } from "ngx-bootstrap";

@Component({
  selector: "requests",
  templateUrl: "./requests.component.html",
  styleUrls: ["./requests.component.scss"],
})
export class RequestsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  newRequests: PatientRequest[] = [];
  prevPatientRequests: PatientRequest[] = [];
  rayNames: RayValue[] = [];
  rayAreas: RayAreaValue[] = [];
  analysisNames: AnalysisValue[] = [];
  isAnyNameInvalid = true;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    public location: Location,
    private router: Router,
    private route: ActivatedRoute,
    private requestService: RequestsService,
    private alertService: AlertService,
    private patientsService: PatientsService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.requestService.getPatientRequests().subscribe(
      (res: GetPatientRequests) => {
        this.rayNames = res.rayValues;
        this.rayAreas = res.rayAreaValues;
        this.analysisNames = res.analysisValues;
        this.prevPatientRequests = res.prevPatientRequests;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
    if (this.setSubs) this.setSubs.unsubscribe();
  }

  // =====> bind requestId on select from typehead:
  onSelectRequest(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newRequests[index].requestId = event.item.id;
  }

  // =====> bind reaAreaId on select from typehead:
  onSelectArea(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newRequests[index].rayAreaId = event.item.id;
  }

  // =====> on add new request to form from button:
  onAddRequest(type) {
    this.newRequests.push({
      id: 0,
      requestId: 0,
      requestName: "",
      requestType: type,
      isAreaValid: true,
    });
  }

  /* // =====> on add new xray name or analysis name to thier list:
  onAddNewItemToList(itemName, itemType) {
    if (itemType == "xRay") {
      this.rayNames.push(itemName);
    } else if (itemType == "area") {
      this.rayAreas.push(itemName);
    } else {
      this.analysisNames.push(itemName);
    }
    this.doneSwal.fire();
  } */

  // =====> on remove row from requests:
  onRemoveRequest(index) {
    this.newRequests.splice(index, 1);
  }

  // =====> on save requests:
  onSave(isPrint: boolean) {
    this.formLoading = true;
    const putObj: PutPatientRequests = {
      newPatientRequests: this.newRequests,
    };
    this.setSubs = this.requestService.savePatientRequest(putObj).subscribe(
      () => {
        if (isPrint) {
          this.createRequestForPrint(this.newRequests);
          this.router.navigate(["/print/medicines"], {
            queryParams: { type: "request" },
          });
        } else {
          this.prevPatientRequests.concat(this.newRequests);
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

  createRequestForPrint(item: PatientRequest[]) {
    this.requestService.requestsForPrint = {
      patientCodeId: this.patientsService.patientCodeId,
      patientName: this.patientsService.patientName,
      createdOn: new Date(),
      requests: item.map((m) => {
        return {
          requestType: m.requestType,
          requestName:
            m.requestType == "ray"
              ? this.rayNames.find((v) => v.id == m.requestId).text
              : this.analysisNames.find((v) => v.id == m.requestId).text,
          rayArea: m.rayAreaId
            ? this.rayAreas.find((v) => v.id == m.rayAreaId).text
            : "",
          note: m.note,
        };
      }),
    };
  }

  onOpenDetails(requestId: number, type: string) {
    if (type == "ray") {
      this.dialogService.open(XRayDetailComponent, {
        context: {
          xRayId: requestId,
        },
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      });
    } else {
      this.dialogService.open(AnalysisDetailComponent, {
        context: {
          analysisId: requestId,
        },
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      });
    }
  }

  /* onDeleteRequest() {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  } */
}
