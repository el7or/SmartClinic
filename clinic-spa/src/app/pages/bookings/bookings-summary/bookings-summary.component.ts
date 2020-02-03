import { Component, OnInit, Input } from '@angular/core';
import { NbDialogRef } from '@nebular/theme';

@Component({
  selector: 'bookings-summary',
  templateUrl: './bookings-summary.component.html',
  styleUrls: ['./bookings-summary.component.scss']
})
export class BookingsSummaryComponent implements OnInit {
  @Input() patientDetails: string;

  constructor(protected dialogRef: NbDialogRef<BookingsSummaryComponent>) { }

  ngOnInit() {
  }

}
