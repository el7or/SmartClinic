import { ActivatedRoute } from "@angular/router";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { BookingDetailsComponent } from "../../bookings/booking-details/booking-details.component";
import { PatientsService } from '../patients.service';
import { PatientList } from '../patients.model';

@Component({
  selector: "patients-list",
  templateUrl: "./patients-list.component.html",
  styleUrls: ["./patients-list.component.scss"]
})
export class PatientsListComponent implements OnInit, OnDestroy {
  formLoading = false;
  patientsList:PatientList[];
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    private patientService:PatientsService,
    private dialogService: NbDialogService,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    // =====> get patients list for table (fisrt page in paging) :
    this.patientsList = this.patientService.getPatientsList();

    // =====> if search from icon in header:
    const patientName = this.route.snapshot.queryParamMap.get("name");
    if (patientName) {
      this.onSearch(patientName);
    }
  }

  ngOnDestroy(){
    this.form.reset();
  }

  // =====> on search patient:
  onSearch(searchText: string) {
    console.log(searchText);
  }

  // =====> on click book in table:
  onBook(bookingId) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        patientName: "محمد أحمد السيد",
        isNewBookings: bookingId == 0 ? true : false
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  // =====> on click delete in table:
  onDeletePatient() {
    this.deleteSwal.fire().then(result => {
      // =====> if click on add new booking:
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  /* onOpenBookingsSummery(patientId: number) {
    this.dialogService.open(BookingsSummaryComponent, {
      context: {
        patientDetails: "ملخص زيارات محمد أحمد السيد:"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  } */
}
