import { CalendarOperationsComponent } from './calendar-operations/calendar-operations.component';
import { DateTimeService } from "./../../shared/services/date-time.service";
import { Router } from "@angular/router";
import { Component, OnInit, OnDestroy } from "@angular/core";
import dayGridPlugin from "@fullcalendar/daygrid";
import timeGridPlugin from "@fullcalendar/timegrid";
import listPlugin from "@fullcalendar/list";
import interactionPlugin from "@fullcalendar/interaction";
import arLocale from "@fullcalendar/core/locales/ar";
import enLocale from "@fullcalendar/core/locales/en-gb";
import momentPlugin from "@fullcalendar/moment";
import { Subscription } from "rxjs";
import { NbToastrService, NbDialogService } from "@nebular/theme";

import { AlertService } from "./../../shared/services/alert.service";
import { HomeService } from "./home.service";
import { BookingsService } from "./../bookings/bookings.service";
import { LanggService } from "../../shared/services/langg.service";
import { HomeEvents, ClickType } from "./home.model";

@Component({
  selector: "home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"],
})
export class HomeComponent implements OnInit, OnDestroy {
  formLoading = false;
  locle: any;
  langSubscription: Subscription;

  calendarDefaultView = "dayGridMonth";
  calendarHiddenDays: number[];
  calendarPlugins = [
    dayGridPlugin,
    timeGridPlugin,
    listPlugin,
    interactionPlugin,
    momentPlugin,
  ];
  calendarHeader = { center: "listWeek,dayGridMonth,dayGridWeek,timeGridDay" };
  calendarEvents;

  getSubs: Subscription;

  constructor(
    private router: Router,
    private langgService: LanggService,
    private toastrService: NbToastrService,
    private homeService: HomeService,
    private bookingService: BookingsService,
    private dialogService:NbDialogService,
    private alertService: AlertService,
    private datetimeService: DateTimeService
  ) {}

  ngOnInit() {
    this.formLoading = true;
    /* // =====> Detect Responsive Screen Size to some changes on calendar:
    if (window.innerWidth < 835) {
      this.calendarHeader = { center: "" };
    }
    if(window.innerWidth < 500){
      this.calendarDefaultView = 'listWeek';
    } */

    // =====> localize fullcalendar:
    this.langSubscription = this.langgService.lang.subscribe((lang) => {
      if (lang == "en") {
        this.locle = enLocale;
      } else {
        this.locle = arLocale;
      }
    });

    // =====> get calendar events:
    this.getSubs = this.homeService.getCalendarEvents().subscribe(
      (res: HomeEvents) => {
        this.calendarEvents = res.calendarEvents;
        // =====> set weekends days to hide them:
        this.calendarHiddenDays = res.weekEnds;
        this.formLoading = false;
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
        this.formLoading = false;
      }
    );
  }

  ngOnDestroy() {
    if (this.langSubscription) this.langSubscription.unsubscribe();
    if (this.getSubs) this.getSubs.unsubscribe();
  }

  addEvent() {
    //this.calendarEvents.push({ title: 'event 2', date: '2020-01-31' });
  }

  modifyTitle(eventIndex, newTitle) {
    //this.calendarEvents[eventIndex].title = newTitle;
  }

  onEventClick(info) {
    const eventTitle: string = info.event.title;
    if (eventTitle.includes("العمليات")) {
      this.dialogService.open(CalendarOperationsComponent, {
        context: {
          eventDate: info.event.start,
        },
        autoFocus: true,
        hasBackdrop: true,
        closeOnBackdropClick: false,
        closeOnEsc: false,
      });
    } else {
      this.openBookings(info, ClickType.EventClick);
    }
    //this.router.navigateByUrl("/pages/bookings");
    /* alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);
    info.el.style.borderColor = 'red'; */
  }

  onDateClick(info) {
    this.openBookings(info, ClickType.DateClick);
    /* alert('Clicked on: ' + info.dateStr);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('Current view: ' + info.view.type);
    info.dayEl.style.backgroundColor = 'red'; */
  }

  onMouseOver(info) {
    /* console.log(info.el);
    info.el.setAttribute('nbTooltip',info.event.extendedProps.description); */
  }

  onEventRender(info) {
    /* console.log(info);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('nbTooltip',info.event.extendedProps.description);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('ng-reflect-content',info.event.extendedProps.description);*/
    info.el.setAttribute("title", info.event.extendedProps.description);
  }

  openBookings(info, clickType: ClickType) {
    // =====> check clicked date if today or past or future:
    const todayShort = this.datetimeService.dateWithoutTime(new Date());
    const todayString = new Date(todayShort).toISOString();
    const currentDate =
      clickType == ClickType.DateClick
        ? info.dateStr
        : this.datetimeService.dateWithoutTime(info.event.start);
    const dateClicked = new Date(currentDate).toISOString();
    // =====> if clicked on today:
    if (todayString == dateClicked) {
      this.router.navigateByUrl("/pages/bookings/today");
    }
    // =====> if clicked on past:
    else if (todayString > dateClicked) {
      this.router.navigate(["/pages/bookings/list", currentDate]);
    }
    // =====> if clicked on future:
    else if (todayString < dateClicked) {
      // =====> save clicked date to next booking:
      this.bookingService.chosenBookingDate = info.date;
      this.toastrService.info(
        currentDate,
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
  }
}
