import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'add-item',
  templateUrl: './add-item.component.html',
  styleUrls: ['./add-item.component.scss']
})
export class AddItemComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddItemComponent>) { }

  ngOnInit() {
  }

  addItem(typeTitle){
    this.dialogRef.close(typeTitle);
  }

}
