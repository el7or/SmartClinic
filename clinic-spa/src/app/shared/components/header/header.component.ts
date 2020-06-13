import { Router } from "@angular/router";
import { takeUntil, map } from "rxjs/operators";
import { Component, OnDestroy, OnInit } from "@angular/core";
import {
  NbMenuService,
  NbSidebarService,
  NbThemeService,
  NbSearchService,
  NbDialogService,
} from "@nebular/theme";
import { Subject, Subscription } from "rxjs";

import { AlertService } from "./../../services/alert.service";
import { ChatService } from "./../../../pages/chat/chat.service";
import { AuthService } from "./../../../auth/auth.service";
import { LanggService } from "../../services/langg.service";
import { MENU_ITEMS } from "../../../pages/pages-menu";
import { ProfileComponent } from "../profile/profile.component";
import { UserRole } from "../../../auth/auth.model";
import { AdvsService } from "../../services/advs.service";
import { UnreadCount } from "../../../pages/chat/chat.model";

@Component({
  selector: "ngx-header",
  styleUrls: ["./header.component.scss"],
  templateUrl: "./header.component.html",
})
export class HeaderComponent implements OnInit, OnDestroy {
  user: any;
  menu = MENU_ITEMS;
  externalCount: number;
  messagesCount: number;
  currentTheme = "default";
  selectedTheme = "Light";

  menuSubscription: Subscription;
  searchSubscription: Subscription;
  nameSubscription: Subscription;
  themeSubscription: Subscription;
  getUnreadSubscription: Subscription;
  private destroy$: Subject<void> = new Subject<void>();

  userMenu = [
    { title: "Change Name", data: "profile" },
    /* { title: "Change Clinic", data: "clinic2" }, */
    { title: "Log out", data: "logout" },
  ];

  themes = [
    {
      value: "default",
      name: "Light",
    },
    {
      value: "dark",
      name: "Dark",
    },
    {
      value: "cosmic",
      name: "Cosmic",
    },
  ];

  constructor(
    private sidebarService: NbSidebarService,
    private menuService: NbMenuService,
    private themeService: NbThemeService,
    private langgService: LanggService,
    private authService: AuthService,
    private searchService: NbSearchService,
    private dialogService: NbDialogService,
    private chatService: ChatService,
    public advService: AdvsService,
    private alertService: AlertService,
    private router: Router
  ) {
    // =====> on search from icon:
    this.searchSubscription = this.searchService
      .onSearchSubmit()
      .subscribe((data: any) => {
        router.navigateByUrl("/pages/patients/list?name=" + data.term);
      });
  }

  ngOnInit() {
    // =====> hide change clinic from user menu if not a doctor:
    if (this.authService.roleName == UserRole.Employee) {
      this.userMenu = this.userMenu.filter((item) => item.data != "clinic2");
    }

    // =====> translate main menu & user menu on first initial:
    this.translateMenus();

    // =====> setting the theme:
    this.currentTheme =
      localStorage.getItem("theme") === null
        ? "default"
        : localStorage.getItem("theme");
    this.onChangeTheme(this.currentTheme);
    this.themeSubscription = this.themeService
      .onThemeChange()
      .pipe(
        map(({ name }) => name),
        takeUntil(this.destroy$)
      )
      .subscribe((themeName) => (this.currentTheme = themeName));

    // =====> add user name and photo to header icon:
    this.nameSubscription = this.authService
      .getNickName()
      .subscribe((username) => {
        this.user = {
          name: username,
          picture:
            this.authService.roleName == UserRole.Doctor
              ? "assets/images/doctor.png"
              : "assets/images/employee.png",
        };
      });

    // =====> on click on user menu:
    this.menuSubscription = this.menuService
      .onItemClick()
      .subscribe((event) => {
        switch (event.item.data) {
          case "profile":
            this.dialogService.open(ProfileComponent, {
              autoFocus: true,
              hasBackdrop: true,
              closeOnBackdropClick: false,
              closeOnEsc: false,
            });
            break;
          case "clinic2":
            location.reload();
            break;
          case "logout":
            this.authService.logout();
            this.router.navigateByUrl("/auth/login");
            break;
          default:
            break;
        }
      });

    // =====> get unread count:
    this.getUnreadSubscription = this.chatService.getUnreadCount().subscribe(
      (res: UnreadCount) => {
        this.externalCount = res.unreadExternals;
        this.messagesCount = res.unreadMessages;
        this.chatService.unReadExternalCount.subscribe(
          (count) => (this.externalCount = count)
        );
        this.chatService.unReadChatCount.subscribe((count) => {
          this.messagesCount = count;
          /* if (this.router.url.indexOf("/chat") > -1) {
            this.messagesCount = 0;
          }
          else{
          this.messagesCount = count;
          } */
        });
      },
      (err) => {
        console.error(err);
        this.alertService.alertError();
      }
    );
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
    this.menuSubscription.unsubscribe();
    this.searchSubscription.unsubscribe();
    this.nameSubscription.unsubscribe();
    this.getUnreadSubscription.unsubscribe();
    this.themeSubscription.unsubscribe();
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
    this.menu.concat(this.userMenu).forEach((element) => {
      element.title = this.langgService.translateWord(element.title);
      if (element.children != null) {
        element.children.forEach((el) => {
          el.title = this.langgService.translateWord(el.title);
        });
      }

      // =====> hide items from employee:
      if (element.data == "roleDoctor") {
        if (this.authService.roleName == UserRole.Employee) {
          element.hidden = true;
        } else {
          element.hidden = false;
        }
      }
      if (element.children) {
        element.children.forEach((childElement) => {
          if (childElement.data == "roleDoctor") {
            if (this.authService.roleName == UserRole.Employee) {
              childElement.hidden = true;
            } else {
              childElement.hidden = false;
            }
          }
        });
      }
    });
  }

  // =====> on change them from select list in header:
  onChangeTheme(themeName: string) {
    localStorage.setItem("theme", themeName);
    this.selectedTheme = this.themes.find(
      (theme) => theme.value == themeName
    ).name;
    this.themeService.changeTheme(themeName);
  }

  // =====> toogle main menu:
  onToggleSidebar(): boolean {
    this.sidebarService.toggle(true, "menu-sidebar");
    return false;
  }
}
