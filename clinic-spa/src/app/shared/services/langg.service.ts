import { Injectable } from '@angular/core';
import { BehaviorSubject } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class LanggService {

  language = new BehaviorSubject<string>(localStorage.getItem('langg')=='en'?'en':'ar');
  lang = this.language.asObservable();

  _locale: string;
  set locale(value: string) {
    this._locale = value;
  }
  get locale(): string {
    return localStorage.getItem("langg") || "ar";
  }

  constructor() {
    this.lang.subscribe(
      lang=>{
        if(lang == 'en'){
          localStorage.setItem('langg','en');
        }else{
          localStorage.setItem('langg','ar');
        }
      }
    );
   }
}
