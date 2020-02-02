import { Router } from "@angular/router";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "new-patient",
  templateUrl: "./new-patient.component.html",
  styleUrls: ["./new-patient.component.scss"]
})
export class NewPatientComponent implements OnInit,OnDestroy {
  formLoading = false;
  nameLoading = false;
  @ViewChild('form', { static: false }) form: NgForm;
  @ViewChild("unsavedSwal", { static: false }) unsavedSwal: SwalComponent;

  constructor(private router: Router) {}

  ngOnInit() {}

  onAddPatient(form: NgForm) {
    console.log(form.value);
  }

  ngOnDestroy(){
    this.form.reset();
  }

  onBlurName(patientName: NgForm) {
    if (patientName.valid) {
      this.nameLoading = true;
      setTimeout(() => {
        console.log(patientName);
        if (patientName.value == "حاتم قطاوي") {
          this.unsavedSwal.fire().then(result => {
            if (result.value) {
              // =====> goto this patient details:
              this.router.navigateByUrl("/");
            }
          });
        }
        this.nameLoading = false;
      }, 2000);
    }
  }
}
