import { NbMenuItem } from "@nebular/theme";

export const MENU_ITEMS: any[] = [
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
    icon: { icon: 'calculator', pack: 'solid'},
    expanded: false,
    data: "roleDoctor",
    children: [
      {
        title: "Incomes",
        icon:  { icon: 'sign-in-alt', pack: 'solid'},
        link: "/pages/accounting/income",
      },
      {
        title: "Expenses",
        icon:  { icon: 'sign-out-alt', pack: 'solid'},
        link: "/pages/accounting/expense",
      },
      {
        title: "Profits",
        icon:  { icon: 'award', pack: 'solid'},
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
    icon:  "settings-outline",
    expanded: false,
    data: "roleDoctor",
    children: [
      {
        title: "Clinic Setting",
        icon:  { icon: 'user-md', pack: 'solid'},
        link: "/pages/settings/clinic",
      },
      {
        title: "Patient Profile Setting",
        icon:  { icon: 'user-injured', pack: 'solid'},
        link: "/pages/settings/patient",
      },
      {
        title: "Users",
        icon:  { icon: 'user-friends', pack: 'solid'},
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
