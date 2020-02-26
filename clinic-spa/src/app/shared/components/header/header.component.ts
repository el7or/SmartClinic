import { Router } from "@angular/router";
import { takeUntil, map } from "rxjs/operators";
import { Component, OnDestroy, OnInit } from "@angular/core";
import {
  NbMenuService,
  NbSidebarService,
  NbThemeService,
  NbSearchService,
  NbDialogService
} from "@nebular/theme";
import { Subject, Subscription } from "rxjs";

import { AuthService } from "./../../../auth/auth.service";
import { LanggService } from "../../services/langg.service";
import { MENU_ITEMS } from "../../../pages/pages-menu";
import { ProfileComponent } from "../profile/profile.component";

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
  menuSubscription: Subscription;
  searchSubscription: Subscription;
  nameSubscription: Subscription;
  private destroy$: Subject<void> = new Subject<void>();

  userMenu = [
    { title: "Change Name", data: "profile" },
    { title: "Log out", data: "logout" }
  ];

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
    private langgService: LanggService,
    private authService: AuthService,
    private searchService: NbSearchService,
    private dialogService: NbDialogService,
    private router: Router
  ) {
    this.searchSubscription = this.searchService
      .onSearchSubmit()
      .subscribe((data: any) => {
        router.navigateByUrl("/pages/patients/list?name=" + data.term);
      });
  }

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
     this.nameSubscription= this.authService.getNickName().subscribe(username => {
      this.user = {
        name: username,
        picture: "assets/images/nick.png"
      };
    });

    this.menuSubscription = this.menuService.onItemClick().subscribe(event => {
      switch (event.item.data) {
        case "logout":
          this.authService.logout();
          this.router.navigateByUrl("/auth/login");
          break;
        case "profile":
          this.dialogService.open(ProfileComponent, {
            autoFocus: true,
            hasBackdrop: true,
            closeOnBackdropClick: false,
            closeOnEsc: false
          });
          break;
        default:
          break;
      }
    });
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
    this.menuSubscription.unsubscribe();
    this.searchSubscription.unsubscribe();
    this.nameSubscription.unsubscribe();
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
