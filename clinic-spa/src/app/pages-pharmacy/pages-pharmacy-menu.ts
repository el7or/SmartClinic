import { NbMenuItem } from "@nebular/theme";

export const MENU_ITEMS_PH: NbMenuItem[] = [
  {
    title: "New Prescriptions",
    icon: "corner-down-left-outline",
    link: "/pharmacy/home",
    home: true,
  },
  {
    title: "Prev Prescriptions",
    icon: "archive-outline",
    link: "/pharmacy/list",
    pathMatch: "prefix",
  },
  {
    title: "Contact Developer",
    icon: "info-outline",
    link: "/pharmacy/contact",
    pathMatch: "full",
  },
];
