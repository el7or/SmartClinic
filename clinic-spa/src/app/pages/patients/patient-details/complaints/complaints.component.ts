import { AlertService } from "./../../../../shared/services/alert.service";
import {
  Component,
  OnInit,
  ViewChild,
  OnDestroy,
  Output,
  EventEmitter,
} from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { ComplaintsService } from "./complaints.service";
import {
  ComplaintDetailsValue,
  PatientDetailsComplaint,
  PatientGeneralComplaint,
  ComplaintGeneralValue,
  GetPatientComplaints,
  PutPatientComplaints,
} from "./complaints.model";
import { Subscription } from "rxjs";
import { map } from "rxjs/operators";
import { TypeaheadMatch } from "ngx-bootstrap";
import { AnyPatientFileValue } from '../../../settings/patient-setting/record-items-setting/record-items-setting.model';

@Component({
  selector: "complaints",
  templateUrl: "./complaints.component.html",
  styleUrls: ["./complaints.component.scss"],
})
export class ComplaintsComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  today: Date = new Date();
  diseaseSummary: string;
  complaintsGeneralValues: ComplaintGeneralValue[];
  complaintsDetailsValues: ComplaintDetailsValue[];
  patientGeneralComplaints: PatientGeneralComplaint[] = [];
  patientDetailsComplaints: PatientDetailsComplaint[] = [];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @Output() onFinish: EventEmitter<any> = new EventEmitter<any>();
  isAnyNameInvalid = true;

  getSubs: Subscription;
  setSubs: Subscription;
  addSubs: Subscription;

  constructor(
    private complantService: ComplaintsService,
    private alertService: AlertService,
    public location: Location
  ) {}

  ngOnInit() {
    this.formLoading = true;
    /* // =====> get summary of disease:
    this.diseaseSummary = this.diseasesService.diseasesList
      .filter(d => d.isYes)
      .map(disease => {
        return this.langgService.translateWord(disease.diseaseName);
      })
      .join(" - ");
    this.diseaseSummary == "" ? (this.diseaseSummary = "--") : false; */

    // =====> get complaints values & patient complaints:
    this.getSubs = this.complantService
      .getPatientComplaints()
      .pipe(
        map((res: GetPatientComplaints) => {
          this.complaintsGeneralValues = res.complaintGeneralValues;
          this.complaintsDetailsValues = res.complaintDetailsValues;
          return {
            patientGeneralComplaints: res.patientGeneralComplaints,
            patientDetailsComplaints: res.patientDetailsComplaints,
          };
        })
      )
      .subscribe(
        (res: PutPatientComplaints) => {
          this.patientGeneralComplaints = res.patientGeneralComplaints;
          this.patientGeneralComplaints.every((c) => (c.isNameValid = true));
          this.patientDetailsComplaints = res.patientDetailsComplaints;
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
    if (this.addSubs) this.addSubs.unsubscribe();
  }

  // =====> add chosen general complaint to patient general compliants:
  onSelectGeneralComplaint(event: TypeaheadMatch, index) {
    this.isAnyNameInvalid = false;
    this.patientGeneralComplaints[index].compId = event.item.compId;
  }

  // =====> on add new item to general complaints values:
  onAddNewItemToList(item:PatientGeneralComplaint) {
    this.formLoading = true;
    this.addSubs = this.complantService
      .postComplaintValue(item.compName)
      .subscribe(
        (res:AnyPatientFileValue) => {
          this.complaintsGeneralValues.push({compId:res.id, compName:res.text});
          item.compId = res.id;
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

  // =====> on select Complaint details from dropDownList:
  onChangeComplaintDetails(event, item: PatientDetailsComplaint) {
    item.allChoices = this.complaintsDetailsValues.find(
      (c) => c.compId == event
    ).compChoises;
  }

  // =====> on add new complaint to form from button:
  onAddComplaint(type: string) {
    if (type == "general") {
      this.patientGeneralComplaints.push({
        id: 0,
        compId: 0,
        compName: "",
        note: "",
        createdOn: new Date(),
      });
    } else {
      this.patientDetailsComplaints.push({
        id: 0,
        compId: 0,
        choiceId: 0,
        period: "",
        note: "",
        createdOn: new Date(),
        allChoices: [],
      });
    }
  }

  // =====> on remove row from requests:
  onRemoveComplaint(index, type) {
    if (type == "general") {
      this.patientGeneralComplaints.splice(index, 1);
    } else {
      this.patientDetailsComplaints.splice(index, 1);
    }
  }

  // =====> on save requests without print:
  onSave() {
    this.formLoading = true;
    const putObj: PutPatientComplaints = {
      patientGeneralComplaints: this.patientGeneralComplaints,
      patientDetailsComplaints: this.patientDetailsComplaints,
    };
    this.setSubs = this.complantService.savePatientComplaints(putObj).subscribe(
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
