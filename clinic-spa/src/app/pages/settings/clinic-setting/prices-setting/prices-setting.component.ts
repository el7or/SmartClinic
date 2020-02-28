import { Component, OnInit, ViewChild } from '@angular/core';
import { Location } from '@angular/common';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { SettingsService } from './../../settings.service';
import { BookingTypePrice, BookingServicePrice } from '../../settings.model';

@Component({
  selector: 'prices-setting',
  templateUrl: './prices-setting.component.html',
  styleUrls: ['./prices-setting.component.scss']
})
export class PricesSettingComponent implements OnInit {
  formLoading:boolean = false;
  bookingTypePricesList:BookingTypePrice[];
  bookingServicePrices:BookingServicePrice[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private settingService:SettingsService,public location:Location) { }

  ngOnInit() {
    this.bookingTypePricesList = this.settingService.getBookingTypePrices();
    this.bookingServicePrices = this.settingService.getBookingServicePrices();
  }

  onSave(){
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveBookingTypePrices(this.bookingTypePricesList);
      this.settingService.saveBookingServicePrices(this.bookingServicePrices);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }

}
