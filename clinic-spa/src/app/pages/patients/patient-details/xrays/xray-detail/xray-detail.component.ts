import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { FileUploader, FileItem, ParsedResponseHeaders } from "ng2-file-upload";
import { XraysService } from "../xrays.service";
import { XrayDetails } from "../xrays.model";

// const URL = '/api/';
const URL = "https://api.imgur.com/3/upload";

@Component({
  selector: "xray-detail",
  templateUrl: "./xray-detail.component.html",
  styleUrls: ["./xray-detail.component.scss"],
})
export class XRayDetailComponent implements OnInit {
  @Input() xRayId: number;
  xrayDetails: XrayDetails;
  formLoading: boolean = false;
  uploader: FileUploader;
  response: string;
  fileType: string;
  todayDate: Date = new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  attachedFile: any;

  constructor(
    public dialogRef: NbDialogRef<XRayDetailComponent>,
    private xrayService: XraysService
  ) {
    this.uploader = new FileUploader({
      url: URL,
      maxFileSize: 10 * 1024 * 1024, // max size: 10 MB
      disableMultipart: true, // 'DisableMultipart' must be 'true' for formatDataFunction to be called.
      formatDataFunctionIsAsync: true,
      formatDataFunction: async (item) => {
        return new Promise((resolve, reject) => {
          resolve({
            name: item._file.name,
            length: item._file.size,
            contentType: item._file.type,
            date: new Date(),
          });
        });
      },
    });

    // =====> if file size bigger than maximum size 10MB:
    this.uploader.onWhenAddingFileFailed = (item, filter, options) => {
      switch (filter.name) {
        case "fileSize":
          //this.errorMessage = `Maximum upload size exceeded (${item.size} of ${this.maxFileSize} allowed)`;
          break;
        case "mimeType":
          //const allowedTypes = this.allowedMimeType.join();
          //this.errorMessage = `Type "${item.type} is not allowed. Allowed types: "${allowedTypes}"`;
          break;
        default:
        //this.errorMessage = `Unknown error (filter is ${filter.name})`;
      }
    };

    this.uploader.onAfterAddingFile = (fileItem: FileItem) => {
      let latestFile = this.uploader.queue[this.uploader.queue.length - 1];
      this.uploader.queue = [];
      this.uploader.queue.push(latestFile);
      console.log(this.uploader.queue);
    };

    this.uploader.onCompleteItem = (
      item: FileItem,
      response: string,
      status: number,
      headers: ParsedResponseHeaders
    ) => {
      this.uploader.queue = [];
      this.attachedFile = null;
      this.doneSwal.fire();
    };

    this.uploader.response.subscribe((res) => (this.response = res));
  }

  ngOnInit() {
    this.xrayDetails = this.xrayService.getXrayDetails(this.xRayId);
  }

  onSave(form: NgForm) {
    this.doneSwal.fire();
    this.dialogRef.close();
  }

  onAddAttach() {
    this.attachedFile = {
      fileType: "",
      fileNote: "",
      file: "",
    };
  }
}
