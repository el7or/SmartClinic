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

import { NewBookingComponent } from "../new-booking/new-booking.component";

@Component({
  selector: "bookings-today",
  templateUrl: "./bookings-today.component.html",
  styleUrls: ["./bookings-today.component.scss"]
})
export class BookingsTodayComponent implements OnInit, AfterViewInit {
  @ViewChild("deleteSwal", { static: false }) deleteSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  /* movies = [
    'Episode I - The Phantom Menace',
    'Episode II - Attack of the Clones',
    'Episode III - Revenge of the Sith',
    'Episode IV - A New Hope',
    'Episode V - The Empire Strikes Back',
    'Episode VI - Return of the Jedi',
    'Episode VII - The Force Awakens',
    'Episode VIII - The Last Jedi'
  ]; */
  bookingsList = [
    {
      seq: 1,
      id: 125,
      time: "05:00",
      type: "Urgent Diagnose",
      name: "محمد احمد السيد",
      mobile: "021251021",
      isEnter: true,
      entryTime: "05:10",
      isAttend: true,
      attendTime: "04:45"
    },
    {
      seq: 2,
      id: 112,
      time: "05:30",
      type: "Diagnose",
      name: "محمد علي محمد",
      mobile: "0211425102",
      isEnter: false,
      entryTime: "05:30",
      isAttend: true,
      attendTime: "04:45"
    },
    {
      seq: 3,
      id: 325,
      time: "06:00",
      type: "Diagnose",
      name: "عبير احمد علي",
      mobile: "063546845",
      isEnter: false,
      entryTime: "06:09",
      isAttend: true,
      attendTime: "05:54"
    },
    {
      seq: 4,
      id: 222,
      time: "07:00",
      type: "Consult",
      name: "عبد الفتاح عبد المتجلي عبد العزيز",
      mobile: "015265566",
      isEnter: false,
      entryTime: "07:30",
      isAttend: false,
      attendTime: "07:13"
    },
    {
      seq: 5,
      id: 56,
      time: "07:30",
      type: "Consult",
      name: "منى احمد السيد",
      mobile: "012584686",
      isEnter: false,
      entryTime: "07:48",
      isAttend: false,
      attendTime: "07:20"
    }
  ];

  constructor(
    private dialogService: NbDialogService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {}
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
      // =====> if click on add new booking:
      if (result.value) {
        this.doneSwal.fire();
      }
    });
  }

  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.bookingsList, event.previousIndex, event.currentIndex);
  }
}
