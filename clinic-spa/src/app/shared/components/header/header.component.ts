import { takeUntil, map } from "rxjs/operators";
import { Component, OnDestroy, OnInit } from "@angular/core";
import {
  NbMenuService,
  NbSidebarService,
  NbThemeService
} from "@nebular/theme";

import { LanggService } from "../../services/langg.service";
import { MENU_ITEMS } from "../../../pages/pages-menu";
import { Subject } from "rxjs";

@Component({
  selector: "ngx-header",
  styleUrls: ["./header.component.scss"],
  templateUrl: "./header.component.html"
})
export class HeaderComponent implements OnInit, OnDestroy {
  user: any;
  menu = MENU_ITEMS;
  currentTheme = "default";
  selectedTheme = "Light";
  private destroy$: Subject<void> = new Subject<void>();

  userMenu = [{ title: "Profile" }, { title: "Log out" }];

  themes = [
    {
      value: "default",
      name: "Light"
    },
    {
      value: "dark",
      name: "Dark"
    },
    {
      value: "cosmic",
      name: "Cosmic"
    }
  ];

  constructor(
    private sidebarService: NbSidebarService,
    private menuService: NbMenuService,
    private themeService: NbThemeService,
    private langgService: LanggService
  ) {}

  ngOnInit() {
    // =====> translate main menu & user menu on first initial:
    this.translateMenus();

    // =====> setting og theme:
    this.currentTheme =
      localStorage.getItem("theme") === null
        ? "default"
        : localStorage.getItem("theme");
    this.onChangeTheme(this.currentTheme);
    this.themeService
      .onThemeChange()
      .pipe(
        map(({ name }) => name),
        takeUntil(this.destroy$)
      )
      .subscribe(themeName => (this.currentTheme = themeName));

    // =====> add user name and photo to header icon:
    this.user = { name: "دكتور محمد", picture: "assets/images/nick.png" };

    /* this.menuSubscription = this.menuService.onItemClick().subscribe(event => {
        switch (event.item.data) {
          case "en":
          case "ar":
            this.langgService.langLoading.next(true);
            setTimeout(() => {
              this.langgService.language.next(event.item.data);
              this.checkLangg(event.item.data);
              this.langgService.langLoading.next(false);
            }, 1000);
            break;
          case "Log out":
            this.logOut();
            break;
          case "Profile":
            this.router.navigateByUrl("/pages/members/edit");
            break;
          case "like":
            this.router.navigateByUrl("/pages/likes");
            break;
          case "msg":
            this.router.navigateByUrl("/pages/chat");
            break;
          default:
            break;
        }
      }); */
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
  }

  // =====> toggle language from button in header:
  onToggleLanguage() {
    this.langgService.langLoading.next(true);
    setTimeout(() => {
      if (localStorage.getItem("langg") == "en") {
        this.langgService.language.next("ar");
        this.langgService.langLoading.next(false);
      } else {
        this.langgService.language.next("en");
        this.langgService.langLoading.next(false);
      }
      this.translateMenus();
    }, 1000);
  }

  // =====> translate main menu & user menu on first initial:
  translateMenus() {
    this.menu.concat(this.userMenu).forEach(element => {
      element.title = this.langgService.translateWord(element.title);
      if (element.children != null) {
        element.children.forEach(el => {
          el.title = this.langgService.translateWord(el.title);
        });
      }
    });
  }

  // =====> on change them from select list in header:
  onChangeTheme(themeName: string) {
    localStorage.setItem("theme", themeName);
    this.selectedTheme = this.themes.find(
      theme => theme.value == themeName
    ).name;
    this.themeService.changeTheme(themeName);
  }

  // =====> toogle main menu:
  onToggleSidebar(): boolean {
    this.sidebarService.toggle(true, "menu-sidebar");
    return false;
  }
}
