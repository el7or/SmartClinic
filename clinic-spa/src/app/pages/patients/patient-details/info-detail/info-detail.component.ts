import { Component, OnInit, OnDestroy, ViewChild, Input, Output, EventEmitter } from '@angular/core';
import { NgForm } from '@angular/forms';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { NbDialogService } from '@nebular/theme';
import { Location } from '@angular/common';

import { NewBookingComponent } from '../../../bookings/new-booking/new-booking.component';

@Component({
  selector: 'info-detail',
  templateUrl: './info-detail.component.html',
  styleUrls: ['./info-detail.component.scss']
})
export class InfoDetailComponent implements OnInit, OnDestroy {
  formLoading = false;
  nameLoading = false;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("duplicateNameSwal", { static: false }) duplicateNameSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @Input() isNewPatient:boolean;
  @Output() isNewPatientChange = new EventEmitter<boolean>();
  patientNameData:String;
  patientAgeData:number;

  constructor(
    protected location: Location,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    if (this.isNewPatient) {

    }
    else{
      this.patientNameData= 'أحمد محمد علي';
      this.patientAgeData = 25;
    }
  }

  ngOnDestroy() {
    this.form.reset();
  }

  onSubmitPatient() {
    if (this.isNewPatient) {
      this.addNewPatient();
      console.log('new');
    }
    else{
      this.updatePatient();
      console.log('old');
    }
  }

  addNewPatient(){
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire().then(result => {
        // =====> if click on add new booking:
        if (result.value) {
          this.dialogService.open(NewBookingComponent, {
            context: {
              patientDetails: this.form.value['patientName']
            },
            autoFocus: true,
            hasBackdrop: true,
            closeOnBackdropClick:false,
            closeOnEsc:false
          });
        }
      });
      this.formLoading = false;
      // =====> to unlock other tabs in patient details:
      this.isNewPatientChange.emit(false);
    }, 1000);
  }

  updatePatient(){

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

            }
          });
        }
        this.nameLoading = false;
      }, 1000);
    }
  }
}
