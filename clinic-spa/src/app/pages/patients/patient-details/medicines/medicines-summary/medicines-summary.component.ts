import { Component, OnInit, Input } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'medicines-summary',
  templateUrl: './medicines-summary.component.html',
  styleUrls: ['./medicines-summary.component.scss']
})
export class MedicinesSummaryComponent implements OnInit {
  @Input() patientDetails: string;

  constructor(public dialogRef: NbDialogRef<MedicinesSummaryComponent>) { }

  ngOnInit() {
  }

}
