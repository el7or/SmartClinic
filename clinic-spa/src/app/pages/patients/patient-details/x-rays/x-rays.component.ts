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

  xRaysList: any[] = [
    {
      id:11235,
      requestDate: "2020-5-3",
      xRayName: "PLAIN  X RAY FILM",
      note: "",
      result: "",
      resultDate: "2020-12-17",
      xRayFile: "fghfg",
      isEditing: false,
      isDeleted: false
    },
    {
      id:11335,
      requestDate: "2020-3-3",
      xRayName: "COLORED DOPPLER(DUPPLEX)",
      note: "",
      result: "",
      resultDate: "",
      xRayFile: "",
      isEditing: false,
      isDeleted: false
    }
  ];

  constructor() {
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

  onAddXray(){
    this.xRaysList.push({
      id:11235,
      requestDate: "2020-2-14",
      xRayName: "",
      note: "",
      result: "",
      resultDate: "",
      xRayFile: "fghfg",
      isEditing: true,
      isDeleted: false
    },)
  }

  onRemoveXray(index){
    this.xRaysList.splice(index,1);
  }
}
