import { AlertService } from "./../../../../shared/services/alert.service";
import { SettingsService } from "./../../settings.service";
import { Component, OnInit, OnDestroy } from "@angular/core";
import { Subscription } from "rxjs";

import { Recorditem } from "../../settings.model";
import { map } from "rxjs/operators";

@Component({
  selector: "record-items-setting",
  templateUrl: "./record-items-setting.component.html",
  styleUrls: ["./record-items-setting.component.scss"],
})
export class RecordItemsSettingComponent implements OnInit, OnDestroy {
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
    this.getRecordSubs = this.settingService
      .getRecordItemsSetting()
      .pipe(
        map((res: Recorditem[]) => {
          const extraItems: Recorditem[] = [
            {
              id: 3.5,
              textEN: "Examination Areas",
              textAR: "مناطق الفحص",
              isActive: true,
              isExpanded: false,
            },
            {
              id: 5.5,
              textEN: "Ray Areas",
              textAR: "مناطق الأشعة",
              isActive: true,
              isExpanded: false,
            },
          ];
          res.push(...extraItems);
          res.sort((a, b) => a.id - b.id)
          return res;
        })
      )
      .subscribe(
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
  ngOnDestroy() {
    this.getRecordSubs.unsubscribe();
  }
}
