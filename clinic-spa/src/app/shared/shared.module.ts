import { ModuleWithProviders, NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import {
  NbActionsModule,
  NbLayoutModule,
  NbMenuModule,
  NbSearchModule,
  NbSidebarModule,
  NbUserModule,
  NbContextMenuModule,
  NbButtonModule,
  NbSelectModule,
  NbIconModule,
  NbThemeModule,
  DEFAULT_MEDIA_BREAKPOINTS,
  NbLayoutDirection,
  NbCardModule,
  NbListModule
} from "@nebular/theme";
import { NbEvaIconsModule } from "@nebular/eva-icons";
import { NbSecurityModule } from "@nebular/security";

import { DEFAULT_THEME } from "./styles/theme.default";
import { COSMIC_THEME } from "./styles/theme.cosmic";
import { CORPORATE_THEME } from "./styles/theme.corporate";
import { DARK_THEME } from "./styles/theme.dark";
import { LanggDirective } from "./directives/langg.directive";
import { TimeAgoPipe } from "./pipes/time-ago.pipe";
import { HeaderComponent } from "./components/header/header.component";
import { FooterComponent } from "./components/footer/footer.component";
import { TinyMCEComponent } from "./components/tiny-mce/tiny-mce.component";
import { LanggPipe } from "./pipes/langg.pipe";
import { RouterModule } from "@angular/router";
import { DateWithoutTimePipe } from "./pipes/date-without-time.pipe";
import { LocalLongDatePipe } from "./pipes/local-long-date.pipe";
import { LocalShortDatePipe } from "./pipes/local-short-date.pipe";

const NB_MODULES = [
  NbLayoutModule,
  NbMenuModule,
  NbUserModule,
  NbActionsModule,
  NbSearchModule,
  NbSidebarModule,
  NbContextMenuModule,
  NbSecurityModule,
  NbButtonModule,
  NbSelectModule,
  NbIconModule,
  NbEvaIconsModule,
  NbCardModule,
  NbListModule
];
const COMPONENTS = [HeaderComponent, FooterComponent, TinyMCEComponent];
const PIPES = [
  TimeAgoPipe,
  LanggPipe,
  DateWithoutTimePipe,
  LocalLongDatePipe,
  LocalShortDatePipe
];

@NgModule({
  imports: [CommonModule, ...NB_MODULES, RouterModule],
  exports: [CommonModule, ...PIPES, ...COMPONENTS, LanggDirective],
  declarations: [...COMPONENTS, ...PIPES, LanggDirective]
})
export class SharedModule {
  static forRoot(): ModuleWithProviders {
    return <ModuleWithProviders>{
      ngModule: SharedModule,
      providers: [
        ...NbThemeModule.forRoot(
          {
            name: "default"
          },
          [DEFAULT_THEME, COSMIC_THEME, CORPORATE_THEME, DARK_THEME],
          DEFAULT_MEDIA_BREAKPOINTS,
          NbLayoutDirection.RTL
        ).providers
      ]
    };
  }
}
