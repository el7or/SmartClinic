import { Subscription } from 'rxjs';
import { Router } from "@angular/router";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { HttpClient } from "@angular/common/http";

import { AlertService } from "./../../shared/services/alert.service";
import { AuthService } from "./../../auth/auth.service";
import { ContactMessage } from "./contact.model";
import { environment } from "../../../environments/environment";

@Component({
  selector: "contact-us",
  templateUrl: "./contact-us.component.html",
  styleUrls: ["./contact-us.component.scss"],
})
export class ContactUsComponent implements OnInit, OnDestroy {
  formLoading = false;
  baseUrl = environment.API_URL;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  subs:Subscription;

  constructor(
    private http: HttpClient,
    private authService: AuthService,
    private alertService: AlertService,
    private router: Router
  ) {}

  ngOnInit() {}
  ngOnDestroy(){
    if(this.subs) this.subs.unsubscribe();
  }

  onSend(form: NgForm) {
    this.formLoading = true;
    const message: ContactMessage = {
      clinicId: this.authService.clinicId,
      subject: form.value.sendSubject,
      message: form.value.sendText,
    };
    this.subs =  this.http
      .post(this.baseUrl + "Contact/" + this.authService.userId, message)
      .subscribe(
        () => {
          this.doneSwal.fire();
          this.formLoading = false;
          this.router.navigateByUrl("/");
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }
}
