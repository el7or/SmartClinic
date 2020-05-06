import { Router } from '@angular/router';
import { AlertService } from "./../../../../shared/services/alert.service";
import { Subscription } from "rxjs";
import { NbDialogService } from "@nebular/theme";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { Location } from "@angular/common";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { SettingsService } from "./../../settings.service";
import {
  BookingTypePrice,
  BookingServicePrice,
  BookingDiscountPrice,
  GetPricesSetting,
} from "../../settings.model";
import { AddTypeComponent } from "./add-type/add-type.component";
import { AddServiceComponent } from "./add-service/add-service.component";
import { AddDiscountComponent } from "./add-discount/add-discount.component";

@Component({
  selector: "prices-setting",
  templateUrl: "./prices-setting.component.html",
  styleUrls: ["./prices-setting.component.scss"],
})
export class PricesSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  bookingTypePrices: BookingTypePrice[];
  bookingServicePrices: BookingServicePrice[];
  bookingDiscountPrices: BookingDiscountPrice[];
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  priceGetSubs: Subscription;
  priceSetSubs: Subscription;

  constructor(
    private settingService: SettingsService,
    private dialogService: NbDialogService,
    private alertService: AlertService,
    private router:Router,
    public location: Location
  ) {}

  ngOnInit() {
    /* this.bookingTypePrices = this.settingService.getBookingSetting().bookingTypePrices;
    this.bookingServicePrices = this.settingService.getBookingSetting().bookingServicePrices;
    this.bookingDiscountPrices = this.settingService.getBookingSetting().bookingDiscountPrices; */
    // =====> get current booking setting:
    this.formLoading = true;
    this.priceGetSubs = this.settingService.getPricesSetting().subscribe(
      (res: GetPricesSetting) => {
        this.bookingTypePrices = res.bookingTypes;
        this.bookingServicePrices = res.serviceTypes;
        this.bookingDiscountPrices = res.discountTypes;
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
    this.priceGetSubs.unsubscribe();
    if(this.priceSetSubs) this.priceSetSubs.unsubscribe();
  }

  onAddType() {
    this.dialogService
      .open(AddTypeComponent, {
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      })
      .onClose.subscribe((newType) =>
        this.bookingTypePrices.push({
          id: 0,
          type: newType,
          price: 0,
        })
      );
  }
  onAddService() {
    this.dialogService
      .open(AddServiceComponent, {
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      })
      .onClose.subscribe((newService) =>
        this.bookingServicePrices.push({
          id: 0,
          service: newService,
          price: 0,
        })
      );
  }
  onAddDiscount() {
    this.dialogService
      .open(AddDiscountComponent, {
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      })
      .onClose.subscribe((newDiscount) =>
        this.bookingDiscountPrices.push({
          id: 0,
          discount: newDiscount,
          price: 0,
          isPercent: false,
        })
      );
  }

  onSave() {
    this.formLoading = true;
    const allPrices: GetPricesSetting = {
      bookingTypes: this.bookingTypePrices,
      serviceTypes: this.bookingServicePrices,
      discountTypes: this.bookingDiscountPrices,
    };
    this.priceSetSubs =  this.settingService.savePricesSetting(allPrices).subscribe(
      () => {
        this.doneSwal.fire();
        this.formLoading = false;
        this.router.navigateByUrl("/pages");
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
}
