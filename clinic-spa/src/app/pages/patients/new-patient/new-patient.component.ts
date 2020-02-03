import { Router } from "@angular/router";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { NbDialogService } from "@nebular/theme";

import { NewBookingComponent } from "./../../bookings/new-booking/new-booking.component";

@Component({
  selector: "new-patient",
  templateUrl: "./new-patient.component.html",
  styleUrls: ["./new-patient.component.scss"]
})
export class NewPatientComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("duplicateNameSwal", { static: false })
  duplicateNameSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    private router: Router,
    protected location: Location,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {}

  ngOnDestroy() {
    this.form.reset();
  }

  onAddPatient(form: NgForm) {
    //console.log(form.value);

    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire().then(result => {
        // =====> if click on add new booking:
        if (result.value) {
          this.dialogService.open(NewBookingComponent, {
            context: {
              patientDetails: "حجز جديد للمريض: محمد أحمد السيد"
            },
            autoFocus: true,
            hasBackdrop: true,
            closeOnBackdropClick:false,
            closeOnEsc:false
          });
        }
      });
      this.router.navigateByUrl("/");
      this.formLoading = false;
    }, 1000);
  }

  onBlurName(patientName: NgForm) {
    if (patientName.valid) {
      this.nameLoading = true;
      setTimeout(() => {
        //console.log(patientName);
        if (patientName.value == "حاتم قطاوي") {
          this.duplicateNameSwal.fire().then(result => {
            if (result.value) {
              // =====> goto this patient details:
              this.router.navigateByUrl("/");
            }
          });
        }
        this.nameLoading = false;
      }, 1000);
    }
  }
}
