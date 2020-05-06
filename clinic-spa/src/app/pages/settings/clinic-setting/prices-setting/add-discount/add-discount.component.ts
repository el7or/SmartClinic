import { Component, OnInit } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

import { AddServiceComponent } from '../add-service/add-service.component';

@Component({
  selector: 'add-discount',
  templateUrl: './add-discount.component.html',
  styleUrls: ['./add-discount.component.scss']
})
export class AddDiscountComponent implements OnInit {

  constructor(public dialogRef: NbDialogRef<AddServiceComponent>) { }

  ngOnInit() {
  }

  addDiscount(discountTitle){
    this.dialogRef.close(discountTitle);
  }

}
