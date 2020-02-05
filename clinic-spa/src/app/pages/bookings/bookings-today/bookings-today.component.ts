import { Component, OnInit, ViewChild, AfterViewInit, ChangeDetectorRef } from '@angular/core';
import { NbDialogService } from '@nebular/theme';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import {CdkDragDrop, moveItemInArray} from '@angular/cdk/drag-drop';

import { NewBookingComponent } from '../new-booking/new-booking.component';

@Component({
  selector: 'bookings-today',
  templateUrl: './bookings-today.component.html',
  styleUrls: ['./bookings-today.component.scss']
})
export class BookingsTodayComponent implements OnInit, AfterViewInit  {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  movies = [
    'Episode I - The Phantom Menace',
    'Episode II - Attack of the Clones',
    'Episode III - Revenge of the Sith',
    'Episode IV - A New Hope',
    'Episode V - The Empire Strikes Back',
    'Episode VI - Return of the Jedi',
    'Episode VII - The Force Awakens',
    'Episode VIII - The Last Jedi'
  ];

  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.movies, event.previousIndex, event.currentIndex);
  }

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
