import { Component } from "@angular/core";
import { AdvsService } from '../../services/advs.service';

@Component({
  selector: "ngx-footer",
  styleUrls: ["./footer.component.scss"],
  template: `
    <span class="created-by">Created by<b>
      <a href="mailto:Hatems325@gmail.com" target="_blank">Smart Clinic</a>
    </b>&reg; 2020</span>
    <a [href]="advService.getFooterAdvs().hrefLink" target="_blank" class="header-container ads"
  [style.background]="'url('+ advService.getFooterAdvs().backgroundUrl +')'">
</a>
    <div class="socials">
      <a href="#" target="_blank" class="ion ion-social-facebook"></a>
      <a href="#" target="_blank" class="ion ion-social-twitter"></a>
      <!-- <a href="#" target="_blank" class="ion ion-social-github"></a>
      <a href="#" target="_blank" class="ion ion-social-linkedin"></a> -->
    </div>
  `
})
export class FooterComponent {
  constructor(public advService:AdvsService){}
}
