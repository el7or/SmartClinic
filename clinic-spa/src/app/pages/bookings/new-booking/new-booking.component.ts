import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from '@sweetalert2/ngx-sweetalert2';

@Component({
  selector: "new-booking",
  templateUrl: "./new-booking.component.html",
  styleUrls: ["./new-booking.component.scss"]
})
export class NewBookingComponent implements OnInit {
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @Input() patientDetails: string;
  formLoading = false;
  bookingDateLoading = false;
  todayDate:Date = new Date();
  ChoosenDate = null;

  constructor(
    protected dialogRef: NbDialogRef<NewBookingComponent>,
    private localeService: BsLocaleService
  ) {
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {}

  onChooseBookingDate(input:NgForm) {
    console.log(input);
    this.ChoosenDate = input.value;
  }

  onAddBooking(form: NgForm) {
this.doneSwal.fire();
this.dialogRef.close();
  }
}
