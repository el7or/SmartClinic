import {
  Component,
  OnDestroy,
  OnInit,
  ViewChild,
  TemplateRef,
  ChangeDetectorRef,
} from "@angular/core";
import {
  NbMediaBreakpointsService,
  NbMenuService,
  NbSidebarService,
  NbThemeService,
  NbWindowService
} from "@nebular/theme";
import { map, takeUntil } from "rxjs/operators";
import { Subject } from "rxjs";

import { LanggService } from "../../services/langg.service";
import { MENU_ITEMS } from "../../../pages/pages-menu";

@Component({
  selector: "ngx-header",
  styleUrls: ["./header.component.scss"],
  templateUrl: "./header.component.html"
})
export class HeaderComponent implements OnInit, OnDestroy {
  private destroy$: Subject<void> = new Subject<void>();
  userPictureOnly: boolean = false;
  user: any;

  themes = [
    {
      value: "default",
      name: "Light"
    },
    {
      value: "dark",
      name: "Dark"
    }
    /* {
      value: 'cosmic',
      name: 'Cosmic',
    },
    {
      value: 'corporate',
      name: 'Corporate',
    }, */
  ];

  menu = MENU_ITEMS;
  isArabic: boolean;
  //currentTheme = "default";

  userMenu = [{ title: "Profile" }, { title: "Log out" }];

  constructor(
    private sidebarService: NbSidebarService,
    private menuService: NbMenuService,
    private themeService: NbThemeService,
    private breakpointService: NbMediaBreakpointsService,
    private windowService: NbWindowService,
    private langgService: LanggService,
    private cdr: ChangeDetectorRef
  ) {}

  ngOnInit() {
    //this.currentTheme = this.themeService.currentTheme;
    this.translateMenus();

    this.user = { name: "Nick Jones", picture: "assets/images/nick.png" };

    const { xl } = this.breakpointService.getBreakpointsMap();
    this.themeService
      .onMediaQueryChange()
      .pipe(
        map(([, currentBreakpoint]) => currentBreakpoint.width < xl),
        takeUntil(this.destroy$)
      )
      .subscribe(
        (isLessThanXl: boolean) => (this.userPictureOnly = isLessThanXl)
      );

    /* this.themeService
      .onThemeChange()
      .pipe(
        map(({ name }) => name),
        takeUntil(this.destroy$)
      )
      .subscribe(themeName => (this.currentTheme = themeName)); */
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }

  changeTheme(themeName: string) {
    this.themeService.changeTheme(themeName);
  }

  toggleLang() {
    this.langgService.langLoading.next(true);
    setTimeout(() => {
      if (localStorage.getItem('langg')=='en') {
        this.langgService.language.next("ar");
        this.langgService.langLoading.next(false);
      } else {
        this.langgService.language.next("en");
        this.langgService.langLoading.next(false);
      }
      this.translateMenus();
    }, 1000);
  }

  translateMenus(){
    this.menu.concat(this.userMenu).forEach(element => {
      element.title = this.langgService.translateWord(element.title);
      if(element.children!=null){
        element.children.forEach(el=>{
          el.title = this.langgService.translateWord(el.title);
        })
      }
    });
  }

  toggleSidebar(): boolean {
    this.sidebarService.toggle(true, "menu-sidebar");
    return false;
  }

  navigateHome() {
    this.menuService.navigateHome();
    return false;
  }

  @ViewChild("contentTemplate", { static: false }) contentTemplate: TemplateRef<
    any
  >;
  openNotifications() {
    this.windowService.open(this.contentTemplate, {
      title: "Window content from template",
      context: { text: "some text to pass into template" }
    });
  }
}
