import { NbMenuItem } from "@nebular/theme";

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: "Current Bookings",
    icon: "calendar-outline",
    link: "/pages/home",
    home: true,
  },
  {
    title: "Patients Records",
    icon: "file-text-outline",
    link: "/pages/patients",
    pathMatch: "prefix",
  },
  {
    title: "Today Bookings",
    icon: "clipboard-outline",
    link: "/pages/bookings/today",
  },
  {
    title: "Browse Bookings",
    icon: "browser-outline",
    link: "/pages/bookings/list",
    pathMatch: "prefix",
  },
  {
    title: "Accounting",
    icon: "activity-outline",
    expanded: true,
    data: "roleDoctor",
    children: [
      {
        title: "Incomes",
        icon: "trending-up-outline",
        link: "/pages/accounting/income",
      },
      {
        title: "Expenses",
        icon: "trending-down-outline",
        link: "/pages/accounting/expense",
      },
      {
        title: "Profits",
        icon: "award-outline",
        link: "/pages/accounting/profit",
      },
    ],
  },
  {
    title: "Chat",
    icon: "message-circle-outline",
    link: "/pages/chat",
    pathMatch: "full",
  },
  {
    title: "External Requests",
    icon: "corner-down-left-outline",
    link: "/pages/externals",
    pathMatch: "full",
  },
  {
    title: "Settings",
    icon: "settings-outline",
    expanded: false,
    data: "roleDoctor",
    children: [
      {
        title: "Clinic Setting",
        link: "/pages/settings/clinic",
      },
      {
        title: "Patient Profile Setting",
        link: "/pages/settings/patient",
      },
      {
        title: "Users",
        link: "/pages/settings/users",
      },
    ],
  },
  {
    title: "Contact Developer",
    icon: "info-outline",
    link: "/pages/contact",
    pathMatch: "full",
  },
  /* {
    title: 'Reports',
    icon: 'monitor-outline',
    children: [
      {
        title: 'Report 1',
        link: '/pages/test',
      },
      {
        title: 'Report 2',
        link: '/pages/test',
      }
    ]
  }, */
];
