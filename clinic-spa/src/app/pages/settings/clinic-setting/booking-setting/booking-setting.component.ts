import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { SettingsService } from "../../settings.service";
import { BookingSetting } from "../../settings.model";

@Component({
  selector: "booking-setting",
  templateUrl: "./booking-setting.component.html",
  styleUrls: ["./booking-setting.component.scss"]
})
export class BookingSettingComponent implements OnInit {
  formLoading: boolean = false;
  isAllDays: boolean;
  bookingSetting: BookingSetting;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    public location: Location,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    // =====> get current booking setting:
    this.bookingSetting = this.settingService.getBookingSetting();
    this.bookingSetting.workdays.length == 7
      ? (this.isAllDays = true)
      : (this.isAllDays = false);
  }

  onChangeAllDays(event) {
    this.isAllDays = event;
    if (event) {
      this.bookingSetting.workDaysTimes.forEach(
        item => (item.isDayActive = true)
      );
    }
  }

  onChangeSameTimes() {
    if (this.bookingSetting.isSameTimeAllDays) {
      this.bookingSetting.workDaysTimes.forEach(item => {
        item.timeFrom = this.bookingSetting.bookingTimeFrom;
        item.timeTo = this.bookingSetting.bookingTimeTo;
      });
    }
  }

  onChangeAllTimeFrom(event) {
    this.bookingSetting.bookingTimeFrom = event;
    this.bookingSetting.workDaysTimes.forEach(item => {
      item.timeFrom = this.bookingSetting.bookingTimeFrom;
    });
  }
  onChangeAllTimeTo(event) {
    this.bookingSetting.bookingTimeTo = event;
    this.bookingSetting.workDaysTimes.forEach(item => {
      item.timeTo = this.bookingSetting.bookingTimeTo;
    });
  }

  onSaveSetting() {
    this.formLoading = true;
    setTimeout(() => {
      this.settingService.saveBookingSetting(this.bookingSetting);
      this.doneSwal.fire();
      this.formLoading = false;
    }, 1000);
  }
}
