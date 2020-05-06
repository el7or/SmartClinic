import { Subscription } from "rxjs";
import { AuthService } from "./../../../../auth/auth.service";
import { NgForm } from "@angular/forms";
import { Component, OnInit, ViewChild, OnDestroy } from "@angular/core";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { Location } from "@angular/common";
import { FileUploader, FileItem, ParsedResponseHeaders } from "ng2-file-upload";
import { DomSanitizer, SafeUrl } from "@angular/platform-browser";

import { GetPrintSetting, SetPrintSetting } from "../../settings.model";
import { SettingsService } from "../../settings.service";
import { environment } from "../../../../../environments/environment";
import { AlertService } from "../../../../shared/services/alert.service";
import { Router } from '@angular/router';

@Component({
  selector: "print-setting",
  templateUrl: "./print-setting.component.html",
  styleUrls: ["./print-setting.component.scss"],
})
export class PrintSettingComponent implements OnInit, OnDestroy {
  formLoading: boolean = false;
  printInfoSetting: GetPrintSetting = {};
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  baseUrl = environment.API_URL;
  uploader: FileUploader;
  public filePreviewPath: SafeUrl;

  getPrintSubs: Subscription;
  setPrintSubs: Subscription;

  constructor(
    public location: Location,
    private settingsService: SettingsService,
    private authService: AuthService,
    private alertService: AlertService,
    private router:Router,
    private sanitizer: DomSanitizer
  ) {
    this.uploader = new FileUploader({
      url: this.baseUrl + "Clinic/PostPrintSetting/" + this.authService.userId,
      authToken: "Bearer " + localStorage.getItem("token"),
      isHTML5: true,
      allowedFileType: ["image"],
      removeAfterUpload: true,
      autoUpload: false,
      maxFileSize: 10 * 1024 * 1024, // max size: 10 MB
    });
    // =====> if file size bigger than maximum size 10MB:
    this.uploader.onWhenAddingFileFailed = (item, filter, options) => {
      switch (filter.name) {
        case "fileSize":
          console.error(
            `Maximum upload size exceeded (${item.size} of 10MB allowed)`
          );
          break;
        case "mimeType":
          console.error(
            `Type "${item.type} is not allowed. Allowed types: Images`
          );
          break;
        default:
          console.error(`Unknown error (filter is ${filter.name})`);
      }
    };
    // =====>  to preview image after select before uploading:
    this.uploader.onAfterAddingFile = (fileItem: FileItem) => {
      fileItem.withCredentials = false;
      this.filePreviewPath = this.sanitizer.bypassSecurityTrustUrl(
        window.URL.createObjectURL(fileItem._file)
      );
      console.log(this.uploader.queue);
    };
    // Add in the other upload form parameters.
    this.uploader.onBuildItemForm = (item, form) => {
      form.append("clinicId", this.authService.clinicId);
      form.append("doctorName", this.printInfoSetting.doctorName);
      form.append("doctorDegree", this.printInfoSetting.doctorDegree);
      form.append("clinicTitle", this.printInfoSetting.clinicTitle);
      form.append("address1", this.printInfoSetting.address1);
      form.append("address2", this.printInfoSetting.address2);
      form.append("address3", this.printInfoSetting.address3);
      form.append("phone1", this.printInfoSetting.phone1);
      form.append("phone2", this.printInfoSetting.phone2);
      form.append("phone3", this.printInfoSetting.phone3);
    };
    this.uploader.onProgressItem = () => {
      this.formLoading = true;
    };
    this.uploader.onSuccessItem = (item, response) => {
      this.formLoading = false;
      this.doneSwal.fire();
      this.router.navigateByUrl("/pages");
    };
  }

  ngOnInit() {
    this.formLoading = true;
    this.getPrintSubs = this.settingsService.getPrintSetting().subscribe(
      (res: GetPrintSetting) => {
        this.printInfoSetting = res;
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
    this.getPrintSubs.unsubscribe();
    if (this.setPrintSubs) this.setPrintSubs.unsubscribe();
  }

  onSubmit(form: NgForm) {
    // =====> if choose logo with update:
    if (this.uploader.queue.length) {
      this.uploader.queue[0].upload();
    }
    // =====> if update without change logo:
     else {
      this.formLoading = true;
      const setPrintObj: SetPrintSetting = {
        clinicId: this.authService.clinicId,
        address1: this.printInfoSetting.address1,
        address2: this.printInfoSetting.address2,
        address3: this.printInfoSetting.address3,
        clinicTitle: this.printInfoSetting.clinicTitle,
        doctorDegree: this.printInfoSetting.doctorDegree,
        doctorName: this.printInfoSetting.doctorName,
        phone1: this.printInfoSetting.phone1,
        phone2: this.printInfoSetting.phone2,
        phone3: this.printInfoSetting.phone3,
      };
      this.setPrintSubs = this.settingsService
        .savePrintSetting(setPrintObj)
        .subscribe(
          () => {
            this.formLoading = false;
            this.doneSwal.fire();
            this.router.navigateByUrl("/pages");
          },
          (err) => {
            console.error(err);
            this.alertService.alertError();
            this.formLoading = false;
          }
        );
    }
  }
}
