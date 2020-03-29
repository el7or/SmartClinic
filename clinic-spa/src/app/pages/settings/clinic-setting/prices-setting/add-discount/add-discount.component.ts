import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

import { AddServiceComponent } from '../add-service/add-service.component';
import { SettingsService } from '../../../settings.service';

@Component({
  selector: 'add-discount',
  templateUrl: './add-discount.component.html',
  styleUrls: ['./add-discount.component.scss']
})
export class AddDiscountComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddServiceComponent>,
    private settingService:SettingsService) { }

  ngOnInit() {
  }

  addDiscount(discountTitle){
    this.settingService.bookingSettings.bookingDiscountPrices.push({
      id:50,
      title: discountTitle,
      discount:discountTitle.replace(/\s/g, "").toLowerCase(),
      price:0
    });
    this.dialogRef.close();
  }

}
