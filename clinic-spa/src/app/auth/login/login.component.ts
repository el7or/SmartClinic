import { Subscription } from "rxjs";
import { NbToastrService } from "@nebular/theme";
import {
  Component,
  ViewChild,
  Inject,
  ChangeDetectorRef,
  OnDestroy,
} from "@angular/core";
import {
  NbLoginComponent,
  NbAuthService,
  NB_AUTH_OPTIONS,
} from "@nebular/auth";
import { NgForm } from "@angular/forms";
import { Router } from "@angular/router";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { LanggService } from "./../../shared/services/langg.service";
import { LoginUser } from "./../auth.model";
import { AuthService } from "./../auth.service";

@Component({
  selector: "ngx-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"],
})
export class LoginComponent extends NbLoginComponent implements OnDestroy {
  @ViewChild("authSwal", { static: false }) private authSwal: SwalComponent;
  @ViewChild("unAuthSwal", { static: false }) private unAuthSwal: SwalComponent;
  @ViewChild("form", { static: false }) form: NgForm;
  loading = false;
  authSubs: Subscription;

  constructor(
    private ser: NbAuthService,
    private authService: AuthService,
    private toastrService: NbToastrService,
    private langgService: LanggService,
    service: NbAuthService,
    @Inject(NB_AUTH_OPTIONS) options: {},
    cd: ChangeDetectorRef,
    router: Router
  ) {
    super(service, options, cd, router);
  }

  ngOnDestroy() {
    this.authSubs.unsubscribe();
  }

  login() {
    this.loading = true;
    const loginUser: LoginUser = {
      userName: this.form.value.email,
      password: this.form.value.password,
    };
    this.authSubs = this.authService.login(loginUser).subscribe(
      () => {
        this.loading = false;
        //this.authSwal.fire();
        this.router.navigate(["/pages"]);
      },
      (err) => {
        this.loading = false;
        console.error(err);
        if (err.error.title == "Unauthorized") {
          this.unAuthSwal.fire();
        } else {
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
      }
    );
  }
}
