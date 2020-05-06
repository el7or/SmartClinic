import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'add-service',
  templateUrl: './add-service.component.html',
  styleUrls: ['./add-service.component.scss']
})
export class AddServiceComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddServiceComponent>) { }

  ngOnInit() {
  }

  addService(serviceTitle){
    this.dialogRef.close(serviceTitle);
  }

}
