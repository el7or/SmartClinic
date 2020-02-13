import { ActivatedRoute } from '@angular/router';
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { BookingsSummaryComponent } from "../../bookings/bookings-summary/bookings-summary.component";
import { BookingDetailsComponent } from "../../bookings/booking-details/booking-details.component";

@Component({
  selector: "patients-list",
  templateUrl: "./patients-list.component.html",
  styleUrls: ["./patients-list.component.scss"]
})
export class PatientsListComponent implements OnInit {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  formLoading = false;

  constructor(private dialogService: NbDialogService, private route:ActivatedRoute) {}

  ngOnInit() {
    let patientName = this.route.snapshot.queryParamMap.get('name');
    console.log(patientName);
  }

  onSearch(form: NgForm) {}

  onOpenBookingsSummery(patientId: number) {
    this.dialogService.open(BookingsSummaryComponent, {
      context: {
        patientDetails: "ملخص زيارات محمد أحمد السيد:"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        patientDetails: "محمد أحمد السيد",
        isNewBookings: bookingId==0? true:false
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onDeletePatient() {
    this.deleteSwal.fire().then(result => {
      // =====> if click on add new booking:
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
