import { RequestsService } from './requests.service';
import { Component, OnInit, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { Router } from "@angular/router";
import { Location } from "@angular/common";
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { query } from '@angular/animations';

@Component({
  selector: "requests",
  templateUrl: "./requests.component.html",
  styleUrls: ["./requests.component.scss"]
})
export class RequestsComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  requests: any[] = [
    {
      type: "xRay",
      name: "",
      isNameValid: true,
      note: ""
    }
  ];
  xRayNames: string[] = [
    "ULTRASONOGRAPHY",
    "COLORED DOPPLER(DUPPLEX)",
    "VASCULAR  IMAGING"
  ];
  analysisNames: string[] = [
    "AUTOIMMUNE DISEASES",
    "DIABETES PROFILE",
    "HORMONES"
  ];

  constructor(public location: Location, private router: Router, private requestService:RequestsService) {}

  ngOnInit() {}

  // =====> on add new request to form:
  onAddRequest(type) {
    if (type == "xray") {
      this.requests.push({
        type: "xRay",
        name: "",
        isNameValid: true,
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
  onAddNewItemToList(itemName,itemType) {
    if(itemType=='xRay'){
      this.xRayNames.push(itemName);
    }else{
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
    this.requests = [
      {
        type: "xRay",
        name: "",
        isNameValid: true,
        note: ""
      }
    ];
    this.doneSwal.fire();
  }

  // =====> on save requests with print:
  onSavePrint(form: NgForm) {
    this.formLoading = true;
    this.requestService.requestsForPrint = this.requests;
    setTimeout(() => {
      this.formLoading = false;
      this.router.navigate(["/print/medicines"],{queryParams:{type:'request'}});
    }, 1000);
  }
}
