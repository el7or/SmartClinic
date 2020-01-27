/**
 * @license
 * Copyright Akveo. All Rights Reserved.
 * Licensed under the MIT License. See License.txt in the project root for license information.
 */
import { BrowserModule } from "@angular/platform-browser";
import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { NgModule } from "@angular/core";
import { HttpClientModule } from "@angular/common/http";
import { of as observableOf } from "rxjs";

import { SharedModule } from "./shared/shared.module";
import { AppComponent } from "./app.component";
import { AppRoutingModule } from "./app-routing.module";
import {
  NbChatModule,
  NbDialogModule,
  NbMenuModule,
  NbSidebarModule,
  NbToastrModule,
  NbWindowModule
} from "@nebular/theme";
import { NbSecurityModule, NbRoleProvider } from "@nebular/security";

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
  bootstrap: [AppComponent],
  providers: [
    {
      provide: NbRoleProvider,
      useClass: NbSimpleRoleProvider
    }
  ]
})
export class AppModule {}
