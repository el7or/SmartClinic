import { Component, OnInit, OnDestroy } from "@angular/core";
import { Subscription } from "rxjs";
import { NbDialogService } from "@nebular/theme";

import { PrevPrescription, NewPrescription } from "../pharmacy.model";
import { PharmacyService } from "../pharmacy.service";
import { AlertService } from "../../shared/services/alert.service";
import { PrescDetailsComponent } from '../presc-details/presc-details.component';

@Component({
  selector: "prev-list",
  templateUrl: "./prev-list.component.html",
  styleUrls: ["./prev-list.component.scss"],
})
export class PrevListComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  prevPrescList: PrevPrescription[];

  subs = new Subscription();

  constructor(
    private pharmacyService: PharmacyService,
    private alertService: AlertService,
    private dialogService: NbDialogService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.pharmacyService.getPrevPrescriptions().subscribe(
        (res: PrevPrescription[]) => {
          this.prevPrescList = res;
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

  onOpenPresc(presc) {
    this.dialogService.open(PrescDetailsComponent, {
      context: {
        prescDetails: presc,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }
}
