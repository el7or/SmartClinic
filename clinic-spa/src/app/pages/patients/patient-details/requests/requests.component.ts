import { PatientsService } from "./../../patients.service";
import { XRayDetailComponent } from "./../xrays/xray-detail/xray-detail.component";
import { AlertService } from "./../../../../shared/services/alert.service";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
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
  PhysicalTherapyValue,
  PhysicalTherapyAreaValue,
} from "./requests.model";
import { Subscription } from "rxjs";
import { TypeaheadMatch } from "ngx-bootstrap";
import {
  ItemsType,
  AnyPatientFileValue,
} from "../../../settings/patient-setting/record-items-setting/record-items-setting.model";

@Component({
  selector: "requests",
  templateUrl: "./requests.component.html",
  styleUrls: ["./requests.component.scss"],
})
export class RequestsComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  newRequests: PatientRequest[];
  prevPatientRequests: PatientRequest[] = [];
  rayNames: RayValue[] = [];
  rayAreas: RayAreaValue[] = [];
  analysisNames: AnalysisValue[] = [];
  physicalTherapyNames: PhysicalTherapyValue[] = [];
  physicalTherapyAreas: PhysicalTherapyAreaValue[] = [];
  isAnyNameInvalid = true;

  subs = new Subscription();

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
    this.subs.add(
      this.requestService.getPatientRequests().subscribe(
        (res: GetPatientRequests) => {
          this.rayNames = res.rayValues;
          this.rayAreas = res.rayAreaValues;
          this.analysisNames = res.analysisValues;
          this.physicalTherapyNames = res.physicalTherapyValues;
          this.physicalTherapyAreas = res.physicalTherapyAreaValues;
          this.prevPatientRequests = res.prevPatientRequests;
          // =====> add empty request based on type in query param:
          const typeParam = this.route.snapshot.queryParamMap.get("type");
          if (typeParam) {
            this.newRequests = [
              {
                id: 0,
                requestId: 0,
                requestName: "",
                requestType: typeParam,
                isAreaValid: true,
              },
            ];
          }
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  // =====> bind requestId on select from typehead:
  onSelectRequest(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newRequests[index].requestId = event.item.id;
  }

  // =====> bind areaId on select from typehead:
  onSelectArea(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.newRequests[index].areaId = event.item.id;
  }

  // =====> on add new request to form from button:
  onAddRequest(type) {
    if (this.newRequests) {
      this.newRequests.push({
        id: 0,
        requestId: 0,
        requestName: "",
        requestType: type,
        isAreaValid: true,
        requestDate: new Date(),
      });
    } else {
      this.newRequests = [
        {
          id: 0,
          requestId: 0,
          requestName: "",
          requestType: type,
          isAreaValid: true,
          requestDate: new Date(),
        },
      ];
    }
  }

  // =====> on add new xray name or analysis name to thier list:
  onAddNewItemToList(item: PatientRequest, itemType, areaType?) {
    this.formLoading = true;
    if (itemType == "ray") {
      this.subs.add(
        this.requestService
          .postNewItemValue(item.requestName, ItemsType.Ray)
          .subscribe(
            (res: AnyPatientFileValue) => {
              this.rayNames.push({
                id: res.id,
                text: res.text,
              });
              item.requestId = res.id;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (err) => {
              console.error(err);
              this.alertService.alertError();
              this.formLoading = false;
            }
          )
      );
    } else if (itemType == "analysis") {
      this.subs.add(
        this.requestService
          .postNewItemValue(item.requestName, ItemsType.Analysis)
          .subscribe(
            (res: AnyPatientFileValue) => {
              this.analysisNames.push({
                id: res.id,
                text: res.text,
              });
              item.requestId = res.id;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (err) => {
              console.error(err);
              this.alertService.alertError();
              this.formLoading = false;
            }
          )
      );
    } else if (itemType == "therapy") {
      this.subs.add(
        this.requestService
          .postNewItemValue(item.requestName, ItemsType.PhysicalTherapy)
          .subscribe(
            (res: AnyPatientFileValue) => {
              this.physicalTherapyNames.push({
                id: res.id,
                text: res.text,
              });
              item.requestId = res.id;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (err) => {
              console.error(err);
              this.alertService.alertError();
              this.formLoading = false;
            }
          )
      );
    } else if (itemType == "area") {
      if (areaType == "ray") {
        this.subs.add(
          this.requestService
            .postNewItemValue(item.areaName, ItemsType.RayArea)
            .subscribe(
              (res: AnyPatientFileValue) => {
                this.rayAreas.push({
                  id: res.id,
                  text: res.text,
                });
                item.areaId = res.id;
                this.formLoading = false;
                this.doneSwal.fire();
              },
              (err) => {
                console.error(err);
                this.alertService.alertError();
                this.formLoading = false;
              }
            )
        );
      } else if (areaType == "therapy") {
        this.subs.add(
          this.requestService
            .postNewItemValue(item.areaName, ItemsType.PhysicalTherapyArea)
            .subscribe(
              (res: AnyPatientFileValue) => {
                this.physicalTherapyAreas.push({
                  id: res.id,
                  text: res.text,
                });
                item.areaId = res.id;
                this.formLoading = false;
                this.doneSwal.fire();
              },
              (err) => {
                console.error(err);
                this.alertService.alertError();
                this.formLoading = false;
              }
            )
        );
      }
    }
  }

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
    this.subs.add(
      this.requestService.savePatientRequest(putObj).subscribe(
        () => {
          if (isPrint) {
            this.createRequestForPrint(this.newRequests);
            this.router.navigate(["/print/medicines"], {
              queryParams: { type: "request" },
            });
          } else {
            this.prevPatientRequests = this.prevPatientRequests.concat(
              this.newRequests
            );
            this.formLoading = false;
            this.doneSwal.fire();
            this.location.back();
          }
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
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
              : m.requestType == "analysis"
              ? this.analysisNames.find((v) => v.id == m.requestId).text
              : this.physicalTherapyNames.find((v) => v.id == m.requestId).text,
          rayArea: m.areaId
            ? m.requestType == "ray"
              ? this.rayAreas.find((v) => v.id == m.areaId).text
              : this.physicalTherapyAreas.find((v) => v.id == m.areaId).text
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

  // =====> on click delete in table:
  onDeleteRequest(id: number, type: string, index: number) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.subs.add(
          this.requestService.deletePatientRequest(id, type).subscribe(
            () => {
              this.formLoading = false;
              this.doneSwal.fire();
              this.prevPatientRequests.splice(index, 1);
            },
            (error) => {
              console.error(error);
              this.alertService.alertError();
              this.formLoading = false;
            }
          )
        );
      }
    });
  }
}
