import { XraysService } from "./xrays.service";
import { XRayDetailComponent } from "./xray-detail/xray-detail.component";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit } from "@angular/core";
import { PatientsService } from "../../patients.service";
import { XraysList } from "./xrays.model";

@Component({
  selector: "xrays",
  templateUrl: "./xrays.component.html",
  styleUrls: ["./xrays.component.scss"],
})
export class XRaysComponent implements OnInit {
  xraysList: XraysList[];

  constructor(
    private xrayService: XraysService,
    private patientService: PatientsService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.xraysList = this.xrayService.getXraysList(
      this.patientService.patientId
    );
  }

  onOpenXrayDetails(xrayId:number) {
    this.dialogService.open(XRayDetailComponent, {
      context: {
        xRayId: xrayId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }
}
