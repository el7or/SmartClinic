import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Subscription } from "rxjs";

import { GetUser, UserResetPassword } from "./../settings.model";
import { AlertService } from "../../../shared/services/alert.service";
import { SettingsService } from "../settings.service";
import { NbDialogService } from "@nebular/theme";
import { UserResetPasswordComponent } from "./user-reset-password/user-reset-password.component";

@Component({
  selector: "users-setting",
  templateUrl: "./users-setting.component.html",
  styleUrls: ["./users-setting.component.scss"],
})
export class UsersSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  usersList: GetUser[];

  subs = new Subscription();

  constructor(
    private alertService: AlertService,
    private dialogService: NbDialogService,
    private settingService: SettingsService
  ) { }

  ngOnInit() {
    this.formLoading = true;
    this.subs.add(this.settingService.getUsersSetting().subscribe(
      (res: GetUser[]) => {
        this.usersList = res;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    ));
  }
  ngOnDestroy() {
    this.subs.unsubscribe();
  }

  onChangeActive(userId, event) {
    this.subs.add(this.settingService
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
      ));
  }

  onResetPassword(userId) {
    this.subs.add(
      this.dialogService
        .open(UserResetPasswordComponent, {
          context: {
            userId: userId,
          },
          autoFocus: true,
          hasBackdrop: true,
          closeOnBackdropClick: false,
          closeOnEsc: false,
        })
        .onClose.subscribe((userResetPassword: UserResetPassword) => {
          if (userResetPassword && userResetPassword.password) {
            this.formLoading = true;
            this.subs.add(
              this.settingService
                .resetUserPassword(userResetPassword)
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
                )
            );
          }
        })
    );
  }
}
