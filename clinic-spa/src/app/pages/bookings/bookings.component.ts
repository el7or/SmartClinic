import { Component, OnInit } from "@angular/core";

@Component({
  selector: "bookings",
  template: `
    <router-outlet></router-outlet>
  `,
  styleUrls: ["./bookings.component.scss"]
})
export class BookingsComponent implements OnInit {
  tabsBookings: any[];

  constructor() {}

  ngOnInit() {}
}
