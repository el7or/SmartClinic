import { Router } from "@angular/router";
import { ChatService } from "../../shared/services/chat.service";
import { Subscription } from "rxjs";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NbDialogService } from "@nebular/theme";

import { PrescDetailsComponent } from "./../presc-details/presc-details.component";
import { PharmacyService } from "./../pharmacy.service";
import { NewPrescription, SavePresc } from "../pharmacy.model";
import { AlertService } from "../../shared/services/alert.service";

@Component({
  selector: "home-pharmacy",
  templateUrl: "./home-pharmacy.component.html",
  styleUrls: ["./home-pharmacy.component.scss"],
})
export class HomePharmacyComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  newPrescList: NewPrescription[];
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  subs = new Subscription();

  constructor(
    private pharmacyService: PharmacyService,
    private alertService: AlertService,
    private dialogService: NbDialogService,
    private chatService: ChatService,
    private router: Router
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(
      this.pharmacyService.getNewPrescriptions().subscribe(
        (res: NewPrescription[]) => {
          this.newPrescList = res;
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    );

    // =====> if any doctor send new presc:
    this.subs.add(
      this.chatService.pharmacyPrescUpdated.subscribe(
        (newPresc: NewPrescription) => {
          let audio = new Audio();
          audio.src = "../../../assets/audio/alarm.wav";
          audio.load();
          audio.play();
          this.alertService.alertUpdatePharmacy(newPresc.doctorFullName);
          this.newPrescList.unshift(newPresc);
          /* this.router
          .navigateByUrl("/pharmacy", { skipLocationChange: true })
          .then(() => this.router.navigate(["/pharmacy/home"])); */
          /* location.reload(); */
        }
      )
    );
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onOpenPresc(presc: NewPrescription) {
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

  onDonePresc(id: number, index: number) {
    this.formLoading = true;
    const putObj: SavePresc = {
      id: id,
      isPharmacyDone: true,
    };
    this.subs.add(
      this.subs.add(
        this.pharmacyService.putPrescription(putObj).subscribe(
          () => {
            this.formLoading = false;
            this.newPrescList.splice(index, 1);
            this.doneSwal.fire();
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        )
      )
    );
  }

  onDeletePresc(id: number, index: number) {
    this.formLoading = true;
    const putObj: SavePresc = {
      id: id,
      isPharmacyDelete: true,
    };
    this.subs.add(
      this.pharmacyService.putPrescription(putObj).subscribe(
        () => {
          this.formLoading = false;
          this.newPrescList.splice(index, 1);
          this.doneSwal.fire();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      )
    );

    /* this.deleteSwal.fire().then((result) => {
      if (result.value) {
      }
    }); */
  }
}
