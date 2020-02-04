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
  @Input() patientDetails: string;
  formLoading = false;
  bookingDateLoading = false;
  todayDate: Date = new Date();
  ChoosenDate = null;

  constructor(
    protected dialogRef: NbDialogRef<NewBookingComponent>,
    private localeService: BsLocaleService
  ) {
    // =====> localize datepicker:
    this.localeService.use(localStorage.getItem("langg"));
  }

  ngOnInit() {}

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

  // =====> on submit new booking:
  onAddBooking(form: NgForm) {
    this.doneSwal.fire();
    this.dialogRef.close();
  }
}
