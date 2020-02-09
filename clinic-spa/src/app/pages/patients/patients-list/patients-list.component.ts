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
  @ViewChild("deleteSwal") deleteSwal: SwalComponent;
  @ViewChild("doneSwal") doneSwal: SwalComponent;
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
