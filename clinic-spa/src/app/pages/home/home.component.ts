import { Component, OnInit, OnDestroy } from '@angular/core';
import dayGridPlugin from '@fullcalendar/daygrid';
import timeGridPlugin from '@fullcalendar/timegrid';
import listPlugin from '@fullcalendar/list';
import interactionPlugin from '@fullcalendar/interaction';
import arLocale  from '@fullcalendar/core/locales/ar'
import enLocale  from '@fullcalendar/core/locales/en-gb'
import momentPlugin from '@fullcalendar/moment';
import { Subscription } from 'rxjs';

import { LanggService } from '../../shared/services/langg.service';

@Component({
  selector: 'home',
  templateUrl: './home.component.html',
  styleUrls: ['./home.component.scss']
})
export class HomeComponent implements OnInit,OnDestroy{

  calendarPlugins = [ dayGridPlugin, timeGridPlugin, listPlugin, interactionPlugin, momentPlugin  ];
  calendarHeader = { center: 'listWeek,dayGridMonth,dayGridWeek,timeGridDay' }

  locle:any;
  langObservable: Subscription;

  calendarEvents = 'https://fullcalendar.io/demo-events.json';

  constructor(private langgService:LanggService){
  }
  ngOnInit(){
    this.langObservable = this.langgService.lang.subscribe(
      lang=>{
        if(lang == 'en'){
          this.locle= enLocale;
        }else{
          this.locle = arLocale;
        }
      }
    );
  }
  ngOnDestroy(){
    this.langObservable.unsubscribe();
  }

  addEvent() {
    //this.calendarEvents.push({ title: 'event 2', date: '2020-01-31' });
  }

  modifyTitle(eventIndex, newTitle) {
    //this.calendarEvents[eventIndex].title = newTitle;
  }

  onEventClick(info) {
    alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);

    // change the border color just for fun
    info.el.style.borderColor = 'red';
  }

  onDateClick(info){
    alert('Clicked on: ' + info.dateStr);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('Current view: ' + info.view.type);
    // change the day's background color just for fun
    info.dayEl.style.backgroundColor = 'red';
  }
}
