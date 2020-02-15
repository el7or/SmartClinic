import { Injectable } from '@angular/core';

import { medicinesValues } from './medicines.model';

@Injectable({
  providedIn: 'root'
})
export class MedicinesService {
  medicinesForPrint: any[];
  medicinesValues:medicinesValues = {
    names: ['Antox','Cornivita','Plaquanile','Tolmet','Multirelax'],
    concentrations: ['1 mg','2 mg','5 mg','10 mg','20 mg'],
    forms: ['Tab','Caps','Syrap','Vail','Ampule'],
    doses: ['مرة واحدة يومياً','مرتان يومياً','ثلاث مرات يومياً','يوم ويوم','عند اللزوم'],
    timings: ['قبل الأكل','بعد الأكل','أثناء الأكل','بعد الإفطار','قبل النوم'],
    periods: ['لمدة يوم واحد','لمدة ثلاثة أيام','لمدة عشرة أيام','لمدة أسبوع','لمدة شهر']
  }

  constructor() { }
}
