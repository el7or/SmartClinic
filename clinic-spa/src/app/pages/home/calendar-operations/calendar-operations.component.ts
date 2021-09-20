import { HomeService } from "./../home.service";
import { Router } from "@angular/router";
import { AuthService } from "./../../../auth/auth.service";
import { Component, OnInit, Input, OnDestroy } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { UserRole } from "../../../auth/auth.model";
import { CalendarOperation } from "../home.model";
import { Subscription } from "rxjs";
import { AlertService } from "../../../shared/services/alert.service";
import { DateTimeService } from "../../../shared/services/date-time.service";

@Component({
  selector: "calendar-operations",
  templateUrl: "./calendar-operations.component.html",
  styleUrls: ["./calendar-operations.component.scss"],
})
export class CalendarOperationsComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @Input() eventDate: Date;
  operations: CalendarOperation[];

  subs = new Subscription();

  constructor(
    public dialogRef: NbDialogRef<CalendarOperationsComponent>,
    private homeService: HomeService,
    private authService: AuthService,
    private router: Router,
    private alertService: AlertService,
    private datetimeService: DateTimeService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.homeService
        .getCalendarOperations(
          this.datetimeService.dateWithoutTime(this.eventDate)
        )
        .subscribe(
          (res: CalendarOperation[]) => {
            this.operations = res;
            this.formLoading = false;
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onOpenFilePatient(patientId: string) {
    if (this.authService.roleName != UserRole.employee) {
      this.router.navigate(["/pages/patients/details/" + patientId + "/record"]);
    } else {
      this.router.navigate(["/pages/patients/details/" + patientId + "/basic"]);
    }
    this.dialogRef.close();
  }
}
