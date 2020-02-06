import { LanggService } from "./../../shared/services/langg.service";
import { Component, OnInit } from "@angular/core";

@Component({
  selector: "bookings",
  templateUrl: "./bookings.component.html",
  styleUrls: ["./bookings.component.scss"]
})
export class BookingsComponent implements OnInit {
  tabsBookings:any[];

  constructor(private langgService: LanggService) {
    this.tabsBookings = [
      {
        title: langgService.translateWord('Browse Bookings'),
        route: "/pages/bookings/list",
        icon: "search-outline",
      },
      {
        title: langgService.translateWord('Today Bookings'),
        route: "/pages/bookings/today",
        icon: "clipboard-outline"
      }
    ];
  }

  ngOnInit() {}
}
