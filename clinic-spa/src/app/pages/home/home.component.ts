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
import { NbToastrService } from "@nebular/theme";

import { BookingsService } from "./../bookings/bookings.service";
import { SettingsService } from "./../settings/settings.service";
import { LanggService } from "../../shared/services/langg.service";

@Component({
  selector: "home",
  templateUrl: "./home.component.html",
  styleUrls: ["./home.component.scss"]
})
export class HomeComponent implements OnInit, OnDestroy {
  locle: any;
  langSubscription: Subscription;

  calendarHiddenDays: number[];
  calendarPlugins = [
    dayGridPlugin,
    timeGridPlugin,
    listPlugin,
    interactionPlugin,
    momentPlugin
  ];
  calendarHeader = { center: "listWeek,dayGridMonth,dayGridWeek,timeGridDay" };
  calendarEvents = [
    {
      title: "الكشوفات: 12",
      start: "2020-02-01",
      description: "د/محمد أحمد"
    },
    {
      title: "الاستشارات: 7",
      start: "2020-02-01",
      description: "د/أحمد مصطفى"
    },
    {
      title: "كل الحجوزات: 19",
      start: "2020-02-01",
      description: "د/أحمد مصطفى"
    },
    {
      title: "الكشوفات: 10",
      start: "2020-02-03",
      description: "د/سناء عزت"
    },
    {
      title: "كل الحجوزات: 10",
      start: "2020-02-03",
      description: "د/سناء عزت"
    }
  ];

  constructor(
    private router: Router,
    private langgService: LanggService,
    private toastrService: NbToastrService,
    private settingService: SettingsService,
    private bookingService: BookingsService
  ) {}
  ngOnInit() {
    // =====> localize fullcalendar:
    this.langSubscription = this.langgService.lang.subscribe(lang => {
      if (lang == "en") {
        this.locle = enLocale;
      } else {
        this.locle = arLocale;
      }
    });

    // =====> set weekends days to hide them:
    this.calendarHiddenDays = this.settingService.getWeekEndsDays();
  }
  ngOnDestroy() {
    this.langSubscription.unsubscribe();
  }

  addEvent() {
    //this.calendarEvents.push({ title: 'event 2', date: '2020-01-31' });
  }

  modifyTitle(eventIndex, newTitle) {
    //this.calendarEvents[eventIndex].title = newTitle;
  }

  onEventClick(info) {
    //this.router.navigateByUrl("/pages/bookings");
    /* alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);
    info.el.style.borderColor = 'red'; */
  }

  onDateClick(info) {
    // =====> check clicked date if today or past or future:
    const todayString = new Date().toLocaleDateString();
    const dateClicked = new Date(info.dateStr).toLocaleDateString();
    // =====> if clicked on today:
    if (todayString == dateClicked) {
      this.router.navigateByUrl("/pages/bookings/today");
    }
    // =====> if clicked on past:
    else if (todayString > dateClicked) {
      this.router.navigate(["/pages/bookings/list", info.dateStr]);
    }
    // =====> if clicked on future:
    else if (todayString < dateClicked) {
      // =====> save clicked date to next booking:
      this.bookingService.setChosenbookingDate(info.date);
      this.toastrService.info(
        this.langgService.translateWord(
          "Choose a Patient to add booking for on this day."
        ),
        this.langgService.translateWord("Chosen Day") + ": " + info.dateStr,
        {
          icon: "info-outline",
          duration: 5000,
          destroyByClick: true
        }
      );
      this.router.navigateByUrl("/pages/patients");
    }
    /* alert('Clicked on: ' + info.dateStr);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('Current view: ' + info.view.type);
    info.dayEl.style.backgroundColor = 'red'; */
  }

  onMouseOver(info) {
    /* console.log(info.el);
    info.el.setAttribute('nbTooltip',info.event.extendedProps.description); */
  }

  onDayRender(info) {
    // =====> check clicked date if in the past:
    /* const todayString = new Date().toLocaleDateString();
    const dateClicked = new Date(info.date).toLocaleDateString();
    const todayString = new Date(new Date().getFullYear(),new Date().getMonth() , new Date().getDate(),0,0,0,0).toISOString();
    const dateClicked = new Date(info.date.getFullYear(),info.date.getMonth() , info.date.getDate(),0,0,0,0).toISOString();
    if (dateClicked < todayString) {
      info.el.style.backgroundColor = "lightgray";
    }*/
  }

  onEventRender(info) {
    /* console.log(info);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('nbTooltip',info.event.extendedProps.description);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('ng-reflect-content',info.event.extendedProps.description); */
    info.el.setAttribute("title", info.event.extendedProps.description);
  }
}
