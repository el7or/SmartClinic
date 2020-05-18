import { AlertService } from './../../../../shared/services/alert.service';
import { XraysService } from "./xrays.service";
import { XRayDetailComponent } from "./xray-detail/xray-detail.component";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, Output, EventEmitter } from "@angular/core";
import { PatientsService } from "../../patients.service";
import { XraysList } from "./xrays.model";
import { Subscription } from 'rxjs';

@Component({
  selector: "xrays",
  templateUrl: "./xrays.component.html",
  styleUrls: ["./xrays.component.scss"],
})
export class XRaysComponent implements OnInit {
  formLoading: boolean = false;
  xraysList: XraysList[];
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();

  getSubs: Subscription;

  constructor(
    private xrayService: XraysService,
    public patientService: PatientsService,
    private alertService:AlertService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.xrayService.getXraysList().subscribe(
      (res: XraysList[]) => {
        this.xraysList = res
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
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
