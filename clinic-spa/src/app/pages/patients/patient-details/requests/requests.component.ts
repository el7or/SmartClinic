import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { Router, ActivatedRoute } from "@angular/router";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { RequestsService } from "./requests.service";

@Component({
  selector: "requests",
  templateUrl: "./requests.component.html",
  styleUrls: ["./requests.component.scss"]
})
export class RequestsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  requests: any[] = [];

  xRayNames: string[] = [
    "ULTRASONOGRAPHY",
    "COLORED DOPPLER(DUPPLEX)",
    "VASCULAR  IMAGING"
  ];
  xRayAreas: string[] = ["اليد اليمنى", "القدم اليسرى"];
  analysisNames: string[] = [
    "AUTOIMMUNE DISEASES",
    "DIABETES PROFILE",
    "HORMONES"
  ];

  constructor(
    public location: Location,
    private router: Router,
    private route: ActivatedRoute,
    private requestService: RequestsService
  ) {}

  ngOnInit() {
    // =====> add empty request based on type in query param:
    const typeParam = this.route.snapshot.queryParamMap.get("type");
    if (typeParam == "xray") {
      this.requests.push({
        type: "xRay",
        name: "",
        isNameValid: true,
        area: "",
        isAreaValid: true,
        note: ""
      });
    } else if (typeParam == "analysis") {
      this.requests.push({
        type: "analysis",
        name: "",
        isNameValid: true,
        note: ""
      });
    }
  }

  // =====> on add new request to form from button:
  onAddRequest(type) {
    if (type == "xray") {
      this.requests.push({
        type: "xRay",
        name: "",
        isNameValid: true,
        area: "",
        isAreaValid: true,
        note: ""
      });
    } else {
      this.requests.push({
        type: "analysis",
        name: "",
        isNameValid: true,
        note: ""
      });
    }
  }

  // =====> on add new xray name or analysis name to thier list:
  onAddNewItemToList(itemName, itemType) {
    if (itemType == "xRay") {
      this.xRayNames.push(itemName);
    } else if (itemType == "area") {
      this.xRayAreas.push(itemName);
    } else {
      this.analysisNames.push(itemName);
    }
    this.doneSwal.fire();
  }

  // =====> on remove row from requests:
  onRemoveRequest(index) {
    this.requests.splice(index, 1);
  }

  // =====> on save requests without print:
  onSave(form: NgForm) {
    this.requests = [];
    this.doneSwal.fire();
  }

  // =====> on save requests with print:
  onSavePrint(form: NgForm) {
    this.formLoading = true;
    this.requestService.requestsForPrint = this.requests;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigate(["/print/medicines"], {
        queryParams: { type: "request" }
      });
    }, 1000);
  }

  onDeleteRequest() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
