import { DateTimeService } from "./../../../../shared/services/date-time.service";
import { Subscription } from "rxjs";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";

import { SettingsService } from "../../settings.service";
import { GetBookingSetting, SetBookingSetting } from "../../settings.model";
import { AlertService } from "../../../../shared/services/alert.service";
import { AuthService } from "../../../../auth/auth.service";

@Component({
  selector: "booking-setting",
  templateUrl: "./booking-setting.component.html",
  styleUrls: ["./booking-setting.component.scss"],
})
export class BookingSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  bookingSetting: GetBookingSetting = {};
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  bookGetSubs: Subscription;
  bookSetSubs: Subscription;

  constructor(
    public location: Location,
    private settingService: SettingsService,
    private alertService: AlertService,
    private authService: AuthService,
    private dateTimeService: DateTimeService
  ) {}

  ngOnInit() {
    // =====> get current booking setting:
    this.formLoading = true;
    this.bookGetSubs = this.settingService.getBookingSetting().subscribe(
      (res: GetBookingSetting) => {
        this.bookingSetting = res;
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
    this.bookGetSubs.unsubscribe();
    if (this.bookSetSubs) this.bookSetSubs.unsubscribe();
  }

  onChangeAllDaysOn(event: boolean) {
    if (event) {
      this.bookingSetting.isSaturdayOn = true;
      this.bookingSetting.isMondayOn = true;
      this.bookingSetting.isSundayOn = true;
      this.bookingSetting.isTuesdayOn = true;
      this.bookingSetting.isThursdayOn = true;
      this.bookingSetting.isFridayOn = true;
    }
  }

  onSaveSetting() {
    this.formLoading = true;
    if (
      this.bookingSetting.isSaturdayOn &&
      this.bookingSetting.isMondayOn &&
      this.bookingSetting.isSundayOn &&
      this.bookingSetting.isTuesdayOn &&
      this.bookingSetting.isThursdayOn &&
      this.bookingSetting.isFridayOn
    ) {
      this.bookingSetting.isAllDaysOn = true;
      this.bookingSetting.workDays = [6, 0, 1, 2, 3, 4, 5];
    } else {
      this.bookingSetting.isAllDaysOn = false;
      this.bookingSetting.workDays = [];
      if (this.bookingSetting.isSaturdayOn)
        this.bookingSetting.workDays.push(6);
      if (this.bookingSetting.isSundayOn) this.bookingSetting.workDays.push(0);
      if (this.bookingSetting.isMondayOn) this.bookingSetting.workDays.push(1);
      if (this.bookingSetting.isTuesdayOn) this.bookingSetting.workDays.push(2);
      if (this.bookingSetting.isWednesdayOn)
        this.bookingSetting.workDays.push(3);
      if (this.bookingSetting.isThursdayOn)
        this.bookingSetting.workDays.push(4);
      if (this.bookingSetting.isFridayOn) this.bookingSetting.workDays.push(5);
    }
    const bookingSettingSetObj: SetBookingSetting = {
      doctorId: this.authService.doctorId,
      entryOrderId: this.bookingSetting.entryOrderId,
      bookingPeriod: this.bookingSetting.bookingPeriod,
      consultExpiration: this.bookingSetting.consultExpiration,
      workDays: this.bookingSetting.workDays.toString(),
      isAllDaysOn: this.bookingSetting.isAllDaysOn,
      isAllDaysSameTime: this.bookingSetting.isAllDaysSameTime,
      allDaysTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.allDaysTimeFrom
      ),
      allDaysTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.allDaysTimeTo
      ),
      saturdayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.saturdayTimeFrom
      ),
      saturdayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.saturdayTimeTo
      ),
      sundayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.sundayTimeFrom
      ),
      sundayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.sundayTimeTo
      ),
      mondayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.mondayTimeFrom
      ),
      mondayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.mondayTimeTo
      ),
      tuesdayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.tuesdayTimeFrom
      ),
      tuesdayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.tuesdayTimeTo
      ),
      wednesdayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.wednesdayTimeFrom
      ),
      wednesdayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.wednesdayTimeTo
      ),
      thursdayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.thursdayTimeFrom
      ),
      thursdayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.thursdayTimeTo
      ),
      fridayTimeFrom: this.dateTimeService.clearTime(
        this.bookingSetting.fridayTimeFrom
      ),
      fridayTimeTo: this.dateTimeService.clearTime(
        this.bookingSetting.fridayTimeTo
      ),
    };
    this.bookSetSubs = this.settingService
      .saveBookingSetting(bookingSettingSetObj)
      .subscribe(
        () => {
          this.doneSwal.fire();
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
