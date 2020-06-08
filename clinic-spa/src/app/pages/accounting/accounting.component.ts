import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'accounting',
  template: `<router-outlet></router-outlet>`,
  styleUrls: ['./accounting.component.scss']
})
export class AccountingComponent implements OnInit {

  constructor() { }

  ngOnInit() {
  }

}
