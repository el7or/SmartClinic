import { Subscription } from "rxjs";
import { Component, OnInit, OnDestroy, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

import { AuthService } from "./../../../auth/auth.service";
import { AlertService } from '../../services/alert.service';

@Component({
  selector: "profile",
  templateUrl: "./profile.component.html",
  styleUrls: ["./profile.component.scss"]
})
export class ProfileComponent implements OnInit, OnDestroy {
  loading = false;
  currentName: string;
  nameSubscription: Subscription;

  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(
    private dialogRef: NbDialogRef<ProfileComponent>,
    private authService: AuthService,
    private alertService:AlertService,
  ) {}

  ngOnInit() {
    this.nameSubscription = this.authService.getNickName().subscribe(
      name => (this.currentName = name)
    );
  }
  ngOnDestroy() {
    this.nameSubscription.unsubscribe();
  }

  saveNewName(name) {
    this.loading = true;
    this.authService.setNickName(name.value).subscribe(
      () => {
        this.loading = false;
        this.doneSwal.fire();
        this.dialogRef.close();
      },
      (err) => {
        this.loading = false;
        console.error(err);
        this.alertService.alertError();
      }
    );
  }
}
