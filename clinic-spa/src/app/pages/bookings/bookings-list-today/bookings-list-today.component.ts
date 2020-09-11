import { DoctorClinic, ClinicDoctor } from "./../../../auth/auth.model";
import { ChatService } from "../../../shared/services/chat.service";
import { Subscription } from "rxjs";
import { Router } from "@angular/router";
import {
  Component,
  OnInit,
  ViewChild,
  AfterViewInit,
  ChangeDetectorRef,
  OnDestroy,
} from "@angular/core";
import { NbDialogService, NbToastrService } from "@nebular/theme";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";
import { CdkDragDrop, moveItemInArray } from "@angular/cdk/drag-drop";

import { DateWithoutTimePipe } from "./../../../shared/pipes/date-without-time.pipe";
import { LanggService } from "./../../../shared/services/langg.service";
import { BookingsService } from "./../bookings.service";
import { BookingDetailsComponent } from "../booking-details/booking-details.component";
import { BookingList, GetBookingList, PutBookingList } from "../bookings.model";
import { DateTimeService } from "../../../shared/services/date-time.service";
import { AlertService } from "../../../shared/services/alert.service";
import { UserRole } from "../../../auth/auth.model";
import { AuthService } from "../../../auth/auth.service";

@Component({
  selector: "bookings-list-today",
  templateUrl: "./bookings-list-today.component.html",
  styleUrls: ["./bookings-list-today.component.scss"],
})
export class BookingsListTodayComponent
  implements OnInit, AfterViewInit, OnDestroy {
  formLoading = false;
  bookingsList: BookingList[];
  today: Date;
  nextBooking: number;
  sortBookingsByText: string;
  totalPaid: number;
  userRole = UserRole;

  doctorValues: DoctorClinic[] = [];
  selectedDoctor: string;

  clinicValues?: ClinicDoctor[] = [];
  selectedClinic?: string;
  allClinicBookingList?: BookingList[];

  @ViewChild("cancelSwal", { static: false }) cancelSwal: SwalComponent;
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;

  getListSubs: Subscription;
  editListSubs: Subscription;
  cancelBookSubs: Subscription;
  updateBookSubs: Subscription;

  constructor(
    private bookingService: BookingsService,
    private dialogService: NbDialogService,
    private toastrService: NbToastrService,
    private langgService: LanggService,
    private dateTimeService: DateTimeService,
    private alertService: AlertService,
    public authService: AuthService,
    private router: Router,
    private chatService: ChatService,
    private cd: ChangeDetectorRef
  ) {}

  ngOnInit() {
    this.today = new Date();
    if (this.authService.roleName == UserRole.employee) {
      this.doctorValues = JSON.parse(this.authService.doctorsClinic);
      this.selectedDoctor = this.doctorValues[0].doctorId;
    } else {
      this.selectedDoctor = this.authService.doctorId;
    }
    this.formLoading = true;
    // =====> get list bookings in today (come from DB with sorting depends on setting):
    this.getListSubs = this.bookingService
      .getBookingsListByDate(
        this.selectedDoctor,
        this.dateTimeService.dateWithoutTime(this.today)
      )
      .subscribe(
        (res: GetBookingList) => {
          this.bookingsList = res.bookingsList;
          this.sortBookingsByText = res.sortBookingsByText;
          this.totalPaid = res.bookingsList
            .filter((b) => !b.isCanceled)
            .reduce((acc, booking) => acc + booking.paid, 0);
          // =====> set label to first attend booking:
          this.nextBooking = this.bookingsList.findIndex(
            (booking) =>
              booking.isAttend && !booking.isEnter && !booking.isCanceled
          );
          // =====> if doctor with multi clinic:
          if (this.authService.clinicsDoctor) {
            this.allClinicBookingList = this.bookingsList;
            this.clinicValues = JSON.parse(this.authService.clinicsDoctor);
            this.selectedClinic = this.authService.clinicId;
            this.bookingsList = this.allClinicBookingList.filter(
              (c) =>
                c.clinicName ==
                this.clinicValues.find((v) => v.clinicId == this.selectedClinic)
                  .clinicName
            );
          }
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );

    // =====> if another user update booking in today:
    this.updateBookSubs = this.chatService.bookingUpdated.subscribe(
      (patientName: string) => {
        this.alertService.alertUpdateBooking(patientName);
        this.router
          .navigateByUrl("/pages", { skipLocationChange: true })
          .then(() => this.router.navigate(["/pages/bookings/today"]));
      }
    );
  }
  ngAfterViewInit() {
    this.cd.detectChanges();
  }
  ngOnDestroy() {
    this.getListSubs.unsubscribe();
    if (this.editListSubs) this.editListSubs.unsubscribe();
    if (this.cancelBookSubs) this.cancelBookSubs.unsubscribe();
    if (this.updateBookSubs) this.updateBookSubs.unsubscribe();
  }

  // =====> on add new booking on current day tp patient out the table:
  onBookToday() {
    this.bookingService.chosenBookingDate = new Date();
    this.toastrService.info(
      new DateWithoutTimePipe().transform(new Date()),
      this.langgService.translateWord(
        "Choose a Patient to add booking for on chosen day:"
      ),
      {
        icon: "info-outline",
        duration: 5000,
        destroyByClick: true,
      }
    );
    this.router.navigateByUrl("/pages/patients");
  }

  // =====> on add new booking or edit booking to patients in the table:
  onBook(bookingId: number, patientId: string) {
    this.dialogService.open(BookingDetailsComponent, {
      context: {
        bookId: bookingId,
        patientId: patientId,
      },
      autoFocus: true,
      hasBackdrop: true,
      closeOnBackdropClick: false,
      closeOnEsc: false,
    });
  }

  // =====> on cancel booking:
  onDeleteBooking(bookId: number) {
    this.cancelSwal.fire().then((result) => {
      if (result.value) {
        this.formLoading = true;
        this.cancelBookSubs = this.bookingService
          .cancelBooking(bookId)
          .subscribe(
            () => {
              let canceledBooking = this.bookingsList.find(
                (v) => v.bookId == bookId
              );
              canceledBooking.isCanceled = true;
              this.totalPaid = this.totalPaid - canceledBooking.paid;
              this.formLoading = false;
              this.doneSwal.fire();
            },
            (error) => {
              console.error(error);
              this.alertService.alertError();
              this.formLoading = false;
            }
          );
      }
    });
  }

  // =====> on drag drop row in table if order setting is 'Manual':
  drop(event: CdkDragDrop<string[]>) {
    moveItemInArray(this.bookingsList, event.previousIndex, event.currentIndex);
    // =====> reorder array after drag drop:
    this.bookingsList.map((item, index) => (item.daySeqNo = index + 1));
    this.updateBookingListDB(this.bookingsList);
  }

  // =====> on double click on attend patient to make him next booking:
  onSetNextBooking(booking: BookingList, index: number) {
    if (booking.isAttend) {
      moveItemInArray(this.bookingsList, this.nextBooking, index);
      this.bookingsList.map((item, index) => (item.daySeqNo = index + 1));
      this.updateBookingListDB(this.bookingsList);
    }
  }

  // =====> on change attend checkbox:
  onChangeAttend(booking: BookingList) {
    this.bookingsList
      .filter((b) => b.bookId == booking.bookId)
      .map((b) => {
        b.attendTime = new Date();
      });
    this.sortBookings(this.sortBookingsByText);
  }

  // =====> on change enter checkbox:
  onChangeEnter(booking) {
    this.bookingsList
      .filter((b) => b.bookId == booking.bookId)
      .map((b) => {
        b.entryTime = new Date();
        if (!b.attendTime) {
          b.attendTime = b.entryTime;
          b.isAttend = b.isEnter;
        } else {
          b.attendTime = new Date(b.attendTime);
        }
      });
    this.sortBookings(this.sortBookingsByText);
  }

  // =====> reorder list of bookings:
  sortBookings(by: string) {
    switch (by) {
      case "According to the Attendance":
        this.bookingsList
          .sort(
            (a, b) =>
              +b.isEnter - +a.isEnter ||
              +b.isAttend - +a.isAttend ||
              +a.attendTime - +b.attendTime
          )
          .map((item, index) => (item.daySeqNo = index + 1));
        this.updateBookingListDB(this.bookingsList);
        break;
      case "According to the Booking Time":
        this.bookingsList
          .sort((a, b) => +b.isEnter - +a.isEnter || +a.time - +b.time)
          .map((item, index) => (item.daySeqNo = index + 1));
        this.updateBookingListDB(this.bookingsList);
        break;
    }
    // =====> set label to first attend booking:
    this.nextBooking = this.bookingsList.findIndex(
      (booking) => booking.isAttend && !booking.isEnter && !booking.isCanceled
    );
  }

  updateBookingListDB(bookingList: BookingList[]) {
    this.formLoading = true;
    bookingList.forEach((book) => {
      book.entryTimeString = book.isEnter
        ? this.dateTimeService.clearTime(book.entryTime)
        : null;
      book.attendTimeString = book.isAttend
        ? this.dateTimeService.clearTime(book.attendTime)
        : null;
    });
    const listObj: PutBookingList = {
      clinicId: this.authService.clinicId,
      bookingsList: bookingList,
    };
    this.editListSubs = this.bookingService.putBookingsList(listObj).subscribe(
      () => {
        this.doneSwal.fire();
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  // =====> on click file patient in table:
  onOpenFilePatient(codeId: number) {
    if (this.authService.roleName != UserRole.employee) {
      this.router.navigate(["/pages/patients/details/" + codeId + "/record"]);
    } else {
      this.router.navigate(["/pages/patients/details/" + codeId + "/basic"]);
    }
  }

  onChangeDoctor() {
    this.formLoading = true;
    this.getListSubs = this.bookingService
      .getBookingsListByDate(
        this.selectedDoctor,
        this.dateTimeService.dateWithoutTime(this.today)
      )
      .subscribe(
        (res: GetBookingList) => {
          this.bookingsList = res.bookingsList;
          this.sortBookingsByText = res.sortBookingsByText;
          this.totalPaid = res.bookingsList
            .filter((b) => !b.isCanceled)
            .reduce((acc, booking) => acc + booking.paid, 0);
          // =====> set label to first attend booking:
          this.nextBooking = this.bookingsList.findIndex(
            (booking) =>
              booking.isAttend && !booking.isEnter && !booking.isCanceled
          );
          this.formLoading = false;
        },
        (err) => {
          console.error(err);
          this.alertService.alertError();
          this.formLoading = false;
        }
      );
  }

  onChangeClinic() {
    this.bookingsList = this.allClinicBookingList.filter(
      (c) =>
        c.clinicName ==
        this.clinicValues.find((v) => v.clinicId == this.selectedClinic)
          .clinicName
    );
  }
}
