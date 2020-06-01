import {
  NbDialogService,
} from "@nebular/theme";
import {
  Component,
  OnInit,
  OnDestroy,
} from "@angular/core";
import { Subscription } from "rxjs";

import { PatientsService } from "./../../patients.service";
import { Recorditem } from "../../../settings/settings.model";
import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { ActivatedRoute } from "@angular/router";
import { AlertService } from "../../../../shared/services/alert.service";
import { GetPatientRecord } from '../../patients.model';

@Component({
  selector: "patient-record",
  templateUrl: "./patient-record.component.html",
  styleUrls: ["./patient-record.component.scss"],
})
export class PatientRecordComponent implements OnInit, OnDestroy {
  formLoading = false;
  recordItems: Recorditem[];
  isExpanded = false;
  patientId: string;
  todayBookingId:number;

  getRecordSubs: Subscription;
  routeSubs: Subscription;

  constructor(
    private dialogService: NbDialogService,
    private alertService: AlertService,
    private patientsService: PatientsService,
    private route: ActivatedRoute,
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getRecordSubs = this.patientsService.getPatientFileItems().subscribe(
      (res: GetPatientRecord) => {
        this.todayBookingId = res.todayBookingId;
        this.recordItems = res.recordItems;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
    this.routeSubs = this.route.parent.params.subscribe((params) => {
      this.patientId = params["id"];
    });
  }
  ngOnDestroy() {
    this.getRecordSubs.unsubscribe();
    this.routeSubs.unsubscribe();
  }

  // =====> on add new booking or edit booking to patients:
  onBook(bookingId: number) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: bookingId,
        patientId: this.patientsService.patientId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }
}
