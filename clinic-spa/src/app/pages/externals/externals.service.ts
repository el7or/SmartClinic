import { Injectable } from '@angular/core';
import { ExternalsList } from './externals.model';

@Injectable({
  providedIn: 'root'
})
export class ExternalsService {

  constructor() { }

  getExternalsList(clinicId:string){
    const externalsList:ExternalsList[]= [
      {
        patientId:"fdsgsfdgsdfg",
        patientName: "محمود السيد أحمد",
        patientMobile: "0154584545223",
        requestType:"تحويل من د. بهاء علي",
        createdOn: new Date("2020-03-03")
      },
      {
        patientId:"fdsgsfdgsdfg",
        patientName: "منى علي عبد العال",
        patientMobile: "0111111111541",
        requestType:"حجز من تطبيق الدليل",
        createdOn: new Date("2020-04-12")
      }
    ];
    return externalsList;
  }
}
