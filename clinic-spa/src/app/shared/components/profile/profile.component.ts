import { Subscription } from "rxjs";
import { AuthService } from "./../../../auth/auth.service";
import { Component, OnInit, Input, OnDestroy } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";

@Component({
  selector: "profile",
  templateUrl: "./profile.component.html",
  styleUrls: ["./profile.component.scss"]
})
export class ProfileComponent implements OnInit, OnDestroy {
  currentName: string;
  nameSubscription: Subscription;

  constructor(
    private dialogRef: NbDialogRef<ProfileComponent>,
    private authService: AuthService
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
    this.authService.setNickName(name.value);
    this.dialogRef.close();
  }
}
