import { Component, OnInit, Input } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'payment-summary',
  templateUrl: './payment-summary.component.html',
  styleUrls: ['./payment-summary.component.scss']
})
export class PaymentSummaryComponent implements OnInit {
  @Input() patientDetails: string;

  constructor(protected dialogRef: NbDialogRef<PaymentSummaryComponent>) { }

  ngOnInit() {
  }

}
