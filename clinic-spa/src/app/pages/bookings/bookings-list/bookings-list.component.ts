import { Component, OnInit, ViewChild } from '@angular/core';
import { NgForm } from '@angular/forms';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { BsLocaleService } from 'ngx-bootstrap';

@Component({
  selector: 'bookings-list',
  templateUrl: './bookings-list.component.html',
  styleUrls: ['./bookings-list.component.scss']
})
export class BookingsListComponent implements OnInit {
  formLoading:boolean = false;
  today = new Date();
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private localeService: BsLocaleService
    ) {
      // =====> localize datepicker:
      this.localeService.use(localStorage.getItem("langg"));}

  ngOnInit() {
  }

  onSearch(form: NgForm) {}

  onChooseBookingsDate(form: NgForm){

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
