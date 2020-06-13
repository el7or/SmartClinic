import { AlertService } from "./../../../../shared/services/alert.service";
import { SettingsService } from "./../../settings.service";
import { Component, OnInit, OnDestroy } from "@angular/core";
import { Subscription } from "rxjs";

import { Recorditem } from "../../settings.model";

@Component({
  selector: "record-items-setting",
  templateUrl: "./record-items-setting.component.html",
  styleUrls: ["./record-items-setting.component.scss"],
})
export class RecordItemsSettingComponent implements OnInit,OnDestroy {
  formLoading = false;
  recordItems: Recorditem[];
  isExpanded = false;

  getRecordSubs: Subscription;

  constructor(
    private settingService: SettingsService,
    private alertService: AlertService
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
  }
  ngOnDestroy(){
    this.getRecordSubs.unsubscribe();
  }
}
