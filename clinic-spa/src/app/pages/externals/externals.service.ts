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
        patientGovernorate: "Alexandria",
        createdOn: new Date("2020-03-03")
      },
      {
        patientId:"fdsgsfdgsdfg",
        patientName: "منى علي عبد العال",
        patientMobile: "0111111111541",
        requestType:"حجز من تطبيق الدليل",
        patientGovernorate: "Cairo",
        requestBookDate: new Date("2020-04-15"),
        requestBookTime: new Date(2020,4,15,11,0,0,0),
        createdOn: new Date("2020-04-12")
      }
    ];
    return externalsList;
  }

  checkPatientIsExist(patientName:string, patientMobile:string):string{
    // =====> if is exist just get patientId:
    return 'dasfasdfdsa';
    // =====> if not exist first add him to current clinic then get patientId:
    return 'dasfasdfdsa';
  }
}
