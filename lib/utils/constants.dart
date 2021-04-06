import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

const String BASE_URL = '';
const String REAL_PROPERTY_VIDEO_TOUR_LIST_URL =
    'https://vm.jurta.kz/open-api/realProperty/getRealPropertyWithVideoTourList';
const String REAL_PROPERTY_COMMENTS_BY_PROPERTY_ID_URL =
    'https://dm.jurta.kz/open-api/notes/'; // <property_id>
const String REAL_PROPERTY_LIKES_BY_PROPERTY_ID_URL =
    'https://dm.jurta.kz/open-api/favorites/'; // <property_id>
const String OBJECT_TYPES_URL =
    'https://dm.jurta.kz/open-api/dictionary/ObjectType/list';
const String HOUSE_CONDITION_URL =
    'https://dm.jurta.kz/open-api/dictionary/HouseCondition/list';
const String CITIES_URL =
    'https://gm.jurta.kz/open-api/address/getObjects?typeId=1';
const String REGIONS_URL =
    'https://gm.jurta.kz/open-api/address/getObjects?typeId=2'; // <parentCode>
const String STREETS_URL =
    'https://gm.jurta.kz/open-api/address/getStreetsByParent';
const String BUILDINGS_BY_STREET_URL =
    'https://gm.jurta.kz/open-api/address/getBuildingsByStreet/'; // <street_id>

List<PersistentBottomNavBarItem> NAVBAR_ITEMS = List.generate(
  4,
  (index) => PersistentBottomNavBarItem(
    icon: Icon(Icons.brightness_1),
  ),
);

const List<String> NAVBAR_ICON_LIST = [
  'assets/images/home.png',
  'assets/images/search.png',
  'assets/images/favorite.png',
  'assets/images/menu.png',
];

const List<String> NAVBAR_TITLE_LIST = [
  'главная',
  'поиск',
  'избранное',
  'меню',
];

const List<String> HOUSE_TYPE = [
  'Любое',
  'Квартира',
  'Частный дом',
  'Коммерция',
  'Новостройки',
];

const List<String> HOUSE_PLANS = [
  'Любое',
  'Студия',
  'Изолированные\nкомнаты',
];

const List<String> HOUSE_STATES = [
  'Любое',
  'с ремонтом',
  'без ремонта',
  'дизайнерский ремонт',
];

const List<String> ROOMS = [
  '1',
  '2',
  '3',
  '4',
  '5+',
];

const List<String> REGIONS = [
  'регион 1',
  'регион 2',
  'регион 3',
  'регион 4',
  'регион 5',
];

const List<String> CREDIT_PROGRAMS = [
  'Программа 1',
  'Программа 2',
  'Программа 3',
  'Программа 4',
  'Программа 5',
];

const List<String> COMPLEXES = [
  'жилой комплекс 1',
  'жилой комплекс 2',
  'жилой комплекс 3',
  'жилой комплекс 4',
  'жилой комплекс 5',
];

const List<String> OBJECTS_AROUND_TAB_TITLES = [
  'Школа',
  'Больница',
  'Детский сад',
  'ТРЦ',
];

enum DrawerType {
  filter,
  menu
}

List<Map<String, dynamic>> ADVERTS = [
  {
    'id': 1,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': true,
  },
  {
    'id': 2,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': false,
  },
  {
    'id': 3,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': true,
  },
  {
    'id': 4,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': false,
  },
  {
    'id': 5,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': true,
  },
  {
    'id': 6,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000 T',
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127.45 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'description':
        'The launch method takes a string argument containing a URL. This URL can be formatted using a number of different URL schemes. The supported URL schemes depend on the underlying platform and installed apps.',
    'schools': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'hospitals': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    'kindergartens': [
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
      {
        'name': 'Школа-гимназия №75',
        'address': 'Мангилик ел проспект, 28/1',
        'rating': 8.5,
        'distance': '2 км',
      },
    ],
    // 'malls': [
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    //   {
    //     'name': 'Школа-гимназия №75',
    //     'address': 'Мангилик ел проспект, 28/1',
    //     'rating': 8.5,
    //     'distance': '2 км',
    //   },
    // ],
    'ratings': [
      {'name': 'Рейтинг района', 'percent': 95},
      {'name': 'Рейтинг ЖК', 'percent': 81},
    ],
    'is_fav': false,
  },
];

List<Map<String, dynamic>> COMMENTS = [
  {
    'id': 1,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [],
  },
  {
    'id': 2,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [
      {
        'id': 4,
        'image':
            'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        'name': 'John Doe',
        'comment':
            'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
        'replies': [],
      },
      {
        'id': 5,
        'image':
            'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        'name': 'John Doe',
        'comment':
            'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
        'replies': [],
      },
    ],
  },
  {
    'id': 3,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [],
  },
];
