import {
  Component,
  OnInit,
  ViewChild,
  AfterViewInit,
  ChangeDetectorRef
} from "@angular/core";
import { NbDialogService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { CdkDragDrop, moveItemInArray } from "@angular/cdk/drag-drop";

import { BookingsService } from './../bookings.service';
import { NewBookingComponent } from "../new-booking/new-booking.component";
import { PaymentSummaryComponent } from '../../finance/payment-summary/payment-summary.component';

@Component({
  selector: "bookings-list-today",
  templateUrl: "./bookings-list-today.component.html",
  styleUrls: ["./bookings-list-today.component.scss"]
})
export class BookingsTodayComponent implements OnInit, AfterViewInit {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  bookingsList:any;

  constructor(
    private bookingService:BookingsService,
    private dialogService: NbDialogService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {
    this.bookingsList = this.bookingService.getBookingsListToday(new Date());
  }
  ngAfterViewInit() {
    this.cd.detectChanges();
  }

  onNewBook() {
    this.dialogService.open(NewBookingComponent, {
      context: {
        patientDetails: "محمد أحمد السيد"
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false
    });
  }

  onDeleteBooking() {
    this.deleteSwal.fire().then(result => {
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.bookingsList, event.previousIndex, event.currentIndex);
    // =====> sort array after deag drop:
    this.bookingsList
      .sort((a, b) => +b.isEnter - +a.isEnter)
      .map((item, index) => (item.seq = index + 1));
  }

  onOpenPaymentSummary(patientId: number){
    this.dialogService.open(PaymentSummaryComponent, {
      context: {
        patientDetails: "ملخص حالة الدفع:"
      },
      autoFocus: true,
      hasBackdrop: true
    });
  }
}
