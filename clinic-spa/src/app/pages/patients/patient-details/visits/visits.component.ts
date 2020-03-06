import { NbDialogService } from '@nebular/theme';
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";
import { ActivatedRoute } from "@angular/router";

import { VisitsService } from "./visits.service";
import { PatientVisit, PatientVisits } from "./visits.model";
import { BookingDetailsComponent } from '../../../bookings/booking-details/booking-details.component';

@Component({
  selector: "visits",
  templateUrl: "./visits.component.html",
  styleUrls: ["./visits.component.scss"]
})
export class VisitsComponent implements OnInit, OnDestroy {
  visitsList: PatientVisits;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  routeSubs: Subscription;

  constructor(
    private visitService: VisitsService,
    private dialogService:NbDialogService,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    this.routeSubs = this.route.parent.params.subscribe(params => {
      const patientId = params["id"];
      this.visitsList = this.visitService.getVisitsList(+patientId);
    });
  }

  ngOnDestroy() {
    this.routeSubs.unsubscribe();
  }

  // =====> on click on new booking or edit booking:
  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId:bookingId,
        patientId:this.visitsList.patientId,
        patientName: this.visitsList.patientName
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  // =====> on click on delete booking:
  onDeleteBooking() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
