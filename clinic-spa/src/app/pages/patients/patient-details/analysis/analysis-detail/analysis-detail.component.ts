import { Component, OnInit, Input, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { NgForm } from "@angular/forms";
import { NbDialogRef } from "@nebular/theme";
import { FileUploader, FileItem, ParsedResponseHeaders } from "ng2-file-upload";
import { Subscription } from 'rxjs';

import { AnalysisDetails, UploadNewFile, AnalysisFileList, PutAnalysis } from "./../analysis.model";
import { AnalysisService } from "../analysis.service";
import { environment } from '../../../../../../environments/environment';
import { AuthService } from '../../../../../auth/auth.service';
import { AlertService } from '../../../../../shared/services/alert.service';

@Component({
  selector: "analysis-detail",
  templateUrl: "./analysis-detail.component.html",
  styleUrls: ["./analysis-detail.component.scss"]
})
export class AnalysisDetailComponent implements OnInit,OnDestroy {
  formLoading: boolean = false;
  @Input() analysisId: number;
  analysisDetails: AnalysisDetails;
  uploader: FileUploader;
  attachedFile?: UploadNewFile;
  baseUrl = environment.API_URL;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  getSubs: Subscription;
  setSubs: Subscription;

  constructor(
    private analysisService: AnalysisService,
    public dialogRef: NbDialogRef<AnalysisDetailComponent>,
    private authService: AuthService,
    private alertService: AlertService
  ) {
    this.uploader = new FileUploader({
      url:
        this.baseUrl + "PatientDetails/PostAnalysisFile/" + this.authService.userId,
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
      form.append("analysisId", this.analysisId);
      form.append("fileTypeId", this.attachedFile.fileTypeId);
      form.append("note", this.attachedFile.fileNote);
    };

    this.uploader.onSuccessItem = (item, response) => {
      let newFileData = JSON.parse(response) as AnalysisFileList;
      newFileData.fileDownloadUrl = newFileData.fileUrl
        .replace("http:", "https:")
        .replace("upload", "upload/fl_attachment");
      this.analysisDetails.analysisFiles.push(newFileData);
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
    this.getSubs = this.analysisService.getAnalysisDetails(this.analysisId).subscribe(
      (res: AnalysisDetails) => {
        this.analysisDetails = res;
        this.analysisDetails.analysisFiles.forEach((f) => {
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
    const putObj: PutAnalysis = {
      id: this.analysisId,
      resultText: form.value.result,
      resultNote: form.value.note,
    };
    this.setSubs = this.analysisService.savePatientAnalysis(putObj).subscribe(
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
