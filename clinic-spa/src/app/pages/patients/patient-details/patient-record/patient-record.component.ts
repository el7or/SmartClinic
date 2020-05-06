import { NbDialogService } from '@nebular/theme';
import { Component, OnInit } from '@angular/core';
import { Subscription } from 'rxjs';

import { SettingsService } from './../../../settings/settings.service';
import { Recorditem } from '../../../settings/settings.model';
import { BookingDetailsComponent } from '../../../bookings/booking-details/booking-details.component';
import { PatientHeaderInfo } from '../../patients.model';
import { PatientsService } from '../../patients.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'patient-record',
  templateUrl: './patient-record.component.html',
  styleUrls: ['./patient-record.component.scss']
})
export class PatientRecordComponent implements OnInit {
  recordItems:Recorditem[];
  patientInfo: PatientHeaderInfo;
  routeSubs: Subscription;

  constructor(private settingService:SettingsService,
    private dialogService:NbDialogService,
    private patientsService: PatientsService,
    private route: ActivatedRoute,) { }

  ngOnInit() {
    /* this.recordItems = this.settingService.getRecordItemsSetting();
    this.routeSubs = this.route.parent.params.subscribe(params => {
      const patientId = params["id"];
      this.patientInfo = this.patientsService.getPatientHeaderInfo(+patientId)
    }); */
  }

  // =====> on add new booking or edit booking to patients:
  onBook(bookingId:number) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId:bookingId,
        patientId:this.patientInfo.patientId,
        patientName: this.patientInfo.name,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

}
