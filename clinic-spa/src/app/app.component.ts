/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { Component } from '@angular/core';
import { NbIconLibraries } from '@nebular/theme';
import '@fortawesome/fontawesome-free/css/all.css';
import '@fortawesome/fontawesome-free/js/all.js';

@Component({
  selector: 'ngx-app',
  template: '<router-outlet></router-outlet>',
})
export class AppComponent {

  constructor(private iconsLibrary: NbIconLibraries) {
    this.iconsLibrary.registerFontPack('font-awesome', { packClass: 'fa', iconClassPrefix: 'fa' });
    this.iconsLibrary.registerFontPack('solid', { packClass: 'fas', iconClassPrefix: 'fa' });
    this.iconsLibrary.registerFontPack('brands', { packClass: 'fab', iconClassPrefix: 'fa' });
  }
}
