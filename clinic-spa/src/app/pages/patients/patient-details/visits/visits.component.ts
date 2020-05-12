import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";

import { BookingsService } from "./../../../bookings/bookings.service";
import { PatientsService } from "./../../patients.service";
import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { AlertService } from "../../../../shared/services/alert.service";
import { PatientVisit } from "../../../bookings/bookings.model";

@Component({
  selector: "visits",
  templateUrl: "./visits.component.html",
  styleUrls: ["./visits.component.scss"],
})
export class VisitsComponent implements OnInit, OnDestroy {
  formLoading = false;
  visitsList: PatientVisit[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("cancelSwal", { static: false }) cancelSwal: SwalComponent;

  getVisitsSubs: Subscription;
  cancelBookSubs: Subscription;

  constructor(
    private bookingService: BookingsService,
    private dialogService: NbDialogService,
    private alertService: AlertService,
    private patientService: PatientsService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getVisitsSubs = this.bookingService
      .getVisitsList(this.patientService.patientId)
      .subscribe(
        (res: PatientVisit[]) => {
          this.visitsList = res;
          this.formLoading = false;
        },
        (error) => {
          console.error(error);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }

  ngOnDestroy() {
    this.getVisitsSubs.unsubscribe();
  }

  // =====> on click on new booking or edit booking:
  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: bookingId,
        patientId: this.patientService.patientId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }

  // =====> on click on delete booking:
  onDeleteBooking(bookId:number) {
    this.cancelSwal.fire().then((result) => {
      if (result.value) {
        this.cancelBookSubs = this.bookingService
          .cancelBooking(bookId)
          .subscribe(
            () => {
              this.visitsList.find(v => v.bookId==bookId).isCanceled = true;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (error) => {
              console.error(error);
              this.alertService.alertError();
              this.formLoading = false;
            }
          );
      }
    });
  }
}
