import { NbMenuItem } from '@nebular/theme';

export const MENU_ITEMS: NbMenuItem[] = [
  {
    title: 'الحجوزات الحالية',
    icon: 'browser-outline',
    link: '/pages/home',
    home: true,
  },
  {
    title: 'سجل الحجوزات',
    icon: 'home-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'سجلات المرضى',
    icon: 'home-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'المحادثات',
    icon: 'home-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'الحسابات',
    icon: 'home-outline',
    link: '/pages/iot-dashboard',
  },
  {
    title: 'الإعدادات',
    icon: 'layout-outline',
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
    icon: 'edit-2-outline',
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
    icon: 'home-outline',
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
