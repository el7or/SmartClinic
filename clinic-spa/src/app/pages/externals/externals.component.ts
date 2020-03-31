import { AuthService } from './../../auth/auth.service';
import { ExternalsService } from './externals.service';
import { NbDialogService } from '@nebular/theme';
import { Component, OnInit, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { BookingDetailsComponent } from '../bookings/booking-details/booking-details.component';
import { ExternalsList } from './externals.model';

@Component({
  selector: 'externals',
  templateUrl: './externals.component.html',
  styleUrls: ['./externals.component.scss']
})
export class ExternalsComponent implements OnInit {
  externalsList:ExternalsList[];
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private externalService:ExternalsService,
   private authService:AuthService, private dialogService:NbDialogService) { }

  ngOnInit() {
    this.externalsList = this.externalService.getExternalsList(this.authService.clinicId);
  }

  onConfirmBook(patient:ExternalsList){
    // =====> check if this patient exist in current clinic:
    const patientId = this.externalService.checkPatientIsExist(patient.patientName,patient.patientMobile)
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: 0,
        patientId:patientId,
        patientName: 'أحمد محمود السيد'
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onDeleteRequest(patientId:string){
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
