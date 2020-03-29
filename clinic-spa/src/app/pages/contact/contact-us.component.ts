import { AuthService } from './../../auth/auth.service';
import { Router } from "@angular/router";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

import { ContactMessage } from './contact.model';

@Component({
  selector: "contact-us",
  templateUrl: "./contact-us.component.html",
  styleUrls: ["./contact-us.component.scss"]
})
export class ContactUsComponent implements OnInit {
  formLoading = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private authService:AuthService, private router: Router) {}

  ngOnInit() {}

  onSend(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      const message:ContactMessage={
        userId: this.authService.userId,
        clinicId: this.authService.clinicId,
        subject : form.value.sendSubject,
        message: form.value.sendText
      };
      this.doneSwal.fire();
      this.formLoading = false;
      this.router.navigateByUrl("/");
    }, 1000);
  }
}
