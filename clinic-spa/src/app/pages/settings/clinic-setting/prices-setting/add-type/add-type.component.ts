import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

import { SettingsService } from './../../../settings.service';

@Component({
  selector: 'add-type',
  templateUrl: './add-type.component.html',
  styleUrls: ['./add-type.component.scss']
})
export class AddTypeComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddTypeComponent>,
    private settingService:SettingsService) { }

  ngOnInit() {
  }

  addType(typeTitle){
    this.settingService.bookingSettings.bookingTypePrices.push({
      id:50,
      title: typeTitle,
      type:typeTitle,
      price:0
    });
    this.dialogRef.close();
  }

}
