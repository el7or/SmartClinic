import { BookingsSummaryComponent } from './pages/bookings/bookings-summary/bookings-summary.component';
/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { BrowserModule } from "@angular/platform-browser";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { NgModule, LOCALE_ID, Injectable } from "@angular/core";
import { HttpClientModule } from "@angular/common/http";
import { of as observableOf } from "rxjs";

import {
  NbChatModule,
  NbDialogModule,
  NbMenuModule,
  NbSidebarModule,
  NbToastrModule,
  NbWindowModule
} from "@nebular/theme";
import { NbSecurityModule, NbRoleProvider } from "@nebular/security";
import { registerLocaleData } from '@angular/common';
import localeArabic from '@angular/common/locales/ar';
import localeEnglish from '@angular/common/locales/en';
import { arLocale } from 'ngx-bootstrap/locale';
import { defineLocale } from 'ngx-bootstrap/chronos';

import { SharedModule } from "./shared/shared.module";
import { AppComponent } from "./app.component";
import { AppRoutingModule } from "./app-routing.module";
import { LanggService } from './shared/services/langg.service';

defineLocale('ar', arLocale);

registerLocaleData(localeArabic);
registerLocaleData(localeEnglish);

@Injectable()
export class NbSimpleRoleProvider extends NbRoleProvider {
  getRole() {
    return observableOf("guest");
  }
}

@NgModule({
  declarations: [AppComponent],
  imports: [
    BrowserModule,
    BrowserAnimationsModule,
    HttpClientModule,
    AppRoutingModule,

    SharedModule.forRoot(),

    NbSidebarModule.forRoot(),
    NbMenuModule.forRoot(),
    NbDialogModule.forRoot(),
    NbWindowModule.forRoot(),
    NbToastrModule.forRoot(),
    NbChatModule.forRoot({
      messageGoogleMapKey: "AIzaSyA_wNuCzia92MAmdLRzmqitRGvCF7wCZPY"
    }),
    NbSecurityModule.forRoot({
      accessControl: {
        guest: {
          view: "*"
        },
        user: {
          parent: "guest",
          create: "*",
          edit: "*",
          remove: "*"
        }
      }
    })
  ],
  providers: [
    {
      provide: NbRoleProvider,
      useClass: NbSimpleRoleProvider
    },
    {provide: LOCALE_ID,
      deps: [LanggService],
      useFactory: (LanggService: { locale: string; }) => LanggService.locale
     }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}
