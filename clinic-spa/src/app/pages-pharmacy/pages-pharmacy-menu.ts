import { NbMenuItem } from "@nebular/theme";

export const MENU_ITEMS_PH: any[] = [
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
    title: "Contact Developer",
    icon: "info-outline",
    link: "/pharmacy/contact",
    pathMatch: "full",
  },
];
