import {
  Component,
  OnInit,
  OnDestroy,
  ViewChild,
  Input,
  Output,
  EventEmitter
} from "@angular/core";
import { NgForm } from "@angular/forms";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NbDialogService } from "@nebular/theme";
import { Location } from "@angular/common";

import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";

@Component({
  selector: "info-detail",
  templateUrl: "./info-detail.component.html",
  styleUrls: ["./info-detail.component.scss"]
})
export class InfoDetailComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  patientNameData: String;
  patientPhoneData: string;
  patientAgeData: number;
  @Input() isNewPatient: boolean;
  @Output() isNewPatientChange = new EventEmitter<boolean>();
  @ViewChild("form") form: NgForm;
  @ViewChild("doneSwal") doneSwal: SwalComponent;
  @ViewChild("duplicateNameSwal")
  duplicateNameSwal: SwalComponent;
  @ViewChild("duplicatePhoneSwal")
  duplicatePhoneSwal: SwalComponent;

  constructor(
    public location: Location,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    if (this.isNewPatient) {
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
      console.log("new");
    } else {
      this.updatePatient();
      console.log("old");
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
      this.isNewPatientChange.emit(false);
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
