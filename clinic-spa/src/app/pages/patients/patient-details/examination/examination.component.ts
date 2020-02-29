import { SettingsService } from "./../../../settings/settings.service";
import { Component, OnInit, ViewChild } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { BookingServicePrice } from "../../../settings/settings.model";
import { NgForm } from "@angular/forms";

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

  constructor(
    private settingService: SettingsService,
    public location: Location
  ) {}

  ngOnInit() {
    // =====> get list of services:
    this.bookingServiceValues = this.settingService.getBookingServicePrices();
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

  // =====> add chosen services price to total price:
  onChangeService(service) {
    this.bookingServicePrice = this.bookingServiceValues.find(
      t => t.service == service
    ).price;
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
