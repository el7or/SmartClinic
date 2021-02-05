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

import { LoginUser, UserRole, ClinicDoctor } from "./../auth.model";
import { AuthService } from "./../auth.service";
import { AlertService } from "../../shared/services/alert.service";
import Swal from "sweetalert2";

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
    private alertService: AlertService,
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
      (roleName: UserRole) => {
        switch (roleName) {
          case UserRole.doctor:
            if (this.authService.clinicsDoctor) {
              const doctorClinics: ClinicDoctor[] = JSON.parse(
                this.authService.clinicsDoctor
              );
              const doctorClinicsNames = {};
              for (var i = 0; i < doctorClinics.length; i++) {
                doctorClinicsNames[doctorClinics[i].clinicId] =
                  doctorClinics[i].clinicName;
              }
              this.loading = false;
              Swal.fire({
                icon: "info",
                title: "اختار العيادة:",
                input: "select",
                inputOptions: doctorClinicsNames,
                confirmButtonText: "فتح",
                showCancelButton: false,
              }).then((result) => {
                if (result.value) {
                  localStorage.setItem("clinicId", result.value);
                  this.authSwal.fire();
                  this.router.navigate(["/pages"]);
                }
              });
              break;
            } else {
              this.loading = false;
              this.authSwal.fire();
              this.router.navigate(["/pages"]);
              break;
            }
          case UserRole.employee:
            this.loading = false;
            this.authSwal.fire();
            this.router.navigate(["/pages"]);
            break;
          case UserRole.pharmacy:
            this.loading = false;
            this.authSwal.fire();
            this.router.navigate(["/pharmacy"]);
            break;
          default:
            break;
        }
      },
      (err) => {
        console.error(err);
        if (err.status == 401) {
          this.unAuthSwal.fire();
        }
        else if (err.status == 400) {
          Swal.fire({
            title: 'غير مسموح بالدخول !',
            text: err.error,
            icon: 'error',
            confirmButtonText: 'حسناً',
          })
        }
        else {
          this.alertService.alertError();
        }
        this.loading = false;
      }
    );
  }
}
