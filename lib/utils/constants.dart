import 'package:flutter/services.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';

// TODO: use compile time variable
const String BUILD_DATE = '22.05.2021';

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

const Map<int, String> CITIES = {
  1: 'Нур-Султан',
  2: 'Алматы',
  3: 'Актобе',
  4: 'Шымкент',
  5: 'Актау'
};

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

const List<String> STREETS = [
  'улица 1',
  'улица 2',
  'улица 3',
  'улица 4',
  'улица 5',
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
  'По новизне',
  'Цена (по убыванию)',
  'Цена (по возрастанию)',
  'По комнатам (по убыванию)',
  'По комнатам (по возрастанию)',
  'По площади (по убыванию)',
  'По площади (по возрастанию)',
];

enum DrawerType { filter, menu }

enum VideoLength { short, medium, long }

enum ApplicationType { buy, sell }

List<TextInputFormatter> MONEY_FORMATTER = [
  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true),
  MoneyInputFormatter(
      mantissaLength: 0,
      thousandSeparator: ThousandSeparator.SpaceAndCommaMantissa),
];

List<TextInputFormatter> PHONE_FORMATTER = [
  MaskedInputFormatter('+# (###)-###-##-##', anyCharMatcher: RegExp(r'[0-9]'))
];

List<TextInputFormatter> NUMERIC_FORMATTER = [
  FilteringTextInputFormatter(RegExp(r'[0-9]'), allow: true)
];

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
    'phone': '+77771234567',
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
    'phone': '+77771234567',
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
    'phone': '+77771234567',
  },
];

Map<String, dynamic> CLIENT_PROFILE = {
  'id': 3,
  'first_name': 'Дюсуп',
  'last_name': 'Замзагуль',
  'patronymic_name': 'Алибековна',
  'imagePath': 'assets/images/specialist1.png',
  'imageUrl':
      'https://images.unsplash.com/photo-1527585743534-7113e3211270?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&auto=format&fit=crop&w=100&q=80',
  'email': 'astana@gmail.com',
  'city': 'Нур-Султан',
  'phone': '+77771234567',
  'birth_date': DateTime.now().subtract(Duration(days: 365 * 30)),
};

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
    'comment': 'Ищу квартиру с дизайнерским ремонтом',
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 51 м\u00B2, 18 000 000 тг',
    'advert': null,
    'purchase_info': BUY_APPLICATIONS[0],
    'type': 'buy',
  },
  {
    'id': 2,
    'application_id': 986354,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 15)),
    'comment': 'Квартира в отличном состоянии, с дизайнерским ремонтом',
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 51 м\u00B2, 18 000 000 тг',
    'advert': ADVERTS[1],
    'purchase_info': null,
    'type': 'sell',
  },
  {
    'id': 3,
    'application_id': 475916,
    'datetime':
        DateTime.now().subtract(Duration(days: 5, hours: 6, minutes: 45)),
    'comment': 'Ищу квартиру с дизайнерским ремонтом',
    'short_description':
        'ул. Сауран 20, кв 15\n1 комнатная квартира, 51 м\u00B2, 18 000 000 тг',
    'advert': null,
    'purchase_info': BUY_APPLICATIONS[1],
    'type': 'buy',
  },
];

List<Map<String, dynamic>> BUY_APPLICATIONS = [
  {
    'atelier': false,
    'city_id': 1,
    'districts': ['Есильский', 'Сарыаркинский'],
    'floors': {'from': 4, 'to': 5},
    'mortage': true,
    'note': 'Тест комментарий',
    'rooms': {'from': 1, 'to': 3},
    'price': {'from': '10 000 000', 'to': '30 000 000'},
    'area': {'from': 39, 'to': 50},
  },
  {
    'atelier': false,
    'city_id': 2,
    'districts': ['Есильский'],
    'floors': {'from': 1, 'to': 20},
    'mortage': false,
    'note': 'Тест комментарий 2',
    'rooms': {'from': 3, 'to': 4},
    'price': {'from': '10 000 000', 'to': '50 000 000'},
    'area': {'from': 20, 'to': 30},
  },
];

List<Map<String, dynamic>> REVIEWS = [
  {
    'name': 'Алия Умирзакова',
    'text':
        'Огромная благодарность агентству недвижимости и лично специалисту Темирлану Умурзакову за высокий профессионализм в подборе жилья, безупречную организацию работы, надежность и нацеленность на результат!'
  },
  {
    'name': 'Мухтар Аширбаев',
    'text':
        'Огромная благодарность агентству недвижимости и лично специалисту Темирлану Умурзакову за высокий профессионализм в подборе жилья, безупречную организацию работы, надежность и нацеленность на результат!'
  },
  {
    'name': 'Замзагуль Дюсуп',
    'text':
        'Огромная благодарность агентству недвижимости и лично специалисту Темирлану Умурзакову за высокий профессионализм в подборе жилья, безупречную организацию работы, надежность и нацеленность на результат!'
  },
];

List<Map<String, dynamic>> ADVERTS = [
  {
    'id': 1,
    'title': 'JK Bi city Seoul',
    'price': '29 500 000',
    'new_price': true,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 10,
    'adverts_type': 'Бизнес класс',
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
    'price': '29 500 000',
    'new_price': false,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 12,
    'adverts_type': 'Бизнес класс',
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
    'price': '29 500 000',
    'new_price': false,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 5,
    'adverts_type': 'Бизнес класс',
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
    'price': '29 500 000',
    'new_price': true,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 15,
    'adverts_type': 'Бизнес класс',
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
    'price': '29 500 000',
    'new_price': false,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 20,
    'adverts_type': 'Бизнес класс',
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
    'price': '29 500 000',
    'new_price': true,
    'rooms': '4',
    'flat': '4 из 9',
    'area': '127 м\u00B2',
    'images': [
      'https://images.unsplash.com/photo-1601628828688-632f38a5a7d0?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1589834390005-5d4fb9bf3d32?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
      'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    ],
    'address': 'Нур-Султан, Есильский район, ул. Сауран, 18',
    'address_city': 'Нур-Султан',
    'address_district': 'Есильский',
    'address_street': 'Сауран',
    'address_house': '18',
    'phone': '+77771234567',
    'state': 'Евроремонт',
    'ceiling': '3 м',
    'bathroom': 'Раздельный',
    'parking': 'Парковка',
    'year': '2014',
    'rating': 4,
    'like_count': 20,
    'adverts_type': 'Бизнес класс',
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

const MAX_COMMENT_DEPTH = 3;

List<Map<String, dynamic>> COMMENTS = [
  {
    'id': 1,
    'parent_id': null,
    'user_id': 1,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 3, minutes: 20)),
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment': 'comment id 1',
  },
  {
    'id': 2,
    'parent_id': null,
    'user_id': 1,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 10)),
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment': 'comment id 2',
  },
  {
    'id': 4,
    'user_id': 1,
    'parent_id': 2,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 1, minutes: 15)),
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment': 'comment id 4',
  },
  {
    'id': 5,
    'user_id': 1,
    'parent_id': 4,
    'datetime':
        DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 15)),
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment': 'comment id 5',
  },
  {
    'id': 50,
    'user_id': 2,
    'parent_id': 5,
    'datetime':
        DateTime.now().subtract(Duration(days: 1, hours: 1, minutes: 15)),
    'image':
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'Jane Doe',
    'comment': 'comment id 50',
  },
  {
    'id': 51,
    'user_id': 2,
    'parent_id': null,
    'datetime':
        DateTime.now().subtract(Duration(days: 1, hours: 1, minutes: 5)),
    'image':
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'Jane Doe',
    'comment': 'comment id 51',
  },
  {
    'id': 52,
    'user_id': 2,
    'parent_id': 51,
    'datetime': DateTime.now().subtract(Duration(days: 1, minutes: 15)),
    'image':
        'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'Jane Doe',
    'comment': 'comment id 52',
  },
  {
    'id': 3,
    'user_id': 1,
    'parent_id': null,
    'datetime':
        DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 5)),
    'image':
        'https://images.unsplash.com/photo-1552374196-c4e7ffc6e126?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80',
    'name': 'John Doe',
    'comment': 'comment id 3',
  },
];

List<Map<String, dynamic>> SAVED_SEARCH = [
  {
    'id': 1,
    'name': '2 комнатная для сестры',
    'title': 'Продажа 17 000 000 - 24 000 000 тг',
    'flat': '2 комнатная квартира',
    'area': 'Площадь 70 - 85 м\u00B2',
  },
  {
    'id': 2,
    'name': 'Есильский район, Нур-Султан',
    'title': 'Продажа 17 000 000 - 24 000 000 тг',
    'flat': '2 комнатная квартира',
    'area': 'Площадь 70 - 85 м\u00B2',
  },
  {
    'id': 3,
    'name': 'Алматинский район, для себя 1 комн',
    'title': 'Продажа 17 000 000 - 24 000 000 тг',
    'flat': '2 комнатная квартира',
    'area': 'Площадь 70 - 85 м\u00B2',
  },
];

List<Map<String, dynamic>> BUYERS = [
  {
    'id': 1,
    'name': 'Акниет',
    'address': 'Есиль рн, 3-комнатная квартира,',
    'date': DateTime.now().subtract(Duration(days: 2, hours: 2, minutes: 15)),
    'price': '35 000 000 тг',
  },
  {
    'id': 2,
    'name': 'Рамазан',
    'address': 'Сарыарка рн, 2-комнатная квартира,',
    'date': DateTime.now().subtract(Duration(days: 1, hours: 2, minutes: 30)),
    'price': '25 000 000 тг',
  },
  {
    'id': 3,
    'name': 'Темирлан',
    'address': 'Есиль рн, 1-комнатная квартира,',
    'date': DateTime.now().subtract(Duration(days: 4, hours: 2, minutes: 25)),
    'price': '17 000 000 тг',
  },
  {
    'id': 4,
    'name': 'Жамиля',
    'address': 'Есиль рн, 3-4 комнатная квартира,',
    'date': DateTime.now().subtract(Duration(days: 4, hours: 2, minutes: 25)),
    'price': '50 000 000 - 70 000 000 тг',
  },
];
