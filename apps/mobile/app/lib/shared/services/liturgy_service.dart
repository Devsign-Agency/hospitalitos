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
      'description': '''Si ésta es la primera oración del día:

V. Señor abre mis labios
R. Y mi boca proclamará tu alabanza

Se añade el Salmo del Invitatorio con la siguiente antífona:
 
Ant. Verdaderamente ha resucitado el Señor. Aleluya.
Si antes se ha rezado ya alguna otra Hora:
 
V. Dios mío, ven en mi auxilio
R. Señor, date prisa en socorrerme. Gloria al Padre, y al Hijo, y al Espíritu Santo.
Como era en el principio, ahora y siempre, por los siglos de los siglos. Amén. Aleluya.''',
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
      'description': '',
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
        'V DOMINGO de Pascua',
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
      'date': '2024-04-27',
      'info': [
        {'title': 'Oficio de lectura' , 'description' : 'orem ipsum dolor sit amet, consec' ,  'isSelected': false,},
        {'title': 'Laudes' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'Completas' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'Visperas' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'horaItermedia' , 'description' : 'orem ipsum dolor sit amet, consec' ,  'isSelected': false,}
      ],
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
     
    },
     {
      'id': '1',
      'date': '2024-04-28',
      'info': [
        {'title': 'Oficio de lectura' , 'description' : 'lsjdklajksldjkalsdjkaldsjorem ipsum dolor sit amet, consec' ,  'isSelected': false,},
        {'title': 'Laudes' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'Completas' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'Visperas' , 'description' : 'orem ipsum dolor sit amet, consec',  'isSelected': false,},
        {'title': 'horaItermedia' , 'description' : 'orem ipsum dolor sit amet, consec' ,  'isSelected': false,}
      ],
      'description':
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
     
    },
  ];
}
