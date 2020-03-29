import { Component } from "@angular/core";

@Component({
  selector: "ngx-footer",
  styleUrls: ["./footer.component.scss"],
  template: `
    <span class="created-by">Created by<b>
      <a href="mailto:Hatems325@gmail.com" target="_blank">Smart Clinic</a>
    </b>&reg; 2020</span>
    <div class="header-container ads text-center">
      <p class="m-auto">مساحة إعلانية مخصصة: 400px * 40px</p>
    </div>
    <div class="socials">
      <a href="#" target="_blank" class="ion ion-social-facebook"></a>
      <a href="#" target="_blank" class="ion ion-social-twitter"></a>
      <!-- <a href="#" target="_blank" class="ion ion-social-github"></a>
      <a href="#" target="_blank" class="ion ion-social-linkedin"></a> -->
    </div>
  `
})
export class FooterComponent {}
