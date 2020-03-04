import { Injectable } from '@angular/core';
import { PatientList } from './patients.model';

@Injectable({
  providedIn: 'root'
})
export class PatientsService {

  constructor() { }

  getPatientsList():PatientList[]{
    const patients:PatientList[] = [
      {
        id:'sdfdasfas',
        codeId:1,
        name:'محمود السيد علي',
        mobile: '0151513535',
        visitsCount:5,
        lastVisit: new Date('2020/5/2'),
      },
      {
        id:'sdfdasfas',
        codeId:2,
        name:' السيد عبد السلام',
        mobile: '01245425152',
        visitsCount:15,
        lastVisit: new Date('2020/2/2'),
      },
      {
        id:'sdfdasfas',
        codeId:3,
        name:'هناء برعي محمود',
        mobile: '0111111545',
        visitsCount:3,
        lastVisit: new Date('2020/5/15'),
      },
      {
        id:'sdfdasfas',
        codeId:4,
        name:'عبد العزيز عبد الفتاح عبد المتجلي',
        mobile: '0151513535',
        visitsCount:2,
        lastVisit: new Date('2020/2/16'),
      },
      {
        id:'sdfdasfas',
        codeId:5,
        name:'منى عبد العال المنزلاوي',
        mobile: '01021564554',
        visitsCount:1,
        lastVisit: new Date('2020/1/27'),
      }
    ]
    return patients;
  }
}
