import { Component, OnInit, Input, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { NgForm } from '@angular/forms';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'analysis-detail',
  templateUrl: './analysis-detail.component.html',
  styleUrls: ['./analysis-detail.component.scss']
})
export class AnalysisDetailComponent implements OnInit {
  @Input() analysisDetails: string;
  formLoading: boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  constructor(public dialogRef: NbDialogRef<AnalysisDetailComponent>) { }

  ngOnInit() {
  }

  onSave(form: NgForm) {
    this.doneSwal.fire();
    this.dialogRef.close();
  }

}
