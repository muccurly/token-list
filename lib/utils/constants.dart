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

const SORT_BY = [
  'Новизне',
  'Цена (по убыванию)',
  'Цена (по возрастанию)',
  'По комнатам',
  'По площади',
];

enum DrawerType { filter, menu }

List<Map<String, dynamic>> SPECIALISTS = [
  {
    'id': 1,
    'name': 'Умурзаков Темирлан Дарханович',
    'imagePath': 'assets/images/specialist1.png',
    'imageUrl':
        'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=634&q=80',
    'position': 'Лидер месяца',
    //'rating_star': 5,
    'rating': 5.0,
  },
  {
    'id': 2,
    'name': 'Жанатова Сымбат Алимгерейкызы',
    'imagePath': 'assets/images/specialist1.png',
    'imageUrl':
        'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2134&q=80',
    'position': 'Лидер по коммерции',
    //'rating_star': 5,
    'rating': 4.9,
  },
  {
    'id': 3,
    'name': 'Какен Есбол Муратулы',
    'imagePath': 'assets/images/specialist1.png',
    'imageUrl':
        'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=634&q=80',
    'position': 'Лидер по коммерции',
    //'rating_star': 5,
    'rating': 4.6,
  },
];

List<Map<String, dynamic>> NOTIFICATIONS = [
  {
    'id': 1,
    'imagePath': 'assets/images/star_ring.png',
    'title': 'Новые объявления',
    'datetime': 'Сегодня в 17:00',
  },
  {
    'id': 2,
    'imagePath': 'assets/images/price_down.png',
    'title': 'Снижение цен',
    'subtitle':
        'Получать уведомления о снижении цен на объяления из Избранного',
    'datetime': 'Сегодня в 13:00',
  },
  {
    'id': 3,
    'imagePath': 'assets/images/bubble_lines.png',
    'title': 'Ответы на комментарии',
    'subtitle':
        'На ваш комментарий к объекту 1234567, ответили: \"Добрый день, да торг имеется. Оставьте нам ваши контакты и мы свяжемся с вами в ближайшее время\"',
    'datetime': 'Вчера в 21:00',
  },
  {
    'id': 4,
    'imagePath': 'assets/images/calendar.png',
    'title': 'Предстоящие события',
    'subtitle':
        'У вас назначена встреча в 15:00 15/05/2021 по адресу: Мангилик ел 17, ЖК \"Коркем\" по операции \"Ипотека за 3 дня\"',
    'datetime': '05/04/2021 в 13:00',
  },
];

List<Map<String, dynamic>> APPLICATIONS = [
  {
    'id': 1,
    'application_id': 134567,
    'datetime': DateTime.now(),
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 51 м2, 18 000 000 тг',
    'advert': ADVERTS[0],
    'type': 'buy',
  },
  {
    'id': 2,
    'application_id': 986354,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 15)),
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 51 м2, 18 000 000 тг',
    'advert': ADVERTS[0],
    'type': 'sell',
  },
  {
    'id': 3,
    'application_id': 475916,
    'datetime':
        DateTime.now().subtract(Duration(days: 5, hours: 6, minutes: 45)),
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 41 м2, 15 000 000 тг',
    'advert': ADVERTS[0],
    'type': 'buy',
  },
];

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
    'user_id': 1,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [],
  },
  {
    'id': 2,
    'user_id': 1,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [
      {
        'id': 4,
        'user_id': 1,
        'image':
            'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
        'name': 'John Doe',
        'comment':
            'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
        'replies': [],
      },
      {
        'id': 5,
        'user_id': 1,
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
    'user_id': 1,
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment':
        'Shikarnaya kvartira, mestoraspolojenie idealno dlya semeinyh par. V ipotehu mojno li?',
    'replies': [],
  },
];
