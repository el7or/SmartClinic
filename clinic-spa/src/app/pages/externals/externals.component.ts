import { LanggService } from './../../shared/services/langg.service';
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";

import { AlertService } from "./../../shared/services/alert.service";
import { ExternalsService } from "./externals.service";
import { BookingDetailsComponent } from "../bookings/booking-details/booking-details.component";
import { ExternalsList, ConfirmExternalResponse } from "./externals.model";

@Component({
  selector: "externals",
  templateUrl: "./externals.component.html",
  styleUrls: ["./externals.component.scss"],
})
export class ExternalsComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  externalsList: ExternalsList[];
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  getSubs: Subscription;
  setSubs: Subscription;
  deleteSubs: Subscription;

  constructor(
    private externalService: ExternalsService,
    private alertService: AlertService,
    public langgService:LanggService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.externalService.getExternalsList().subscribe(
      (res: ExternalsList[]) => {
        this.externalsList = res;
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
    if (this.deleteSubs) this.deleteSubs.unsubscribe();
  }

  onConfirmBook(id: number,index:number) {
    this.formLoading = true;
    // =====> check if this patient not exist in current doctor create new patient before confirm booking:
    this.setSubs = this.externalService.confirmExternal(id).subscribe(
      (res: ConfirmExternalResponse) => {
        this.formLoading = false;
        this.externalsList.splice(index, 1);
        this.dialogService.open(BookingDetailsComponent, {
          context: {
            bookId: 0,
            patientId: res.patientId,
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        });
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  onDeleteRequest(id: number, index: number) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.externalService.deleteExternal(id).subscribe(
          () => {
            this.externalsList.splice(index, 1);
            this.formLoading = false;
            this.doneSwal.fire();
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
}
