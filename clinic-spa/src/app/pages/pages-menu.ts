import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'Current Bookings',
    icon: 'calendar-outline',
    link: '/pages/home',
    home: true,
  },
  {
    title: 'All Bookings',
    icon: 'browser-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'Patient Records',
    icon: 'archive-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'Chat',
    icon: 'message-circle-outline',
    link: '/pages/chat',
  },
  {
    title: 'Payments',
    icon: 'edit-2-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'Settings',
    icon: 'settings-outline',
    children: [
      {
        title: 'Users',
        link: '/pages/layout/stepper',
      },
      {
        title: 'Pricing',
        link: '/pages/layout/list',
      }
    ],
  },
  {
    title: 'Reports',
    icon: 'monitor-outline',
    children: [
      {
        title: 'Report 1',
        link: '/pages/forms/inputs',
      },
      {
        title: 'Report 2',
        link: '/pages/forms/layouts',
      }
    ]
  },
  {
    title: 'Contact Developer',
    icon: 'info-outline',
    link: '/pages/iot-dashboard',
  },
    {
    title: 'To Test',
    group: true,
  },
  {
    title: 'Auth',
    icon: 'lock-outline',
    children: [
      {
        title: 'Login',
        link: '/auth/login',
      },
      {
        title: 'Register',
        link: '/auth/register',
      }
    ],
  },
];
