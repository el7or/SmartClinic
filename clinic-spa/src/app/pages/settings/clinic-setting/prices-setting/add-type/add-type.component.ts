import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'add-type',
  templateUrl: './add-type.component.html',
  styleUrls: ['./add-type.component.scss']
})
export class AddTypeComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddTypeComponent>) { }

  ngOnInit() {
  }

  addType(typeTitle){
    this.dialogRef.close(typeTitle);
  }
}
