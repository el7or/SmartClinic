import { NgForm } from '@angular/forms';
import { BookingsSummaryComponent } from './../../bookings/bookings-summary/bookings-summary.component';
import { Component, OnInit } from '@angular/core';
import { NbDialogService } from '@nebular/theme';

@Component({
  selector: 'search-patient',
  templateUrl: './search-patient.component.html',
  styleUrls: ['./search-patient.component.scss']
})
export class SearchPatientComponent implements OnInit {
  formLoading= false;

  constructor(private dialogService: NbDialogService) { }

  ngOnInit() {
  }

  onSearch(form:NgForm){

  }

  onOpenBookingsSummery(patientId:number){
    this.dialogService.open(BookingsSummaryComponent, {
      context: {
        title: 'ملخص زيارات محمد أحمد السيد:',
      },
      autoFocus:true,
      hasBackdrop :true
    });
  }

}
