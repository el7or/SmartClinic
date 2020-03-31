import { NbDialogService } from '@nebular/theme';
import { SettingsService } from "./../../../settings/settings.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BookingServicePrice } from "../../../settings/settings.model";
import { NgForm } from "@angular/forms";
import { BookingDetailsComponent } from '../../../bookings/booking-details/booking-details.component';
import { ActivatedRoute } from '@angular/router';
import { Subscription } from 'rxjs';
import { PatientsService } from '../../patients.service';
import { PatientHeaderInfo } from '../../patients.model';

@Component({
  selector: "examination",
  templateUrl: "./examination.component.html",
  styleUrls: ["./examination.component.scss"]
})
export class ExaminationComponent implements OnInit {
  formLoading: boolean = false;
  today: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diseaseSummary: string = "ضغط - سكر - حمل";
  complaintSummary: string = "صداع - آلام الركبة";
  bookingServiceValues: BookingServicePrice[];
  bookingServicePrice: number = 0;

  examinations: any[] = [
    { name: "", isNameValid: true, area: "", isAreaValid: true }
  ];
  examinationsNames: string[] = ["تورم بالجسم", "طفح جلدي"];
  examinationsAreas: string[] = ["القدم اليسرى", "اليد اليمنى"];
  patientInfo: PatientHeaderInfo;

  routeSubs: Subscription;

  constructor(
    private settingService: SettingsService,
    private dialogService:NbDialogService,
    private patientsService: PatientsService,
    private route: ActivatedRoute,
    public location: Location
  ) {}

  ngOnInit() {
    // =====> get list of services:
    this.bookingServiceValues = this.settingService.getBookingSetting().bookingServicePrices;

    this.routeSubs = this.route.parent.params.subscribe(params => {
      const patientId = params["id"];
      this.patientInfo = this.patientsService.getPatientHeaderInfo(+patientId)
    });
  }


  onAddNewItemToList(name, type) {
    if (type == "name") {
      this.examinationsNames.push(name);
    } else {
      this.examinationsAreas.push(name);
    }
  }

  // =====> on add new request to form from button:
  onAddExamination() {
    this.examinations.push({
      name: "",
      isNameValid: true,
      area: "",
      isAreaValid:true
    });
  }

  // =====> on remove row from requests:
  onRemoveExamination(index) {
    this.examinations.splice(index, 1);
  }

  // =====> on add new booking or edit booking to patients:
  onBook(bookingId:number) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId:bookingId,
        patientId:this.patientInfo.patientId,
        patientName: this.patientInfo.name,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
