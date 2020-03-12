import { NbDialogService } from '@nebular/theme';
import { Component, OnInit, ViewChild } from '@angular/core';
import { Location } from '@angular/common';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { SettingsService } from './../../settings.service';
import { BookingTypePrice, BookingServicePrice } from '../../settings.model';
import { AddTypeComponent } from './add-type/add-type.component';
import { AddServiceComponent } from './add-service/add-service.component';

@Component({
  selector: 'prices-setting',
  templateUrl: './prices-setting.component.html',
  styleUrls: ['./prices-setting.component.scss']
})
export class PricesSettingComponent implements OnInit {
  formLoading:boolean = false;
  bookingTypePrices:BookingTypePrice[];
  bookingServicePrices:BookingServicePrice[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private settingService:SettingsService,
    private dialogService:NbDialogService,
    public location:Location) { }

  ngOnInit() {
    this.bookingTypePrices = this.settingService.getBookingSetting().bookingTypePrices;
    this.bookingServicePrices = this.settingService.getBookingSetting().bookingServicePrices;
  }

  onAddType(){
    this.dialogService.open(AddTypeComponent, {
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }
  onAddService(){
    this.dialogService.open(AddServiceComponent, {
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });

  }

  onSave(){
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.savePricesSetting(this.bookingTypePrices,this.bookingServicePrices);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }

}
