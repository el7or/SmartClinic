import { PatientsService } from "./../../patients.service";
import { AlertService } from "./../../../../shared/services/alert.service";
import { AuthService } from "./../../../../auth/auth.service";
import { Router } from "@angular/router";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NbDialogService } from "@nebular/theme";
import { Location } from "@angular/common";

import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { BasicInfoService } from "./basic-info.service";
import {
  BasicInfo,
  SocialStatus,
  CityValue,
  City,
  NewPatient,
  AddPatientResponse,
  EditPatient,
  GetPatientResponse,
} from "./basic-info.model";
import { Subscription } from "rxjs";
import { LanggService } from "../../../../shared/services/langg.service";
import { map } from "rxjs/operators";

@Component({
  selector: "basic-info",
  templateUrl: "./basic-info.component.html",
  styleUrls: ["./basic-info.component.scss"],
})
export class BasicInfoComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  patientCodeId: number;
  patientInfo: BasicInfo = { patientId: "", name: "", mobile: "" };
  isNewPatient: boolean;
  socialStatusValues: SocialStatus[];
  cityValues: CityValue[];
  areaValues: City[];
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("done2Swal", { static: false }) done2Swal: SwalComponent;
  @ViewChild("duplicateNameSwal", { static: false })
  duplicateNameSwal: SwalComponent;
  @ViewChild("duplicatePhoneSwal", { static: false })
  duplicatePhoneSwal: SwalComponent;

  routeSubs: Subscription;
  socialSubs: Subscription;
  citySubs: Subscription;
  addSubs: Subscription;
  editSubs: Subscription;
  infoSubs: Subscription;
  nameSubs: Subscription;

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private basicInfoService: BasicInfoService,
    public langgService: LanggService,
    private authService: AuthService,
    private alertService: AlertService,
    private patientsService: PatientsService,
    private router: Router
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.infoSubs = this.basicInfoService
      .getPatientInfo()
      .pipe(
        map((res: GetPatientResponse) => {
          // get values for dropdownlists
          this.socialStatusValues = res.socialStatus;
          this.cityValues = res.cityValue;
          return res.basicInfo;
        })
      )
      .subscribe(
        (res: BasicInfo) => {
          if (res == null) {
            this.isNewPatient = true;
          } else {
            this.isNewPatient = false;
            this.patientInfo = res;
          }
          if (this.patientInfo.city) {
            this.areaValues = this.cityValues.filter(
              (c) => c.id == this.patientInfo.city
            )[0].cities;
          }
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
    this.form.reset();
    this.infoSubs.unsubscribe();
    if (this.addSubs) this.addSubs.unsubscribe();
    if (this.editSubs) this.editSubs.unsubscribe();
    if (this.nameSubs) this.nameSubs.unsubscribe();
  }

  onSelectCity(id: number) {
    this.areaValues = this.cityValues.filter((c) => c.id == id)[0].cities;
  }

  // =====> check if patient name is exist:
  onBlurName(patientName: NgForm) {
    this.nameLoading = true;
    if (patientName.valid) {
      this.nameSubs = this.basicInfoService
        .checkPatientExist(patientName.value)
        .subscribe(
          (res: number) => {
            if (res) {
              this.duplicateNameSwal.fire().then((result) => {
                if (result.value) {
                  // =====> load another patient details:
                  this.router
                    .navigateByUrl("/", { skipLocationChange: true })
                    .then(() =>
                      this.router.navigate([
                        "/pages/patients/details",
                        res,
                        "basic",
                      ])
                    );
                } else {
                  // =====> reset patient name:
                  this.patientInfo.name = "";
                }
              });
            }
            this.nameLoading = false;
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.nameLoading = false;
          }
        );
    }
  }

  onSave() {
    if (this.isNewPatient) {
      this.addNewPatient();
    } else {
      this.updatePatient();
    }
  }

  addNewPatient() {
    this.formLoading = true;
    const patient: NewPatient = {
      clinicId: this.authService.clinicId,
      doctorId: this.authService.doctorId,
      fullName: this.form.value.patientName,
      phone: this.form.value.patientPhone,
      age: this.form.value.age,
      career: this.form.value.career,
      cityId: this.form.value.area,
      gender: this.form.value.gender,
      governorateId: this.form.value.city,
      socialStatusId: this.form.value.socialStatus,
    };
    this.addSubs = this.basicInfoService.saveNewPatient(patient).subscribe(
      (res: AddPatientResponse) => {
        this.fireSwalBook();
        this.patientInfo.patientId = res.patientId;
        this.formLoading = false;
        // =====> to unlock other tabs in patient details:
        this.router.navigate(["/pages/patients/details", res.seqNo, "basic"]);
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  updatePatient() {
    this.formLoading = true;
    const patient: EditPatient = {
      patientId: this.patientsService.patientId,
      clinicId: this.authService.clinicId,
      doctorId: this.authService.doctorId,
      fullName: this.form.value.patientName,
      phone: this.form.value.patientPhone,
      age: this.form.value.age,
      career: this.form.value.career,
      cityId: this.form.value.area,
      gender: this.form.value.gender,
      governorateId: this.form.value.city,
      socialStatusId: this.form.value.socialStatus,
    };
    this.editSubs = this.basicInfoService.updatePatientInfo(patient).subscribe(
      () => {
        this.done2Swal.fire();
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  fireSwalBook(): void {
    this.doneSwal.fire().then((result) => {
      // =====> if click on add new booking:
      if (result.value) {
        this.dialogService.open(BookingDetailsComponent, {
          context: {
            bookId: 0,
            patientId: this.patientInfo.patientId,
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        });
      }
    });
  }
}
