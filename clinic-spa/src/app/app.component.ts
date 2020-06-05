/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { Component, OnInit } from "@angular/core";
import { NbIconLibraries } from '@nebular/theme';

@Component({
  selector: "ngx-app",
  template: "<router-outlet></router-outlet>",
})
export class AppComponent implements OnInit {
  constructor(private iconLibraries: NbIconLibraries) {
    this.iconLibraries.registerFontPack("fa", { iconClassPrefix: "fa" });
    this.iconLibraries.registerFontPack("fas", { iconClassPrefix: "fas" });
    this.iconLibraries.registerFontPack("fad", { iconClassPrefix: "fad" });
    this.iconLibraries.registerFontPack("fal", { iconClassPrefix: "fal" });
    this.iconLibraries.setDefaultPack("fad");
  }

  ngOnInit(): void {}
}
