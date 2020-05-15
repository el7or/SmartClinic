import { Component, OnInit, ViewChild, OnDestroy, Output, EventEmitter } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { Subscription } from "rxjs";

import { PatientHistory } from "./history.model";
import { HistoryService } from "./history.service";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "history",
  templateUrl: "./history.component.html",
  styleUrls: ["./history.component.scss"],
})
export class HistoryComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();
  patientHistory: PatientHistory={};

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private historyService: HistoryService,
    public location: Location,
    private alertService: AlertService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.historyService.getPatientHistory().subscribe(
      (res: PatientHistory) => {
        this.patientHistory = res;
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

  onSubmit() {
    this.formLoading = true;
    this.setSubs = this.historyService
      .savePatientHistory(this.patientHistory)
      .subscribe(
        () => {
          this.formLoading = false;
          this.doneSwal.fire();
          this.onFinish.emit();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
