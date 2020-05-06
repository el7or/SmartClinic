import { Subscription } from "rxjs";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { LanggService } from "./../../../../shared/services/langg.service";
import { SettingsService } from "../../settings.service";
import { DiseaseQuestion } from "../../settings.model";
import { AlertService } from "../../../../shared/services/alert.service";

@Component({
  selector: "diseases-setting",
  templateUrl: "./diseases-setting.component.html",
  styleUrls: ["./diseases-setting.component.scss"],
})
export class DiseasesSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  diseasesList: DiseaseQuestion[];

  getQuestSubs: Subscription;
  setQuestSubs: Subscription;

  constructor(
    public location: Location,
    public langgService: LanggService,
    private alertService: AlertService,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getQuestSubs = this.settingService.getDiseasesSetting().subscribe(
      (res: DiseaseQuestion[]) => {
        this.diseasesList = res;
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

  onSaveSetting() {
    this.formLoading = true;
    const ids = this.diseasesList
      .filter((d) => d.isActive)
      .map((d) => {
        return d.id;
      })
      .toString();
    this.setQuestSubs = this.settingService
      .saveDiseasesSetting(ids.toString())
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
