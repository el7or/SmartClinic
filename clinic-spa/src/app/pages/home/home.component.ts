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

  //calendarEvents = 'https://fullcalendar.io/demo-events.json';
  calendarEvents = [
    {
      title: 'كشف',
      start: '2020-01-01T10:30:00',
      description: 'محمد أحمد'
    },
    {
      title: 'استشارة',
      start: '2020-01-01T10:45:00',
      description: 'أحمد مصطفى'
    },
    {
      title: 'كشف',
      start: '2020-01-03T09:00:00',
      description: 'سناء عزت'
    },
  ];

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
    /* alert('Event: ' + info.event.title);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('View: ' + info.view.type);
    info.el.style.borderColor = 'red'; */
  }

  onDateClick(info){
    /* alert('Clicked on: ' + info.dateStr);
    alert('Coordinates: ' + info.jsEvent.pageX + ',' + info.jsEvent.pageY);
    alert('Current view: ' + info.view.type);
    info.dayEl.style.backgroundColor = 'red'; */
  }

  onMouseOver(info) {
    /* console.log(info.el);
    info.el.setAttribute('nbTooltip',info.event.extendedProps.description); */
  }

  onEventRender(info){
    /* console.log(info);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('nbTooltip',info.event.extendedProps.description);
    info.el.querySelectorAll(".fc-content")[0].setAttribute('ng-reflect-content',info.event.extendedProps.description); */
    info.el.setAttribute('title',info.event.extendedProps.description);
  }

}
