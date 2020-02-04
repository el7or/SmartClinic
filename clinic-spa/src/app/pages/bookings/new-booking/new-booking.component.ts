import { NgForm } from "@angular/forms";
import { Component, OnInit, Input, ViewChild } from "@angular/core";
import { NbDialogRef } from "@nebular/theme";
import { BsLocaleService } from "ngx-bootstrap";
import { SwalComponent } from "@sweetalert2/ngx-sweetalert2";

@Component({
  selector: "new-booking",
  templateUrl: "./new-booking.component.html",
  styleUrls: ["./new-booking.component.scss"]
})
export class NewBookingComponent implements OnInit {
  @ViewChild("doneSwal", { static: false }) doneSwal: SwalComponent;
  @ViewChild("expiredSwal", { static: false }) expiredSwal: SwalComponent;
  @Input() patientDetails: string;
  formLoading = false;
  bookingDateLoading = false;
  todayDate: Date = new Date();
  ChoosenDate = null;
  bookingHasDiscount = false;

  constructor(
    protected dialogRef: NbDialogRef<NewBookingComponent>,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {}

  // =====> on submit new booking:
  onAddBooking(form: NgForm) {
    console.log(form.controls);
    this.doneSwal.fire();
    this.dialogRef.close();
  }

  // =====> on choose booking date will fill table with all bookings in same day:
  onChooseBookingDate(input: NgForm) {
    //console.log(input);
    this.ChoosenDate = input.value;
  }

  // =====> check if choosen booking time is already taken in same date:
  onChooseBookingTime(input: NgForm){
    //console.log(input);
    if (new Date(input.value).getHours()==5&&new Date(input.value).getMinutes()==0) {
      input.control.setErrors({'duplicateTime':true})
    }
    else{
      input.control.setErrors(null)
    }
  }

  onChangeType(input: NgForm){
    if (input.value=='2') {
      this.expiredSwal.fire();
    }
  }

  // =====> check if discount in range of amount:
  onChangeDiscount(input: NgForm){
    if (input.value > 50 || input.value < 0) {
      input.control.setErrors({'outRange':true})
    }
    else{
      input.control.setErrors(null);
      input.value > 0 ? this.bookingHasDiscount = true: this.bookingHasDiscount = false;
    }
  }
}
