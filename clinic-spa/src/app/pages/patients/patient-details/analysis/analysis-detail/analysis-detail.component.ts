import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { NgForm } from '@angular/forms';
import { NbDialogRef } from '@nebular/theme';
import { FileUploader, FileItem } from 'ng2-file-upload';

// const URL = '/api/';
const URL = "https://api.imgur.com/3/upload";

@Component({
  selector: 'analysis-detail',
  templateUrl: './analysis-detail.component.html',
  styleUrls: ['./analysis-detail.component.scss']
})
export class AnalysisDetailComponent implements OnInit {
  @Input() analysisDetails: string;
  formLoading: boolean = false;
  uploader: FileUploader;
  response: string;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(public dialogRef: NbDialogRef<AnalysisDetailComponent>) {
    this.uploader = new FileUploader({
      url: URL,
      disableMultipart: true, // 'DisableMultipart' must be 'true' for formatDataFunction to be called.
      formatDataFunctionIsAsync: true,
      formatDataFunction: async item => {
        return new Promise((resolve, reject) => {
          resolve({
            name: item._file.name,
            length: item._file.size,
            contentType: item._file.type,
            date: new Date()
          });
        });
      }
    });

    this.uploader.onAfterAddingFile = (fileItem: FileItem) => {
      let latestFile = this.uploader.queue[this.uploader.queue.length - 1];
      this.uploader.queue = [];
      this.uploader.queue.push(latestFile);
      console.log(this.uploader.queue);
    };
  }

  ngOnInit() {
  }

  onSave(form: NgForm) {
    this.doneSwal.fire();
    this.dialogRef.close();
  }

}
