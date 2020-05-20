import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild, OnDestroy } from "@angular/core";
import { Subscription } from "rxjs";
import { NbDialogRef } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { FileUploader, FileItem } from "ng2-file-upload";

import { XraysService } from "../xrays.service";
import {
  XrayDetails,
  PutXray,
  UploadNewFile,
  XrayFileList,
} from "../xrays.model";
import { AlertService } from "./../../../../../shared/services/alert.service";
import { environment } from "../../../../../../environments/environment";
import { AuthService } from "../../../../../auth/auth.service";

@Component({
  selector: "xray-detail",
  templateUrl: "./xray-detail.component.html",
  styleUrls: ["./xray-detail.component.scss"],
})
export class XRayDetailComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  @Input() xRayId: number;
  xrayDetails: XrayDetails;
  uploader: FileUploader;
  attachedFile?: UploadNewFile;
  baseUrl = environment.API_URL;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    public dialogRef: NbDialogRef<XRayDetailComponent>,
    private xrayService: XraysService,
    private authService: AuthService,
    private alertService: AlertService  ) {
    this.uploader = new FileUploader({
      url:
        this.baseUrl + "PatientDetails/PostRayFile/" + this.authService.userId,
      authToken: "Bearer " + localStorage.getItem("token"),
      isHTML5: true,
      allowedFileType: ["image", "pdf", "doc"],
      removeAfterUpload: true,
      autoUpload: false,
      maxFileSize: 10 * 1024 * 1024, // max size: 10 MB
    });

    // =====> if file size bigger than maximum size 10MB:
    this.uploader.onWhenAddingFileFailed = (item, filter, options) => {
      switch (filter.name) {
        case "fileType":
          console.error(`File Type: ${item.type}`);
          this.alertService.alertFileType();
          break;
        case "fileSize":
          console.error(`File Size: (${item.size})`);
          this.alertService.alertFileSize();
          break;
        default:
          console.error(`Unknown error (filter is ${filter.name})`);
          this.alertService.alertError();
      }
    };

    this.uploader.onAfterAddingFile = (fileItem: FileItem) => {
      fileItem.withCredentials = false;
      let latestFile = this.uploader.queue[this.uploader.queue.length - 1];
      this.uploader.queue = [];
      this.uploader.queue.push(latestFile);
    };

    // Add in the other upload form parameters.
    this.uploader.onBuildItemForm = (item, form) => {
      form.append("rayId", this.xRayId);
      form.append("fileTypeId", this.attachedFile.fileTypeId);
      form.append("note", this.attachedFile.fileNote);
    };

    this.uploader.onSuccessItem = (item, response) => {
      let newFileData = JSON.parse(response) as XrayFileList;
      newFileData.fileDownloadUrl = newFileData.fileUrl
        .replace("http:", "https:")
        .replace("upload", "upload/fl_attachment");
      this.xrayDetails.xraysFiles.push(newFileData);
      this.uploader= null;
      this.attachedFile = null;
      this.doneSwal.fire();
    };

    this.uploader.onErrorItem = (item, response) => {
      console.error(JSON.parse(response));
      alertService.alertError();
      this.attachedFile = null;
    };
  }

  ngOnInit() {
    this.formLoading = true;
    this.getSubs = this.xrayService.getXrayDetails(this.xRayId).subscribe(
      (res: XrayDetails) => {
        this.xrayDetails = res;
        this.xrayDetails.xraysFiles.forEach((f) => {
          f.fileDownloadUrl = f.fileUrl
            .replace("http:", "https:")
            .replace("upload", "upload/fl_attachment");
        });
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }
  ngOnDestroy() {
    this.getSubs.unsubscribe();
    if (this.setSubs) this.setSubs.unsubscribe();
  }

  onSave(form: NgForm) {
    this.formLoading = true;
    const putObj: PutXray = {
      id: this.xRayId,
      resultText: form.value.result,
      resultGradeId: form.value.resultGrade,
    };
    this.setSubs = this.xrayService.savePatientRay(putObj).subscribe(
      () => {
        this.formLoading = false;
        this.doneSwal.fire();
        this.dialogRef.close();
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  onAddAttach() {
    this.attachedFile = {
      fileTypeId: 0,
      fileNote: "",
    };
  }
}
