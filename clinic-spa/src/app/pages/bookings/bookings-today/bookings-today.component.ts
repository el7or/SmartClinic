import { Component, OnInit, ViewChild, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { NbDialogService } from '@nebular/theme';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { NewBookingComponent } from '../new-booking/new-booking.component';

@Component({
  selector: 'bookings-today',
  templateUrl: './bookings-today.component.html',
  styleUrls: ['./bookings-today.component.scss']
})
export class BookingsTodayComponent implements OnInit, AfterViewInit  {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private dialogService: NbDialogService,private cd: ChangeDetectorRef) { }

  ngOnInit() {
  }
  ngAfterViewInit(){
    this.cd.detectChanges();
  }

  onNewBook(){
    this.dialogService.open(NewBookingComponent, {
      context: {
        patientDetails: "محمد أحمد السيد"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick:false,
      closeOnEsc:false
    });
  }

  onDeleteBooking(){
    this.deleteSwal.fire().then(result => {
      // =====> if click on add new booking:
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

}
