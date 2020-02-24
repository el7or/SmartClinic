import { Component, OnInit } from '@angular/core';

import { SettingsService } from './../../../settings/settings.service';
import { Recorditem } from '../../../settings/settings.model';

@Component({
  selector: 'patient-record',
  templateUrl: './patient-record.component.html',
  styleUrls: ['./patient-record.component.scss']
})
export class PatientRecordComponent implements OnInit {
  recordItems:Recorditem[];

  constructor(private settingService:SettingsService) { }

  ngOnInit() {
    this.recordItems = this.settingService.getRecordItemsSetting();
  }

}
