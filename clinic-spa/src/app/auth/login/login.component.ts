import { Subscription } from "rxjs";
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

import { LoginUser } from "./../auth.model";
import { AuthService } from "./../auth.service";
import { AlertService } from '../../shared/services/alert.service';

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
    private alertService:AlertService,
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
        this.authSwal.fire();
        this.router.navigate(["/pages"]);
        this.loading = false;
      },
      (err) => {
        console.error(err);
        if (err.error.title == "Unauthorized") {
          this.unAuthSwal.fire();
        } else {
          this.alertService.alertError();
        }
        this.loading = false;
      }
    );
  }
}
