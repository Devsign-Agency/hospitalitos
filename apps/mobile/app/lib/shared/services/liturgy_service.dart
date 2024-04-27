import 'package:flutter/material.dart';
import 'package:catholic_liturgy/catholic_liturgy.dart';

class LiturgyService extends ChangeNotifier {
  List<dynamic> liturgies = [
       {
      'date': '2024-04-22',
      'detail': [
        'Tiempo Pascual',
        'Lunes de la IV Semana de Pascua',

        'LUNES de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
       {
      'date': '2024-04-23',
      'detail': [
        'Tiempo Pascual',
        'San Adalberto, obispo y mártir | San Jorge, mártir',
        'MARTES de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
       {
      'date': '2024-04-24',
      'detail': [
        'Tiempo Pascual',
        'San Fidel de Sigmaringa, presbítero y mártir',
        'MIÉRCOLES de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'date': '2024-04-25',
      'detail': [
        'Tiempo Pascual',
        'San Marcos, evangelista',
        'JUEVES de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'date': '2024-04-26',
      'detail': [
        'Tiempo Pascual',
        'San Marcos, evangelista',
        'VIERNES de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    
    {
      'date': '2024-04-27',
      'detail': [
        'Tiempo Pascual',
        'San Marcos, evangelista',
        'SÁBADO de la IV Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    
    {
      'date': '2024-04-28',
      'detail': [
        'Tiempo Pascual',
        'San Marcos, evangelista',
        'V Domingo de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
      {
      'date': '2024-04-29',
      'detail': [
        'Tiempo Pascual',
        'Santa Catalina de Siena, virgen y doctora de la Iglesia',
        'LUNES de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
       {
      'date': '2024-04-30',
      'detail': [
        'Tiempo Pascual',
        'San Pío V, papa',
        'MARTES de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
       {
      'date': '2024-05-01',
      'detail': [
        'Tiempo Pascual',
        'San José Obrero',
        'MIÉRCOLES de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'date': '2024-05-02',
      'detail': [
        'Tiempo Pascual',
        'San Atanasio, obispo y doctor de la Iglesia',
        'JUEVES de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'date': '2024-05-03',
      'detail': [
        'Tiempo Pascual',
        'Santos Felipe y Santiago, apóstoles',
        'VIERNES de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    
    {
      'date': '2024-05-04',
      'detail': [
        'Tiempo Pascual 1',
        'San Marcos, evangelista',
        'SÁBADO de la V Semana de Pascua',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    
    {
      'date': '2024-05-05',
      'detail': [
        'Tiempo Pascual 1',
        'San Marcos, evangelista',
        'DOMINGO DE LAS SEMANA V',
      ],
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
  ];

  List<Map<String, dynamic>> items = [
    {
      'id': '0',
      'date': '24-04-2024',
      'title': 'Oficio de lectura',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'id': '1',
      'date': '25-04-2024',
      'title': 'Laudes',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'id': '2',
      'date': '26-04-2024',
      'title': 'Tercia',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'id': '3',
      'date': '27-04-2024',
      'title': 'Sexta',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'id': '4',
      'date': '28-04-2024',
      'title': 'Nona',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
    {
      'id': '5',
      'date': '29-04-2024',
      'title': 'Visperas',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
    },
    {
      'id': '6',
      'date': '30-04-2024',
      'title': 'Completas',
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
      'isSelected': false,
      'laudes': '',
      'completas': '',
      'visperas': '',
      'oficioLectura': '',
      'horaItermedia': ''
    },
  ];
}
