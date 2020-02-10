import { Router } from "@angular/router";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "contact-us",
  templateUrl: "./contact-us.component.html",
  styleUrls: ["./contact-us.component.scss"]
})
export class ContactUsComponent implements OnInit {
  formLoading = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(private router: Router) {}

  ngOnInit() {}

  onSend(form: NgForm) {
    this.formLoading = true;
    setTimeout(() => {
      this.doneSwal.fire();
      this.formLoading = false;
      this.router.navigateByUrl("/");
    }, 1000);
  }
}
