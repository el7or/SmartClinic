import { Subscription } from "rxjs";
import { ActivatedRoute, Router } from "@angular/router";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { AuthService } from "./../../../auth/auth.service";
import { AlertService } from "./../../../shared/services/alert.service";
import { BookingDetailsComponent } from "../../bookings/booking-details/booking-details.component";
import { PatientsService } from "../patients.service";
import { PatientList, Pagination, PatientsPagedList } from "../patients.model";
import { UserRole } from "../../../auth/auth.model";

@Component({
  selector: "patients-list",
  templateUrl: "./patients-list.component.html",
  styleUrls: ["./patients-list.component.scss"],
})
export class PatientsListComponent implements OnInit, OnDestroy {
  formLoading = false;
  pagination: Pagination = {
    pageNumber: 1,
    pageSize: 5,
    pageCount: 0,
    totalItemCount: 0,
  };
  patientsList: PatientList[];
  userRole = UserRole;
  @ViewChild("form", { static: false }) form: NgForm;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  getSubs: Subscription;
  pageSubs: Subscription;
  searchSubs: Subscription;
  deleteSubs: Subscription;


  constructor(
    private patientService: PatientsService,
    private dialogService: NbDialogService,
    private alertService: AlertService,
    public authService: AuthService,
    private router: Router,
    private route: ActivatedRoute
  ) {}

  ngOnInit() {
    // =====> get patients list for table (fisrt page in paging) :
    this.formLoading = true;
    this.getSubs = this.patientService
      .getPatientsList(this.pagination.pageNumber, this.pagination.pageSize)
      .subscribe(
        (res: PatientsPagedList) => {
          this.pagination = res.pagination;
          this.patientsList = res.patients;
          this.formLoading = false;
        },
        (error) => {
          console.error(error);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );

    // =====> if search from icon in header:
    const patientName = this.route.snapshot.queryParamMap.get("name");
    if (patientName) {
      this.onSearch(patientName);
    }
  }

  ngOnDestroy() {
    this.form.reset();
    this.getSubs.unsubscribe();
    if (this.pageSubs) this.pageSubs.unsubscribe();
    if (this.searchSubs) this.searchSubs.unsubscribe();
    if (this.deleteSubs) this.deleteSubs.unsubscribe();
  }

  // =====> on click on pagination:
  pageChanged(event: any): void {
    this.formLoading = true;
    this.pagination.pageNumber = event.page;
    this.pageSubs = this.patientService
      .getPatientsList(this.pagination.pageNumber, this.pagination.pageSize)
      .subscribe(
        (res: PatientsPagedList) => {
          this.pagination = res.pagination;
          this.patientsList = res.patients;
          this.formLoading = false;
        },
        (error) => {
          console.error(error);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }

  // =====> on search patient:
  onSearch(searchText: string) {
    this.formLoading = true;
    this.searchSubs = this.patientService
      .searchPatientsList(
        this.pagination.pageNumber,
        this.pagination.pageSize,
        searchText
      )
      .subscribe(
        (res: PatientsPagedList) => {
          this.pagination = res.pagination;
          this.patientsList = res.patients;
          this.formLoading = false;
        },
        (error) => {
          console.error(error);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }

  // =====> on click file patient in table:
  onOpenFilePatient(id: string) {
    if (this.authService.roleName != UserRole.employee) {
      this.router.navigate(["/pages/patients/details/" + id + "/record"]);
    } else {
      this.router.navigate(["/pages/patients/details/" + id + "/basic"]);
    }
  }

  // =====> on click book in table:
  onBook(bookingId: number, patient: PatientList) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: bookingId,
        patientId: patient.id,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }

  // =====> on click delete in table:
  onDeletePatient(id: string,index:number) {
    this.deleteSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.deleteSubs = this.patientService.deletePatient(id).subscribe(
          () => {
            this.formLoading = false;
            this.doneSwal.fire();
            this.patientsList.splice(index,1);
            /* this.router
              .navigateByUrl("/pages", { skipLocationChange: true })
              .then(() => this.router.navigate(["/pages/patients/list"])); */
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
