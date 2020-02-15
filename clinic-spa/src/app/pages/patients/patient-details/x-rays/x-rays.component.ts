import { XRayDetailComponent } from './x-ray-detail/x-ray-detail.component';
import { NbDialogService } from '@nebular/theme';
import { Component, OnInit } from "@angular/core";
import { FileSelectDirective, FileDropDirective, FileUploader } from 'ng2-file-upload';

// const URL = '/api/';
const URL = 'https://zawag.azurewebsites.net/api/photos/9222ffec-1d4d-4c15-b444-ebd0ec8b6b20';

@Component({
  selector: "x-rays",
  templateUrl: "./x-rays.component.html",
  styleUrls: ["./x-rays.component.scss"]
})

export class XRaysComponent implements OnInit {
  uploader:FileUploader;
  response:string;

  constructor(private dialogService: NbDialogService) {
    this.uploader = new FileUploader({
      url: URL,
      disableMultipart: true, // 'DisableMultipart' must be 'true' for formatDataFunction to be called.
      formatDataFunctionIsAsync: true,
      formatDataFunction: async (item) => {
        return new Promise( (resolve, reject) => {
          resolve({
            name: item._file.name,
            length: item._file.size,
            contentType: item._file.type,
            date: new Date()
          });
        });
      }
    });

    this.uploader.response.subscribe( res => this.response = res );
  }

  ngOnInit() {}

  onOpenXrayDetails(){
    this.dialogService.open(XRayDetailComponent, {
      context: {
        xRayDetails: "PLAIN X RAY FILM",
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }
}
