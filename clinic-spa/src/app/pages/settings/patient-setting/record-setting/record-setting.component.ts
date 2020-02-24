import { Component, OnInit, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { NgForm } from '@angular/forms';
import { Location } from '@angular/common';

import {  Recorditem } from '../../settings.model';
import { SettingsService } from '../../settings.service';

@Component({
  selector: 'record-setting',
  templateUrl: './record-setting.component.html',
  styleUrls: ['./record-setting.component.scss']
})
export class RecordSettingComponent implements OnInit {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  recordItems: Recorditem[];

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.recordItems = this.settingService.getRecordItemsSetting();
  }

  onSaveSetting(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveRecordItemsSetting(this.recordItems);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
