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

  alertFileSize(){
    this.toastrService.danger(
      this.langgService.translateWord(
        "File size cannot exceed 10MB"
      ),
      this.langgService.translateWord("Large file size!"),
      {
        duration: 10000,
        icon: "close-square-outline",
        destroyByClick: true,
      }
    );
  }

  alertFileType(){
    this.toastrService.danger(
      this.langgService.translateWord(
        "Only image and pdf documents are allowed"
      ),
      this.langgService.translateWord("Wrong file type!"),
      {
        duration: 10000,
        icon: "close-square-outline",
        destroyByClick: true,
      }
    );
  }
}
