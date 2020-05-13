import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from 'rxjs';

import { DiseasesService } from './diseases.service';
import { Disease, PutDiseaseList } from './diseases.model';
import { LanggService } from '../../../../shared/services/langg.service';
import { AlertService } from '../../../../shared/services/alert.service';

@Component({
  selector: "diseases",
  templateUrl: "./diseases.component.html",
  styleUrls: ["./diseases.component.scss"]
})
export class DiseasesComponent implements OnInit, OnDestroy {
  formLoading = false;
  patientDiseases: Disease[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  getQuestSubs: Subscription;
  setQuestSubs: Subscription;

  constructor(
    public location: Location,
    public langgService: LanggService,
    private alertService: AlertService,
    private diseaseService: DiseasesService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getQuestSubs = this.diseaseService.getDiseasesList().subscribe(
      (res: Disease[]) => {
        this.patientDiseases = res;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getQuestSubs.unsubscribe();
    if (this.setQuestSubs) this.setQuestSubs.unsubscribe();
  }

  onSubmit(form: NgForm) {
    this.formLoading = true;
    const putObj:PutDiseaseList = {
      patientDiseaseList :this.patientDiseases
    }
    this.setQuestSubs = this.diseaseService
      .saveDiseasesList(putObj)
      .subscribe(
        () => {
          this.formLoading = false;
          this.doneSwal.fire();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
