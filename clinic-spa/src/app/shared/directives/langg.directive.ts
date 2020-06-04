import { Directive, ElementRef, AfterViewInit, OnDestroy } from "@angular/core";
import { Subscription } from "rxjs";

import { LanggService } from "./../services/langg.service";

@Directive({
  selector: "[langg]"
})
export class LanggDirective implements AfterViewInit, OnDestroy {
  langgSubscription: Subscription;

  constructor(private ref: ElementRef, private langgService: LanggService) {}

  // =====> translate inner text in html elements with 'langg' directive:
  ngAfterViewInit() {
    this.langgSubscription = this.langgService.lang.subscribe(() => {
      try {
        this.ref.nativeElement.innerText = this.langgService.translateWord(
          this.ref.nativeElement.innerText
        );
      } catch {}
    });
  }

  ngOnDestroy() {
    if(this.langgSubscription) this.langgSubscription.unsubscribe();
  }
}
