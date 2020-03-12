import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

import { SettingsService } from '../../../settings.service';

@Component({
  selector: 'add-service',
  templateUrl: './add-service.component.html',
  styleUrls: ['./add-service.component.scss']
})
export class AddServiceComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddServiceComponent>,
    private settingService:SettingsService) { }

  ngOnInit() {
  }

  addService(serviceTitle){
    this.settingService.bookingSettings.bookingServicePrices.push({
      id:50,
      title: serviceTitle,
      service:serviceTitle,
      price:0
    });
    this.dialogRef.close();
  }

}
