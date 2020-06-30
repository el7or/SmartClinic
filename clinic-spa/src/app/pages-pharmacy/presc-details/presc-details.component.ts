import { Component, OnInit, Input } from '@angular/core';
import { NewPrescription } from '../pharmacy.model';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'presc-details',
  templateUrl: './presc-details.component.html',
  styleUrls: ['./presc-details.component.scss']
})
export class PrescDetailsComponent implements OnInit {
  @Input() prescDetails:NewPrescription;

  constructor(public dialogRef: NbDialogRef<PrescDetailsComponent>) { }

  ngOnInit() {
  }

}
