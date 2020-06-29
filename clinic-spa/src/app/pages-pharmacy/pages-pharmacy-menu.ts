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
  }
];
