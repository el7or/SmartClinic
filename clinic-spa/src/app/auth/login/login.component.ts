import { Component, ViewChild, Inject, ChangeDetectorRef } from "@angular/core";
import {
  NbLoginComponent,
  NbAuthService,
  NB_AUTH_OPTIONS
} from "@nebular/auth";
import { NgForm } from "@angular/forms";
import { Router } from "@angular/router";

import { User } from "./../auth.model";
import { AuthService } from "./../auth.service";

@Component({
  selector: "ngx-login",
  templateUrl: "./login.component.html",
  styleUrls: ["./login.component.scss"]
})
export class LoginComponent extends NbLoginComponent {
  @ViewChild("form", { static: false }) form: NgForm;
  loading = false;

  constructor(
    private ser: NbAuthService,
    private authService: AuthService,
    service: NbAuthService,
    @Inject(NB_AUTH_OPTIONS) options: {},
    cd: ChangeDetectorRef,
    router: Router
  ) {
    super(service, options, cd, router);
  }

  login() {
    this.loading = true;
    setTimeout(() => {
      const loginUser: User = {
        userName: this.form.value.email,
        password: this.form.value.password
      };
      this.authService.login(loginUser);
      this.loading = false;
      this.router.navigate(["/pages"]);
    }, 1000);
  }
}
