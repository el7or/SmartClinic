import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Current Bookings',
    icon: 'calendar-outline',
    link: '/pages/home',
    home: true,
  },
  {
    title: 'Patient Records',
    icon: 'file-text-outline',
    link: '/pages/patients',
    pathMatch: '/pages/patients'
  },
  {
    title: 'Today Booking',
    icon: 'browser-outline',
    link: '/pages/bookings/today',
    pathMatch: '/pages/bookings/today'
  },
  {
    title: 'Browse Bookings',
    icon: 'browser-outline',
    link: '/pages/bookings/list',
    pathMatch: '/pages/bookings/list'
  },
  {
    title: 'Chat',
    icon: 'message-circle-outline',
    link: '/pages/chat',
    pathMatch: '/pages/chat'
  },
  {
    title: 'Settings',
    icon: 'settings-outline',
    children: [
      {
        title: 'Clinic Setting',
        link: '/pages/settings/clinic',
      },
      {
        title: 'Users',
        link: '/pages/test',
      }
    ],
  },
  {
    title: 'Contact Developer',
    icon: 'info-outline',
    link: '/pages/test',
    pathMatch: '/pages/test'
  }
  /* {
    title: 'Payments',
    icon: 'edit-2-outline',
    link: '/pages/test',
  },
  {
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
