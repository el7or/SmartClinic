import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { BookingsSummaryComponent } from "./../../bookings/bookings-summary/bookings-summary.component";
import { NewBookingComponent } from '../../bookings/new-booking/new-booking.component';

@Component({
  selector: "search-patient",
  templateUrl: "./search-patient.component.html",
  styleUrls: ["./search-patient.component.scss"]
})
export class SearchPatientComponent implements OnInit {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  formLoading = false;

  constructor(private dialogService: NbDialogService) {}

  ngOnInit() {}

  onSearch(form: NgForm) {}

  onOpenBookingsSummery(patientId: number) {
    this.dialogService.open(BookingsSummaryComponent, {
      context: {
        patientDetails: "ملخص زيارات محمد أحمد السيد:"
      },
      autoFocus: true,
      hasBackdrop: true
    });
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

  onDeletePatient(){
    this.deleteSwal.fire().then(result => {
      // =====> if click on add new booking:
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
