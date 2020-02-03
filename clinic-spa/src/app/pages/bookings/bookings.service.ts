import { NbDialogService } from '@nebular/theme';
import { Injectable } from '@angular/core';

import { NewBookingComponent } from './new-booking/new-booking.component';

@Injectable({
  providedIn: 'root'
})
export class BookingsService {

  constructor(private dialogService:NbDialogService) { }

  /* dialogNewBookings(patientDetails){
    this.dialogService.open(NewBookingComponent, {
      context: {
        patientDetails: patientDetails
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick:false,
      closeOnEsc:false
    });
  } */
}
