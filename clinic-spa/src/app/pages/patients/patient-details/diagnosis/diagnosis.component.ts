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
  today:Date=new Date();
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  diagnosesNames = ['التشخيص 1','التشخيص 2','التشخيص 3'];
  patientDiagnoses:any[] = [
    {
      name:"",
      isNameValid:true,
      grade:"",
      note:""
    }
  ]

  constructor(public location:Location) { }

  ngOnInit() {
  }

  onAddNewItemToList(diagnoseName) {
    this.diagnosesNames.push(diagnoseName);
  }

  // =====> on add new request to form from button:
  onAddDiagnose() {
    this.patientDiagnoses.push({
      name:"",
      isNameValid:true,
      grade:"",
      note:""
    });
  }

  // =====> on remove row from requests:
  onRemoveDiagnose(index) {
    this.patientDiagnoses.splice(index, 1);
  }

  onDeleteDiagnosis(){
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }
}
