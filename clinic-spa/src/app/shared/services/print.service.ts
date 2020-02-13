import { BehaviorSubject } from 'rxjs';
import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class PrintService {
  printSection = new BehaviorSubject<printSections>(null);

  constructor() { }

  getPrintSection(){
    return this.printSection.asObservable();
  }
}

export enum printSections{
  printMedicines,
  printInvoice
}
