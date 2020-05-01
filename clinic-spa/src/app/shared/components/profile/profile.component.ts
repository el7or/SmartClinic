import { Subscription } from "rxjs";
import { AuthService } from "./../../../auth/auth.service";
import { Component, OnInit, Input, OnDestroy, ViewChild } from "@angular/core";
import { NbDialogRef, NbToastrService } from "@nebular/theme";
import { LanggService } from '../../services/langg.service';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

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
    private toastrService: NbToastrService,
    private langgService: LanggService,
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
          this.toastrService.danger(
            this.langgService.translateWord(
              "Please refresh page and try again or Contact Developer."
            ),
            this.langgService.translateWord("Something Wrong!"),
            {
              duration: 10000,
              icon: "close-square-outline",
              destroyByClick: true,
            }
          );
      }
    );
  }
}
