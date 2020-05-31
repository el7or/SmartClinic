import { PatientsService } from "./../../patients.service";
import {
  NbDialogService,
  NbAccordionComponent,
  NbAccordionItemComponent,
} from "@nebular/theme";
import {
  Component,
  OnInit,
  OnDestroy,
  ViewChildren,
  QueryList,
  AfterViewInit,
} from "@angular/core";
import { Subscription } from "rxjs";

import { SettingsService } from "./../../../settings/settings.service";
import { Recorditem } from "../../../settings/settings.model";
import { BookingDetailsComponent } from "../../../bookings/booking-details/booking-details.component";
import { ActivatedRoute } from "@angular/router";
import { AlertService } from "../../../../shared/services/alert.service";

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

  getRecordSubs: Subscription;
  routeSubs: Subscription;

  constructor(
    private settingService: SettingsService,
    private dialogService: NbDialogService,
    private alertService: AlertService,
    private patientsService: PatientsService,
    private route: ActivatedRoute,
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getRecordSubs = this.settingService.getRecordItemsSetting().subscribe(
      (res: Recorditem[]) => {
        this.recordItems = res;
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
