import { Router, ActivatedRoute } from "@angular/router";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NbDialogService } from "@nebular/theme";
import { Location } from "@angular/common";

import { CitiesService } from "./../../../../shared/services/cities.service";
import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { BasicInfoService } from "./basic-info.service";
import { BasicInfo } from "./basic-info.model";
import { Subscription } from "rxjs";

@Component({
  selector: "basic-info",
  templateUrl: "./basic-info.component.html",
  styleUrls: ["./basic-info.component.scss"]
})
export class BasicInfoComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  patientInfo: BasicInfo;
  isNewPatient: boolean;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("duplicateNameSwal", { static: false })
  duplicateNameSwal: SwalComponent;
  @ViewChild("duplicatePhoneSwal", { static: false })
  duplicatePhoneSwal: SwalComponent;

  routeSubs: Subscription;
  infoSubs: Subscription;

  constructor(
    public location: Location,
    private dialogService: NbDialogService,
    private basicInfoService: BasicInfoService,
    public citiesService: CitiesService,
    private route: ActivatedRoute,
    private router: Router
  ) {}

  ngOnInit() {
    this.routeSubs = this.route.parent.params.subscribe(params => {
      const patientId = params["id"];
      if (patientId == "new") {
        this.isNewPatient = true;
        this.patientInfo = { id: "", name: "", mobile: "" };
      } else {
        this.isNewPatient = false;
        this.infoSubs = this.basicInfoService
          .getPatientInfo(+patientId)
          .subscribe(data => (this.patientInfo = data));
      }
    });
  }

  ngOnDestroy() {
    this.form.reset();
    this.routeSubs.unsubscribe();
    if (this.infoSubs) {
      this.infoSubs.unsubscribe();
    }
  }

  // =====> check if patient name is exist:
  onBlurName(patientName: NgForm) {
    if (patientName.valid) {
      this.nameLoading = true;
      setTimeout(() => {
        if (patientName.value == "حاتم قطاوي") {
          this.duplicateNameSwal.fire().then(result => {
            if (result.value) {
              // =====> load another patient details:
              this.patientInfo = {
                id: "dsfsdafda",
                name: "حاتم قطاوي",
                mobile: "0111111111111",
                age: 40,
                gender: true,
                visitsCount: 5
              };
              this.basicInfoService.patientInfo.next(this.patientInfo);
              this.router.navigate(["/pages/patients/details", 1, "basic"]);
            } else {
              // =====> reset patient name:
              this.patientInfo.name = "";
            }
          });
        }
        this.nameLoading = false;
      }, 1000);
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
    setTimeout(() => {
      this.basicInfoService.saveNewPatient(this.form.value);
      this.fireSwalBook();
      this.formLoading = false;
      // =====> to unlock other tabs in patient details:
      this.router.navigate(["/pages/patients/details", 1, "basic"]);
    }, 1000);
  }

  updatePatient() {
    this.formLoading = true;
    setTimeout(() => {
      this.basicInfoService.updatePatientInfo(this.form.value);
      this.fireSwalBook();
      this.formLoading = false;
    }, 1000);
  }

  fireSwalBook(): void {
    this.doneSwal.fire().then(result => {
      // =====> if click on add new booking:
      if (result.value) {
        this.dialogService.open(BookingDetailsComponent, {
          context: {
            bookId: 0,
            patientId: this.patientInfo.id,
            patientName: this.patientInfo.name
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false
        });
      }
    });
  }
}
