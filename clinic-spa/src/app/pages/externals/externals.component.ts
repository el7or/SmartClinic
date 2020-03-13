import { NbDialogService } from '@nebular/theme';
import { Component, OnInit, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { BookingDetailsComponent } from '../bookings/booking-details/booking-details.component';

@Component({
  selector: 'externals',
  templateUrl: './externals.component.html',
  styleUrls: ['./externals.component.scss']
})
export class ExternalsComponent implements OnInit {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private dialogService:NbDialogService) { }

  ngOnInit() {
  }

  onConfirmBook(patientId:string){
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
