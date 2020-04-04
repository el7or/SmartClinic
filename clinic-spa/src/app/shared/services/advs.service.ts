import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class AdvsService {

  constructor() { }

  getHeaderAdvs():Advertising{
    return {
      hrefLink: "https://www.evapharma.com/ar/",
      backgroundUrl: "/assets/images/advs-test1.jpg"
    };
  }

  getFooterAdvs():Advertising{
    return {
      hrefLink: "https://www.novartis.com.eg/en",
      backgroundUrl: "/assets/images/advs-test2.jpg"
    };
  }
}

export interface Advertising{
  hrefLink:string;
  backgroundUrl:string;
}
