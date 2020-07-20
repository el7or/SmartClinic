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
import { ChatService } from "../../services/chat.service";
import { AuthService } from "./../../../auth/auth.service";
import { LanggService } from "../../services/langg.service";
import { MENU_ITEMS } from "../../../pages/pages-menu";
import { ProfileComponent } from "../profile/profile.component";
import { UserRole } from "../../../auth/auth.model";
import { AdvsService } from "../../services/advs.service";
import { UnreadCount } from "../../../pages/chat/chat.model";
import { MENU_ITEMS_PH } from '../../../pages-pharmacy/pages-pharmacy-menu';

@Component({
  selector: "ngx-header",
  styleUrls: ["./header.component.scss"],
  templateUrl: "./header.component.html",
})
export class HeaderComponent implements OnInit, OnDestroy {
  user: any;
  menu = MENU_ITEMS;
  menuPharmacy = MENU_ITEMS_PH;
  externalCount: number;
  messagesCount: number;
  currentTheme = "default";
  selectedTheme = "Light";

  subs = new Subscription();

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
    public authService: AuthService,
    private searchService: NbSearchService,
    private dialogService: NbDialogService,
    private chatService: ChatService,
    public advService: AdvsService,
    private alertService: AlertService,
    private router: Router
  ) {
    // =====> on search from icon:
   this.subs.add(this.searchService
      .onSearchSubmit()
      .subscribe((data: any) => {
        router.navigateByUrl("/pages/patients/list?name=" + data.term);
      }));
  }

  ngOnInit() {
    // =====> hide change clinic from user menu if not a doctor:
    if (this.authService.roleName != UserRole.doctor) {
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
    this.subs.add(this.themeService
      .onThemeChange()
      .pipe(
        map(({ name }) => name),
        takeUntil(this.destroy$)
      )
      .subscribe((themeName) => (this.currentTheme = themeName)));

    // =====> add user name and photo to header icon:
    this.subs.add( this.authService
      .getNickName()
      .subscribe((username) => {
        this.user = {
          name: username,
          picture:
            this.authService.roleName == UserRole.doctor
              ? "assets/images/doctor.png"
              : "assets/images/employee.png",
        };
      }));

    // =====> on click on user menu:
    this.subs.add( this.menuService
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
      }));

    if (
      this.authService.roleName == UserRole.doctor ||
      this.authService.roleName == UserRole.employee
    ) {
      // =====> get unread count:
      this.subs.add( this.chatService.getUnreadCount().subscribe(
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
      ));
    }
  }

  ngOnDestroy() {
    this.destroy$.next();
    this.destroy$.complete();
    this.subs.unsubscribe();
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
    this.menu.concat(this.menuPharmacy).concat(this.userMenu).forEach((element) => {
      element.title = this.langgService.translateWord(element.title);
      if (element.children != null) {
        element.children.forEach((el) => {
          el.title = this.langgService.translateWord(el.title);
        });
      }

      // =====> hide items from employee:
      if (element.data == "roleDoctor") {
        if (this.authService.roleName == UserRole.employee) {
          element.hidden = true;
        } else {
          element.hidden = false;
        }
      }
      if (element.children) {
        element.children.forEach((childElement) => {
          if (childElement.data == "roleDoctor") {
            if (this.authService.roleName == UserRole.employee) {
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
