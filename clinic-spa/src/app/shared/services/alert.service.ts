import { Injectable } from '@angular/core';
import { NbToastrService } from '@nebular/theme';
import { LanggService } from './langg.service';

@Injectable({
  providedIn: 'root'
})
export class AlertService {

  constructor(private toastrService: NbToastrService,
    private langgService: LanggService,) { }

  alertError(){
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
