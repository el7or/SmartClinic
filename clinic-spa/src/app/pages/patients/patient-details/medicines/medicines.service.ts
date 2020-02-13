import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class MedicinesService {
  medicinesForPrint: any[];

  constructor() { }

  /* getMedicinesForPrint(){
    return this.medicinesForPrint;
  } */
}
