import { CitiesService } from './../../../../shared/services/cities.service';
import { Router } from "@angular/router";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NbDialogService } from "@nebular/theme";
import { Location } from "@angular/common";

import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { BasicInfoService } from "./basic-info.service";

@Component({
  selector: "basic-info",
  templateUrl: "./basic-info.component.html",
  styleUrls: ["./basic-info.component.scss"]
})
export class BasicInfoComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  patientNameData: String;
  patientPhoneData: string;
  patientAgeData: number;
  isNewPatient: boolean;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("duplicateNameSwal", { static: false })
  duplicateNameSwal: SwalComponent;
  @ViewChild("duplicatePhoneSwal", { static: false })
  duplicatePhoneSwal: SwalComponent;

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private basicInfoService: BasicInfoService,
    public citiesService:CitiesService,
    private router: Router
  ) {}

  ngOnInit() {
    this.isNewPatient = this.basicInfoService.isNewPatient;

    if (this.isNewPatient) {
      this.patientNameData = "";
      this.patientPhoneData = "";
      this.patientAgeData = null;
    } else {
      this.patientNameData = "أحمد محمد علي";
      this.patientPhoneData = "01112821144";
      this.patientAgeData = 25;
    }
  }

  ngOnDestroy() {
    this.form.reset();
  }

  onSubmitPatient() {
    if (this.isNewPatient) {
      this.addNewPatient();
    } else {
      this.updatePatient();
    }
  }

  addNewPatient() {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire().then(result => {
        // =====> if click on add new booking:
        if (result.value) {
          this.dialogService.open(BookingDetailsComponent, {
            context: {
              patientDetails: this.form.value["patientName"],
              isNewBookings: true
            },
            autoFocus: true,
            hasBackdrop: true,
            closeOnBackdropClick: false,
            closeOnEsc: false
          });
        }
      });
      this.formLoading = false;
      // =====> to unlock other tabs in patient details:
      this.router.navigate(["/pages/patients/details", 1, "basic"]);
    }, 1000);
  }

  updatePatient() {}

  // =====> check if patient name is exist:
  onBlurName(patientName: NgForm) {
    if (patientName.valid) {
      this.nameLoading = true;
      setTimeout(() => {
        if (patientName.value == "حاتم قطاوي") {
          this.duplicateNameSwal.fire().then(result => {
            if (result.value) {
              // =====> load another patient details:
              this.patientNameData = "أحمد محمد علي";
              this.patientPhoneData = "01112821144";
              this.patientAgeData = 25;
            } else {
              // =====> reset patient name:
              this.patientNameData = "";
            }
          });
        }
        this.nameLoading = false;
      }, 1000);
    }
  }
}
