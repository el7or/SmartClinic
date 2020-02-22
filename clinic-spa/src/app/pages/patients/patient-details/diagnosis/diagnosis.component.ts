import { Component, OnInit, ViewChild } from '@angular/core';
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';
import { Location } from '@angular/common';

@Component({
  selector: 'diagnosis',
  templateUrl: './diagnosis.component.html',
  styleUrls: ['./diagnosis.component.scss']
})
export class DiagnosisComponent implements OnInit {
  formLoading:boolean = false;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;

  constructor(public location:Location) { }

  ngOnInit() {
  }

  onDeleteDiagnosis(){
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
