import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'print-medicines',
  templateUrl: './print-medicines.component.html',
  styleUrls: ['./print-medicines.component.scss']
})
export class PrintMedicinesComponent implements OnInit {
  textHeader='INVOICE 3-2-1';

  constructor() { }

  ngOnInit() {
  }

}
