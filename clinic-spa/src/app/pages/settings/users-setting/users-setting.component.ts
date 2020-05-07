import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";

import { GetUser } from "./../settings.model";
import { AlertService } from "../../../shared/services/alert.service";
import { SettingsService } from "../settings.service";

@Component({
  selector: "users-setting",
  templateUrl: "./users-setting.component.html",
  styleUrls: ["./users-setting.component.scss"],
})
export class UsersSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  usersList: GetUser[];

  getUsersSubs: Subscription;
  setUserSubs: Subscription;

  constructor(
    private alertService: AlertService,
    private settingService: SettingsService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    this.getUsersSubs = this.settingService.getUsersSetting().subscribe(
      (res: GetUser[]) => {
        this.usersList = res;
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
    this.getUsersSubs.unsubscribe();
    if (this.setUserSubs) this.setUserSubs.unsubscribe();
  }

  onChangeActive(userId, event) {
    this.setUserSubs = this.settingService
      .saveUserActiveSetting(userId, event)
      .subscribe(
        () => {
          this.formLoading = false;
          this.doneSwal.fire();
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
