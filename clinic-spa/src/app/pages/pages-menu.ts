import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'الحجوزات الحالية',
    icon: 'calendar-outline',
    link: '/pages/home',
    home: true,
  },
  {
    title: 'سجل الحجوزات',
    icon: 'browser-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'سجلات المرضى',
    icon: 'archive-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'المحادثات',
    icon: 'message-circle-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'الحسابات',
    icon: 'edit-2-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'الإعدادات',
    icon: 'settings-outline',
    children: [
      {
        title: 'المستخدمين',
        link: '/pages/layout/stepper',
      },
      {
        title: 'الأسعار',
        link: '/pages/layout/list',
      },
      {
        title: 'التشخيصات',
        link: '/pages/layout/infinite-list',
      }
    ],
  },
  {
    title: 'التقارير',
    icon: 'monitor-outline',
    children: [
      {
        title: 'تقرير 1',
        link: '/pages/forms/inputs',
      },
      {
        title: 'تقرير 2',
        link: '/pages/forms/layouts',
      }
    ]
  },
  {
    title: 'تواصل مع المطور',
    icon: 'info-outline',
    link: '/pages/iot-dashboard',
  },
    {
    title: 'للاختبار',
    group: true,
  },
  {
    title: 'الدخول',
    icon: 'lock-outline',
    children: [
      {
        title: 'تسجيل الدخول',
        link: '/auth/login',
      },
      {
        title: 'إنشاء حساب',
        link: '/auth/register',
      }
    ],
  },
];
