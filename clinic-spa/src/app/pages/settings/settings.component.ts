import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'settings',
  template: `<router-outlet></router-outlet>`,
  styleUrls: ['./settings.component.scss']
})
export class SettingsComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
