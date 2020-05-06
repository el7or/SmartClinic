import { Component, OnInit, ViewChild, OnDestroy } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { NgForm } from '@angular/forms';
import { Location } from '@angular/common';

import {  Recorditem } from '../../settings.model';
import { SettingsService } from '../../settings.service';
import { LanggService } from '../../../../shared/services/langg.service';
import { Subscription } from 'rxjs';
import { AlertService } from '../../../../shared/services/alert.service';

@Component({
  selector: 'record-setting',
  templateUrl: './record-setting.component.html',
  styleUrls: ['./record-setting.component.scss']
})
export class RecordSettingComponent implements OnInit,OnDestroy {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  recordItems: Recorditem[];

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
    this.getQuestSubs = this.settingService.getRecordItemsSetting().subscribe(
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
    this.getQuestSubs.unsubscribe();
    if (this.setQuestSubs) this.setQuestSubs.unsubscribe();
  }

  onSaveSetting() {
    this.formLoading = true;
    const ids = this.recordItems
      .filter((d) => d.isActive)
      .map((d) => {
        return d.id;
      })
      .toString();
    this.setQuestSubs = this.settingService
      .saveRecordItemsSetting(ids.toString())
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
