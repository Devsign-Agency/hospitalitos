import 'package:flutter/material.dart';
// import 'package:catholic_liturgy/catholic_liturgy.dart';

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
      'description': '',
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

  String _date = DateTime.now().toString().split(' ')[0];

  String get date => _date;

  set date(String newDate) {
    _date = newDate;
    notifyListeners();
  }

  List<Map<String, dynamic>> items = [
    {
      'isSelected': false,
      'date': '2024-04-28',
      'info': [
        {
          'title': 'Completas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre y al Hijo y al Espíritu Santo\ncomo era en el principio, ahora y siempre\ny por los siglos de los siglos. Amén. Aleluya.\n\nEXAMEN DE CONCIENCIA\n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.\n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:\n\n<br>I</br>\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.\n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.  \n\nII\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.\n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.\n\nHIMNO\n\nGracias, porque al fin del día\npodemos agradecerte\nlos méritos de tu muerte,\ny el pan de la eucaristía,\nla plenitud de alegría\nde haber vivido tu alianza,\nla fe, el amor, la esperanza\ny esta bondad de tu empeño\nde convertir nuestro sueño\nen una humilde alabanza.\n\nGloria al Padre, gloria al Hijo,\ngloria al Espíritu Santo,\npor los siglos de los siglos. Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 90\nA LA SOMBRA DEL OMNIPOTENTE\nOs he dado potestad para pisotear serpientes y escorpiones (Lc 10, 19)\n\nTú que habitas al Amparo del Altísimo,\nque vives a la sombra del Omnipotente,\ndi al Señor: \"Refugio mío, alcázar mío,\nDios mío, confío en Ti\".\n \nÉl te librará de la red del cazador,\nde la peste funesta.\nTe cubrirá con sus plumas,\nbajo sus alas te refugiarás:\nSu brazo es escudo y armadura.\n \nNo temerás el espanto nocturno,\nni la flecha que vuela de día,\nni la peste que se desliza en las tinieblas,\nni la epidemia que devasta a mediodía.\n \nCaerán a tu izquierda mil,\ndiez mil a tu derecha;\na ti no te alcanzará.\n \nNada más mirar con tus ojos,\nverás la paga de los malvados,\nporque hiciste del Señor tu refugio,\ntomaste al Altísimo por defensa.\n \nNo se te acercará la desgracia,\nni la plaga llegará hasta tu tienda,\nporque a sus ángeles ha dado órdenes\npara que te guarden en tus caminos;\n \nte llevarán en sus palmas,\npara que tu pie no tropiece en la piedra;\ncaminarás sobre áspides y víboras,\npisotearás leones y dragones.\n \n\"Se puso junto a mí: lo libraré;\nlo protegeré porque conoce mi nombre,\nme invocará y lo escucharé.\n \nCon él estaré en la tribulación,\nlo defenderé, lo glorificaré,\nlo saciaré de largos días\ny le haré ver mi salvación\".\n\nAnt. Aleluya, aleluya, aleluya.\n\nLECTURA BREVE Ap 22, 4-5\n\nVerán al Señor cara a cara y llevarán su nombre en la frente. Ya no habrá más noche, ni necesitarán luz de lámpara o de sol, porque el Señor Dios irradiará luz sobre ellos, y reinarán por los siglos de los siglos.\n\nDurante la octava de Pascua en lugar del responsorio breve se dice la siguiente antífona:\n\nÉste es el día en que actuó el Señor: sea él nuestra alegría y nuestro gozo. Aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL\n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nORACIÓN\n\nHumildemente te pedimos, Señor, que después de haber celebrado en este día los misterios de la resurrección de tu Hijo, sin temor alguno, descansemos en tu paz, y mañana nos levantemos alegres para cantar nuevamente tus alabanzas. Por Jesucristo nuestro Señor.\n\nCONCLUSIÓN\nBendición\n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén.\n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN\n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate Virgen María, aleluya.\nPorque ha resucitado verdaderamente el Señor, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description':
              'V. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya.\n\nHIMNO\n\nOfrezcan los cristianos\nofrendas de alabanza\na gloria de la Víctima\npropicia de la Pascua.\n \nCordero sin pecado\nque a las ovejas salva,\na Dios y a los culpables\nunió con nueva alianza.\n \nLucharon vida y muerte\nen singular batalla\ny, muerto el que es la Vida,\ntriunfante se levanta.\n \n¿Qué has visto de camino,\n María, en la mañana?\nA mi Señor glorioso,\nla tumba abandonada,\nlos ángeles testigos,\nsudarios y mortaja.\n \n¡Resucitó de veras\nmi amor y mi esperanza!\n \nVenid a Galilea,\nallí el Señor aguarda;\nallí veréis los suyos\nla gloria de la Pascua.\n \nPrimicia de los muertos,\nsabemos por tu gracia\nque estás resucitado;\nla muerte en ti no manda.\n \nRey vencedor, apiádate\nde la miseria humana\ny da a tus fieles parte\nen tu victoria santa.\n\nSALMODIA\n\nAnt. 1. El que tenga sed, que venga a beber de balde el agua de la vida. Aleluya.\n\nSalmo 62, 2-9\nEL ALMA SEDIENTA DE DIOS\nMadruga por Dios todo el que rechaza las obras de las tinieblas.\n\n¡Oh Dios!, tú eres mi Dios, por ti madrugo,\nmi alma está sedienta de ti;\nmi carne tiene ansia de ti,\ncomo tierra reseca, agostada, sin agua.\n \n¡Cómo te contemplaba en el santuario\nviendo tu fuerza y tu gloria!\nTu gracia vale más que la vida,\nte alabarán mis labios.\n \nToda mi vida te bendeciré\ny alzaré las manos invocándote.\nMe saciaré de manjares exquisitos,\ny mis labios te alabarán jubilosos.\n \nEn el lecho me acuerdo de ti\ny velando medito en ti,\nporque fuiste mi auxilio,\ny a la sombra de tus alas canto con júbilo;\nmi alma está unida a ti,\ny tu diestra me sostiene.\n\nAnt. El que tenga sed, que venga a beber de balde el agua de la vida. Aleluya.\n\nAnt. 2. Rendid homenaje al Señor, que hizo el cielo, la tierra, el mar y los manantiales. Aleluya.\n\nCántico Dn 3, 57-88. 56\nTODA LA CREACIÓN ALABE AL SEÑOR\nAlabad al Señor, sus siervos todos (Ap 19, 5).\n\nCriaturas todas del Señor, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nÁngeles del Señor, bendecid al Señor;\ncielos, bendecid al Señor.\n \nAguas del espacio, bendecid al Señor;\nejércitos del Señor, bendecid al Señor.  \n \nSol y luna, bendecid al Señor;\nastros del cielo, bendecid al Señor.  \n \nLluvia y rocío, bendecid al Señor;\nvientos todos, bendecid al Señor.  \n \nFuego y calor, bendecid al Señor;\nfríos y heladas, bendecid al Señor.  \n \nRocíos y nevadas, bendecid al Señor;\ntémpanos y hielos, bendecid al Señor.  \n \nEscarchas y nieves, bendecid al Señor;\nnoche y día, bendecid al Señor.  \n \nLuz y tinieblas, bendecid al Señor;\nrayos y nubes, bendecid al Señor.  \n \nBendiga la tierra al Señor,\nensálcelo con himnos por los siglos.\n \nMontes y cumbres, bendecid al Señor;\ncuanto germina en la tierra, bendiga al Señor.\n \nManantiales, bendecid al Señor;\nmares y ríos, bendecid al Señor.  \n \nCetáceos y peces, bendecid al Señor;\naves del cielo, bendecid al Señor.  \n \nFieras y ganados, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nHijos de los hombres, bendecid al Señor;\nbendiga Israel al Señor.  \n \nSacerdotes del Señor, bendecid al Señor;\nsiervos del Señor, bendecid al Señor.  \n \nAlmas y espíritus justos, bendecid al Señor;\nsantos y humildes de corazón, bendecid al Señor.  \n \nAnanías, Azarías y Misael, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nBendigamos al Padre, al Hijo y al Espíritu Santo,\nensalcémoslo con himnos por los siglos.\n \nBendito el Señor en la bóveda del cielo,\nalabado y glorioso y ensalzado por los siglos.\n\nAl final de este cántico no se dice Gloria al Padre\n\nAnt. Rendid homenaje al Señor, que hizo el cielo, la tierra, el mar y los manantiales. Aleluya.\n\nAnt. 3. Los fieles festejan la gloria del Señor. Aleluya.\n\nSalmo 149\nALEGRÍA DE LOS SANTOS\nLos hijos de la Iglesia, nuevo pueblo de Dios, se alegran en su Rey, Cristo, el Señor (Hesiquio).\n\nCantad al Señor un cántico nuevo,\nresuene su alabanza en la asamblea de los fieles;\nque se alegre Israel por su Creador,\nlos hijos de Sión por su Rey.\n \nAlabad su nombre con danzas,\ncantadle con tambores y cítaras;\nporque el Señor ama a su pueblo\ny adorna con la victoria a los humildes.\n \nQue los fieles festejen su gloria\ny canten jubilosos en filas:\ncon vítores a Dios en la boca\ny espadas de dos filos en las manos:\n \npara tomar venganza de los pueblos\ny aplicar el castigo a las naciones,\nsujetando a los reyes con argollas,\na los nobles con esposas de hierro.\n \nEjecutar la sentencia dictada\nes un honor para todos sus fieles.\n\nAnt. Los fieles festejan la gloria del Señor. Aleluya.\n\nLECTURA BREVE\n\nDios resucitó a Jesús al tercer día y nos lo hizo ver, no a todo el pueblo, sino a nosotros, sino a los testigos que él había designado: a nosotros, que hemos comido y bebido con él, después de su resurrección. Nos encargó predicar al pueblo, dando solemne testimonio de que Dios lo ha nombrado juez de vivos y muertos. El testimonio de los profetas  es unánime: que los que creen en él reciben por su nombre, el perdón de los pecados.\n\nRESPONSORIO BREVE\n\nV. Cristo, Hijo de Dios vivo, ten piedad de nosotros. Aleluya, aleluya.\nR. Cristo, Hijo de Dios vivo, ten piedad de nosotros. Aleluya, aleluya.\nV. Tú que has resucitado de entre los muertos.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Cristo, Hijo de Dios vivo, ten piedad de nosotros. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. «El que permanece en mí y yo en él, ese da fruto abundante», dice el Señor. Aleluya.\n\nBENEDICTUS Lc 1, 68-79\nEL MESÍAS Y SU PRECURSOR\n\nBendito sea el Señor, Dios de Israel,\nporque ha visitado y redimido a su pueblo,\nsuscitándonos una fuerza de salvación\nen la casa de David, su siervo,\nsegún lo había predicho desde antiguo,\npor boca de sus santos profetas.\n \nEs la salvación que nos libra de nuestros enemigos\ny de la mano de todos los que nos odian;\nrealizando la misericordia\nque tuvo con nuestros padres,\nrecordando su santa alianza\ny el juramento que juró a nuestro padre Abrahán.\n \nPara concedernos que, libres de temor,\narrancados de la mano de los enemigos,\nle sirvamos con santidad y justicia,\nen su presencia, todos nuestros días.\n \nY a ti, niño, te llamarán profeta del Altísimo,\nporque irás delante del Señor\na preparar sus caminos,\nanunciando a su pueblo la salvación,\nel perdón de sus pecados.\n \nPor la entrañable misericordia de nuestro Dios,\nnos visitará el sol que nace de lo alto,\npara iluminar a los que viven en tinieblas\ny en sombra de muerte,\npara guiar nuestros pasos\npor el camino de la paz.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. «El que permanece en mí y yo en él, ese da fruto abundante», dice el Señor. Aleluya.\n\nPRECES\n\nOremos a Cristo, autor de la vida, a quien Dios resucitó de entre los muertos, y que por su poder nos resucitará también a nosotros, y digámosle:\n\nCristo, vida nuestra, sálvanos.\n \nCristo, luz esplendorosa que brillas en las tinieblas, rey de la vida y salvador de los que han muerto,\n— concédenos vivir hoy en tu alabanza.\n \nSeñor Jesús, que anduviste los caminos de la pasión y de la cruz,\n— concédenos que, unidos a ti en el dolor y en la muerte, resucitemos también contigo.\n \nHijo del Padre, maestro y hermano nuestro, tú que has hecho de nosotros un pueblo de reyes y sacerdotes,\n— enséñanos a ofrecer con alegría nuestro sacrificio de alabanza.\n \nRey de la gloria, esperamos anhelantes el día de tu manifestación gloriosa,\n— para poder contemplar tu rostro y ser semejantes a ti.\n\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nNuestra Pascua inmolada, aleluya,\nes Cristo el Señor, aleluya, aleluya.\n \nPascua sagrada, ¡oh fiesta universal!,\nel mundo renovado\ncanta un himno a su Señor.\n \nPascua sagrada, ¡victoria de la cruz!\nLa muerte, derrotada,\nha perdido su aguijón.\n \nPascua sagrada,\n¡oh noche bautismal!\n \nDel seno de las aguas\nrenacemos al Señor.\n \nPascua sagrada, ¡eterna novedad!\nDejad al hombre viejo,\nrevestíos del Señor.\n \nPascua sagrada. La sala del festín\nse llena de invitados\nque celebran al Señor.\n \nPascua sagrada, ¡Cantemos al Señor!\nVivamos la alegría\ndada a luz en el dolor.\n\nSALMODIA\nAnt. 1. Resucitó el Señor y está sentado a la derecha de Dios. Aleluya.\n\nSalmo 109, 1-5. 7\nEL MESIAS, REY Y SACERDOTE\nÉl debe reinar hasta poner a todos sus enemigos bajo sus pies (1 Cor 15, 25).\n\nOráculo del Señor a mi Señor:\n«Siéntate a mi derecha,\ny haré de tus enemigos\nestrado de tus pies.»\n \nDesde Sión extenderá el Señor\nel poder de tu cetro:\nsomete en la batalla a tus enemigos.\n \n«Eres príncipe desde el día de tu nacimiento,\nentre esplendores sagrados;\nyo mismo te engendré, como rocío,\nantes de la aurora.»\n \nEl Señor lo ha jurado y no se arrepiente:\n«Tú eres sacerdote eterno\nsegún el rito de Melquisedec.»\n \nEl Señor a tu derecha, el día de su ira,\nquebrantará a los reyes.\nEn su camino beberá del torrente,\npor eso levantará la cabeza.\n\nAnt. Resucitó el Señor y está sentado a la derecha de Dios. Aleluya.\n\nAnt. 2. Nos ha sacado del dominio de las tinieblas, y nos ha trasladado al reino de su Hijo. Aleluya.\n\nSalmo 113 A\nISRAEL LIBRADO DE EGIPTO; LAS MARAVILLAS DEL ÉXODO\nReconoced que también vosotros, los que renunciasteis al mundo, habéis salido de Egipto (S. Agustín).\n\nCuando Israel salió de Egipto,\nlos hijos de Jacob de un pueblo balbuciente,\nJudá fue su santuario,\nIsrael fue su dominio.\n \nEl mar, al verlos, huyó,\nel Jordán se echó atrás;\nlos montes saltaron como carneros;\nlas colinas, como corderos.\n \n¿Qué te pasa, mar, que huyes,\ny a ti, Jordán, que te echas atrás?\n¿Y a vosotros, montes, que saltáis como carneros;\ncolinas, que saltáis como corderos?\n \nEn presencia del Señor se estremece la tierra,\nen presencia del Dios de Jacob;\nque transforma las peñas en estanques,\nel pedernal en manantiales de agua.\n\nAnt. Nos ha sacado del dominio de las tinieblas, y nos ha trasladado al reino de su Hijo. Aleluya.\n\nAnt. 3. Aleluya. Reina nuestro Dios, gocemos y démosle gracias. Aleluya.\n\nEl cántico siguiente se dice con Aleluya, tal como está aquí, solamente cuando el Oficio es cantado. Cuando el Oficio se dice sin canto es suficiente decir Aleluya sólo al principio y al final de cada estrofa.\n\nCántico Cf. Ap 19, 1-7\nLAS BODAS DEL CORDERO\n\nAleluya.\nLa salvación y la gloria y el poder son de nuestro Dios.\n(R. Aleluya.)\nPorque sus juicios son verdaderos y justos.\nR. Aleluya, (aleluya).\n \nAleluya.\nAlabad al Señor, sus siervos todos.\n(R. Aleluya.)\nLos que le teméis, pequeños y grandes.\nR. Aleluya, (aleluya).\n \nAleluya.\nPorque reina el Señor, nuestro Dios, dueño de todo.\n(R. Aleluya.)\nAlegrémonos y gocemos y démosle gracias.\nR. Aleluya, (aleluya).\n \nAleluya.\nLlegó la boda del Cordero.\n(R. Aleluya.)\nSu esposa se ha embellecido.\nR. Aleluya, (aleluya).\n\nAnt. 3. Aleluya. Reina nuestro Dios, gocemos y démosle gracias. Aleluya.\n\nLECTURA BREVE Heb 10, 12-14\n\nCristo ofreció por los pecados, para siempre jamás, un solo sacrificio; está sentado a la derecha de Dios y espera el tiempo que falta hasta que sus enemigos sean puestos como estrado de sus pies. Con una sola ofrenda ha perfeccionado para siempre a los que van siendo consagrados.\n\nRESPONSORIO BREVE\n\nV. Verdaderamente ha resucitado el Señor. Aleluya, aleluya.\nR. Verdaderamente ha resucitado el Señor. Aleluya, aleluya.\nV. Y se ha aparecido a Simón.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Verdaderamente ha resucitado el Señor. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Si permanecéis en mí, pediréis lo que deseéis, y se realizará. Aleluya.\n\nMAGNÍFICAT Lc 1, 46-55\nALEGRÍA DEL ALMA EN EL SEÑOR\n\nProclama mi alma la grandeza del Señor,\nse alegra mi espíritu en Dios mi salvador;\nporque ha mirado la humillación de su esclava.\n \nDesde ahora me felicitarán todas las generaciones,\nporque el Poderoso ha hecho obras grandes por mí:\nsu nombre es santo\ny su misericordia llega a sus fieles\nde generación en generación.\n \nÉl hace proezas con su brazo:\ndispersa a los soberbios de corazón,\nderriba del trono a los poderosos\ny enaltece a los humildes,\na los hambrientos los colma de bienes\ny a los ricos los despide vacíos.\n \nAuxilia a Israel, su siervo,\nacordándose de su misericordia\n—como lo había prometido a nuestros padres—\nen favor de Abraham y su descendencia por siempre.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Si permanecéis en mí, pediréis lo que deseéis, y se realizará. Aleluya.\n\nPRECES\n\nOremos a Cristo, el Señor, que murió y resucitó por los hombres, y ahora intercede por nosotros, y digámosle:\n\nCristo, Rey victorioso, escucha nuestra oración.\n \nCristo, luz y salvación de todos los pueblos,\n— derrama el fuego del Espíritu Santo sobre los que has querido fueran testigos de tu resurrección en el mundo.\n \nQue el pueblo de Israel te reconozca como el Mesías de su esperanza,\n— y la tierra toda se llene del conocimiento de tu gloria.\n \nConsérvanos, Señor, en la comunión de tu Iglesia,\n— y haz que con todos nuestros hermanos obtengamos el premio y el descanso de nuestros trabajos.\n \nTú que has vencido a la muerte, nuestro enemigo, destruye en nosotros el poder del mal, tu enemigo,\n— para que vivamos siempre para ti, vencedor inmortal.\n\nCristo Salvador, tú que te hiciste obediente hasta la muerte y has sido elevado a la derecha del Padre,\n\n— recibe en tu reino glorioso a nuestros hermanos difuntos.\n \nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description':
              'Oficio de Lecturas\n\nV. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya.\n\nHIMNO\n\n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya!\n \nMuerte y Vida lucharon,\ny la muerte fue vencida.\n¡Aleluya, aleluya!\n \nEs el grano que muere\npara el triunfo de la espiga.\n¡Aleluya, aleluya!\n \nCristo es nuestra esperanza\nnuestra paz y nuestra vida.\n¡Aleluya, aleluya!\n \nVivamos vida nueva,\nel bautismo es nuestra Pascua.\n¡Aleluya, aleluya!\n \n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya! Amén.\n\nSALMODIA\n\nAnt. 1. Aleluya. La piedra ha sido removida de la entrada del sepulcro. Aleluya.\n\nSalmo 1\nLOS DOS CAMINOS DEL HOMBRE\nFelices los que poniendo su esperanza en la cruz, se sumergieron en las aguas del bautismo.\n\nDichoso el hombre\nque no sigue el consejo de los impíos,\nni entra por la senda de los pecadores,\nni se sienta en la reunión de los cínicos;\nsino que su gozo es la ley del Señor,\ny medita su ley día y noche.\n \nSerá como un árbol\nplantado al borde de la acequia:\nda fruto en su sazón\ny no se marchitan sus hojas;\ny cuanto emprende tiene buen fin.\n \nNo así los impíos, no así;\nserán paja que arrebata el viento.\nEn el juicio los impíos no se levantarán,\nni los pecadores en la asamblea de los justos;\nporque el Señor protege el camino de los justos,\npero el camino de los impíos acaba mal.\n\nAnt. Aleluya. La piedra ha sido removida de la entrada del sepulcro. Aleluya.\n\nAnt. 2. Aleluya. ¿A quién buscas, mujer?, ¿al que vive entre los muertos? Aleluya.\n\nSalmo 2\n¿POR QUÉ SE AMOTINAN LAS NACIONES?\nVerdaderamente se aliaron contra su santo siervo Jesús, tu Ungido (Hch 4, 27).\n\n¿Por qué se amotinan las naciones,\ny los pueblos planean un fracaso?\n \nSe alían los reyes de la tierra,\nlos príncipes conspiran\ncontra el Señor y contra su Mesías:\n\"rompamos sus coyundas,\nsacudamos su yugo\".\n \nEl que habita en el cielo sonríe,\nel Señor se burla de ellos.\nLuego les habla con ira,\nlos espanta con su cólera:\n\"yo mismo he establecido a mi Rey\nen Sión, mi monte santo\".\n \nVoy a proclamar el decreto del Señor;\nél me ha dicho:\n\"Tú eres mi Hijo: yo te he engendrado hoy.\nPídemelo:  te daré en herencia las naciones,\nen posesión, los confines de la tierra:\nlos gobernarás con cetro de hierro,\nlos quebrarás como jarro de loza\".\n \nY ahora, reyes, sed sensatos;\nescarmentad, los que regís la tierra:\nservid al Señor con temor,\nrendidle homenaje temblando;\n \nno sea que se irrite, y vayáis a la ruina,\nporque se inflama de pronto su ira.\n¡Dichosos los que se refugian en él!\n\nAnt. Aleluya. ¿A quién buscas, mujer?, ¿al que vive entre los muertos? Aleluya.\n\nAnt. 3. Aleluya. No llores, María; ha resucitado el Señor. Aleluya.\n\nSalmo 3\nCONFIANZA EN MEDIO DE LA ANGUSTIA\nDurmió el Señor el sueño de la muerte y resucitó del sepulcro porque el Padre fue su ayuda (S. Ireneo).\n\nSeñor, cuántos son mis enemigos,\ncuántos se levantan contra mí;\ncuántos dicen de mí:\n\"Ya no lo protege Dios\".\n \nPero tú, Señor, eres mi escudo y mi gloria,\ntú mantienes alta mi cabeza.\nSi grito invocando al Señor,\nél me escucha desde su monte santo.\n \nPuedo acostarme y dormir y despertar:\nel Señor me sostiene.\nNo temeré al pueblo innumerable\nque acampa a mi alrededor.\n \nLevántate, Señor;\nsálvame, Dios mío:\ntú golpeaste a mis enemigos en la mejilla,\nrompiste los dientes de los malvados.\n \nDe ti, Señor, viene la salvación\ny la bendición sobre tu pueblo.\n\nAnt. Aleluya. No llores, María; ha resucitado el Señor. Aleluya.\n\nVERSÍCULO\n\nV. Mi corazón se alegra. Aleluya.\nR. Y te canto agradecido. Aleluya.\n\nPRIMERA LECTURA\n\nDel libro del Apocalipsis 18, 21-19, 10\nANUNCIO DE LA BODA DEL CORDERO\n\nUn ángel poderoso levantó una piedra, grande como rueda de molino, y la lanzó al mar, diciendo: «Con este ímpetu será arrojada Babilonia, la gran ciudad; y no será jamás hallada. No se escuchará más en ti música de citaristas, de cantores, de tocadores de flauta y trompeta. Ya no se encontrará más en ti artífice de arte alguna. No se escuchará más el son de la rueda de molino, la luz de la lámpara no lucirá más, ni el idilio del novio y de la novia se escuchará más en ti. Porque tus mercaderes eran los magnates de la tierra y tus encantos sedujeron a todas las naciones, y en ti fue encontrada la sangre de los profetas y de los santos, la sangre de todos los que han sido degollados sobre la tierra.»\nDespués de esto oí como un grandioso coro de una inmensa multitud, que cantaba en el cielo: «¡Aleluya! La salvación y la gloria y el poder son de nuestro Dios. Porque sus juicios son verdaderos y justos; porque ha juzgado a la gran Ramera, a la que corrompía la tierra con su fornicación, y ha vengado en ella la sangre de sus siervos.\nY por segunda vez cantaron: «¡Aleluya! La humareda de la gran ciudad se eleva por los siglos de los siglos.»\nCayeron de hinojos los veinticuatro ancianos y los cuatro seres, y adoraron a Dios, que está sentado en su trono, diciendo: «Amén. Aleluya.»\nY salió una voz del trono, que decía: «Alabad al Señor, sus siervos todos, los que le teméis, pequeños y grandes.»\nY oí como el ruido de muchedumbre inmensa y como el ruido de grandes aguas y como el fragor de fuertes truenos. Y decían: «¡Aleluya! Porque reina el Señor, nuestro Dios, dueño de todo; alegrémonos y gocemos y démosle gracias, porque llegó la boda del Cordero, y su esposa se ha embellecido y se le ha concedido vestirse de lino deslumbrante de blancura» —el lino son las buenas acciones de los santos—.\nLuego me dice: «Escribe: \"Dichosos los invitados al banquete de bodas del Cordero.\"»\nMe dijo además: «Éstas son palabras verdaderas de Dios.»\nEntonces me postré a sus pies para adorarlo, pero él me dice: «No, cuidado; yo soy un siervo como tú y como tus hermanos que mantienen el testimonio de Jesús. A Dios tienes que adorar.»\nEl testimonio de Jesús es el espíritu de profecía.\n\nRESPONSORIO Ap 14, 2; 19, 6; 12, 10; 19, 5\n\nV. Oí una voz que bajaba del cielo, como estampido de un trueno poderoso: «Reinará nuestro Dios para siempre.\nR. Porque ahora se estableció la salud y el poderío, y la potestad de su Cristo.» Aleluya.\nV. Y salió una voz del trono, que decía: «Alabad al Señor, sus siervos todos, los que le teméis, pequeños y grandes.»\nR. Porque ahora se estableció la salud y el poderío, y la potestad de su Cristo. Aleluya.\n\nSEGUNDA LECTURA\n\nDe los sermones de san Máximo de Turín, obispo\n(Sermón 53,1-2. 4: CCL 23, 214-216)\nCRISTO, DÍA SIN OCASO\n\nLa resurrección de Cristo destruye el poder del abismo, los recién bautizados renuevan la tierra, el Espíritu Santo abre las puertas del cielo. Porque el abismo, al ver sus puertas destruidas, devuelve los muertos, la tierra, renovada, germina resucitados, y el cielo, abierto, acoge a los que ascienden.\nEl ladrón es admitido en el paraíso, los cuerpos de los santos entran en la ciudad santa y los muertos vuelven a tener su morada entre los vivos. Así, como si la resurrección de Cristo fuera germinando en el mundo, todos los elementos de la creación se ven arrebatados a lo alto.\nEl abismo devuelve sus cautivos, la tierra envía al cielo a los que estaban sepultados en su seno, y el cielo presenta al Señor a los que han subido desde la tierra: así, con un solo y único acto, la pasión del Salvador nos extrae del abismo, nos eleva por encima de lo terreno y nos coloca en lo más alto de los cielos.\nLa resurrección de Cristo es vida para los difuntos, perdón para los pecadores, gloria para los santos. Por esto el salmista invita a toda la creación a celebrar la resurrección de Cristo, al decir que hay que alegrarse y llenarse de gozo en este día en que actuó el Señor.\nLa luz de Cristo es día sin noche, día sin ocaso. Escucha al Apóstol que nos dice que este día es el mismo Cristo: La noche está avanzando, el día se echa encima. La noche está avanzando, dice, porque no volverá más. Entiéndelo bien: una vez que ha amanecido la luz de Cristo, huyen las tinieblas del diablo y desaparece la negrura del pecado porque el resplandor de Cristo destruye la tenebrosidad de las culpas pasadas.\nPorque Cristo es aquel Día a quien el Día, su Padre, comunica el íntimo ser de la divinidad. Él es aquel Día, que dice por boca de Salomón: Yo hice nacer en el cielo una luz inextinguible.\nAsí como no hay noche que siga al día celeste, del mismo modo las tinieblas del pecado no pueden seguir la santidad de Cristo. El día celeste resplandece, brilla, fulgura sin cesar y no hay oscuridad que pueda con él. La luz de Cristo luce, ilumina, destella continuamente y las tinieblas del pecado no pueden recibirla: por ello dice el evangelista Juan: La luz brilla en la tiniebla, y la tiniebla no la recibió.\nPor ello, hermanos, hemos de alegrarnos en este día santo. Que nadie se sustraiga del gozo común a causa de la conciencia de sus pecados, que nadie deje de participar en la oración del pueblo de Dios, a causa del peso de sus faltas. Que nadie, por pecador que se sienta, deje de esperar el perdón en un día tan santo. Porque, si el ladrón obtuvo el paraíso, ¿cómo no va a obtener el perdón el cristiano?\n\nRESPONSORIO\n\nV. La magnificencia del Señor está por encima de los cielos:\nR. Su majestad resplandece sobre las nubes y su nombre permanece para siempre. Aleluya.\nV. Asoma por un extremo del cielo, y su órbita llega al otro extremo.\nR. Su majestad resplandece sobre las nubes y su nombre permanece para siempre. Aleluya.\n\nHIMNO TE DEUM\n\nA ti, oh Dios, te alabamos,\na Ti, Señor, te reconocemos.\n \nA ti, eterno Padre,\nte venera toda la creación.\n \nLos ángeles todos, los cielos\ny todas las potestades te honran.\n \nLos querubines y serafines\nte cantan sin cesar:\n \nSanto, Santo, Santo es el Señor,\nDios del universo.\n \nLos cielos y la tierra\nestán llenos de la majestad de tu gloria.\n \nA ti te ensalza\nel glorioso coro de los apóstoles,\nla multitud admirable de los profetas,\nel blanco ejército de los mártires.\n \nA ti la Iglesia santa,\nextendida por toda la tierra,\nte aclama:\n \nPadre de inmensa majestad,\nHijo único y verdadero, digno de adoración,\nEspíritu Santo, Defensor.\n \nTú eres el Rey de la gloria, Cristo.\nTú eres el Hijo único del Padre.\n \nTú, para liberar al hombre,\naceptaste la condición humana\nsin desdeñar el seno de la Virgen.\n \nTú, rotas las cadenas de la muerte,\nabriste a los creyentes el reino del cielo.\n \nTú te sientas a la derecha de Dios\nen la gloria del Padre.\n \nCreemos que un día\nhas de venir como juez.\n \nTe rogamos, pues,\nque vengas en ayuda de tus siervos,\na quienes redimiste con tu preciosa sangre.\n \nHaz que en la gloria eterna\nnos asociemos a tus santos.\n\nSalva a tu pueblo, Señor,\ny bendice tu heredad.\n \nSé su pastor\ny ensálzalo eternamente.\n \nDía tras día te bendecimos\ny alabamos tu nombre para siempre,\npor eternidad de eternidades.\n \nDígnate, Señor, en este día\nguardarnos del pecado.\n \nTen piedad de nosotros, Señor,\nten piedad de nosotros.\n \nQue tu misericordia, Señor,\nvenga sobre nosotros,\ncomo lo esperamos de ti.\n \nEn ti, Señor, confié,\nno me veré defraudado para siempre.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya. \nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nCuando la luz del día está en su cumbre,\neres, Señor Jesús, luz y alegría\nde quienes en la fe y en la esperanza\ncelebran ya la fiesta de la Vida.\n \nEres resurrección, palabra y prenda\nde ser y de vivir eternamente;\nsembradas de esperanzas nuestras vidas,\nserán en ti cosecha para siempre.\n \nVen ya, Señor Jesús, Salvador nuestro,\nde tu radiante luz llena este día,\ncamino de alegría y de esperanza,\nreal acontecer de nueva vida.\n \nConcédenos, oh Padre omnipotente,\ny tú, Hijo amado y Señor nuestro,\npor obra del Espíritu enviado,\nvivir ya de la fiesta de tu reino. Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo117\nHIMNO DE ACCIÓN DE GRACIAS DESPUÉS DE LA VICTORIA\nJesús es la piedra que desechasteis vosotros, los arquitectos, y que se ha convertido en piedra angular (Hch 4, 11).\nI\n\nDad gracias al Señor porque es bueno,\nporque es eterna su misericordia.\n \nDiga la casa de Israel:\neterna es su misericordia.\n \nDiga la casa de Aarón:\neterna es su misericordia.\n \nDigan los fieles del Señor:\neterna es su misericordia.\n \nEn el peligro grité al Señor,\ny me escuchó, poniéndome a salvo.\n \nEl Señor está conmigo: no temo;\n¿qué podrá hacerme el hombre?\nEl Señor está conmigo y me auxilia,\nveré la derrota de mis adversarios.\n \nMejor es refugiarse en el Señor\nque fiarse de los hombres,\nmejor es refugiarse en el Señor\nque fiarse de los jefes.\n\nAnt. Aleluya, aleluya, aleluya.\n\nII\n\nTodos los pueblos me rodeaban,\nen el nombre del Señor los rechacé;\nme rodeaban cerrando el cerco,\nen el nombre del Señor los rechacé;\nme rodeaban como avispas,\nardiendo como fuego en las zarzas,\nen el nombre del Señor los rechacé.\n \nEmpujaban y empujaban para derribarme,\npero el Señor me ayudó;\nel Señor es mi fuerza y mi energía,\nél es mi salvación.\n \nEscuchad: hay cantos de victoria\nen las tiendas de los justos:\n\"la diestra del Señor es poderosa,\nla diestra del Señor es excelsa,\nla diestra del Señor es poderosa\".\n \nNo he de morir, viviré\npara contar las hazañas del Señor.\nMe castigó, me castigó el Señor,\npero no me entregó a la muerte.\n\nAnt. Aleluya, aleluya, aleluya.\n\nIII\n\nAbridme las puertas del triunfo,\ny entraré para dar gracias al Señor.\n \nÉsta es la puerta del Señor:\nlos vencedores entrarán por ella.\n \nTe doy gracias porque me escuchaste\ny fuiste mi salvación.\n \nLa piedra que desecharon los arquitectos\nes ahora la piedra angular.\n \nEs el Señor quien lo ha hecho,\nha sido un milagro patente.\n \nÉste es el día en que actuó el Señor:\nsea nuestra alegría y nuestro gozo.\nSeñor, danos la salvación;\nSeñor, danos prosperidad.\n \nBendito el que viene en nombre del Señor,\nos bendecimos desde la casa del Señor;\nel Señor es Dios, él nos ilumina.\n \nOrdenad una procesión con ramos\nhasta los ángulos del altar.\n \nTú eres mi Dios, te doy gracias;\nDios mío, yo te ensalzo.\n \nDad gracias al Señor porque es bueno,\nporque es eterna su misericordia.\n\nAnt. Aleluya, aleluya, aleluya.\n\nTERCIA\n\nLECTURA BREVE Cf. 1 Co 15, 3b-5\n\nCristo murió por nuestros pecados, según las Escrituras; fue sepultado y resucitó al tercer día y vive, según las Escrituras; se apareció a Cefas y luego a los Doce.\n\nV. Verdaderamente ha resucitado el Señor. Aleluya.\nR. Y se ha aparecido a Simón. Aleluya.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nSEXTA\n\nLECTURA BREVE Ef 2, 4-6\n\nDios, que es rico en misericordia, por el gran amor con que nos amó, estando muertos por los pecados, nos ha hecho vivir con Cristo —por pura gracia estáis salvados— y nos ha resucitado con Cristo Jesús y nos ha senta en el cielo con él.\n\nV. Los discípulos se llenaron de alegría. Aleluya.\nR. Al ver al Señor. Aleluya.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nNONA\n\nLECTURA BREVE Rm 6, 4\n\nPor el bautismo fuimos sepultados con Cristo en la muerte, para que, así como Cristo fue resucitado de entre los muertos por la gloria del Padre, así también nosotros andemos en una vida nueva.\n\nV. Quédate con nosotros, Señor. Aleluya.\nR. Porque ya es tarde. Aleluya.\n\nORACIÓN\n\nSeñor, tú que te has dignado redimirnos y has querido hacernos hijos tuyos, míranos siempre con amor de padre y que cuantos creemos en Cristo, tu Hijo, alcancemos la libertad verdadera y la herencia eterna. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya. \nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        }
      ]
    },
    {
      'isSelected': false,
      'date': '2024-04-29',
      'info': [
        {
          'title': 'Completas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre y al Hijo y al Espíritu Santo\ncomo era en el principio, ahora y siempre\ny por los siglos de los siglos. Amén. Aleluya.\n\nEXAMEN DE CONCIENCIA\n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.\n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:\n\nI\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.\n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.  \n\nII\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.\n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.\n\nHIMNO\n\nEl sueño, hermano de la muerte,\na su descanso nos convida;\nguárdanos tú, Señor, de suerte\nque despertemos a la vida.\n \nTu amor nos guía y nos reprende\ny por nosotros se desvela,\ndel enemigo nos defiende\ny, mientras dormimos, nos vela.\n \nTe ofrecemos, humildemente,\ndolor, trabajo y alegría;\nnuestra plegaria balbuciente:\n\"Gracias, Señor, por este día\".\n \nRecibe, Padre, la alabanza\ndel corazón que en ti confía\ny alimenta nuestra esperanza\nde amanecer a tu gran día.\n \nGloria a Dios Padre, que nos hizo,\ngloria a Dios Hijo Salvador,\ngloria al Espíritu divino:\ntres Personas y un solo Dios. Amén\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 4\nACCIÓN DE GRACIAS\nEl Señor hizo maravillas al resucitar a Jesucristo de entre los muertos (S. Agustín).\n\nEscúchame cuando te invoco, Dios, defensor mío;\ntú que en el aprieto me diste anchura,\nten piedad de mí y escucha mi oración.\n \nY vosotros, ¿hasta cuándo ultrajaréis mi honor,\namaréis la falsedad y buscaréis el engaño?\nSabedlo: el Señor hizo milagros en mi favor,\ny el Señor me escuchará cuando lo invoque.\n \nTemblad y no pequéis,\nreflexionad en el silencio de vuestro lecho;\nofreced sacrificios legítimos\ny confiad en el Señor.\n \nHay muchos que dicen: \"¿Quién nos hará ver la dicha,\nsi la luz de tu rostro ha huido de nosotros?\"\n \nPero tú, Señor, has puesto en mi corazón más alegría\nque si abundara en trigo y en vino.\n \nEn paz me acuesto y en seguida me duermo,\nporque tú sólo, Señor, me haces vivir tranquilo.\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 133\nORACIÓN VESPERTINA EN EL TEMPLO\nAlabad al Señor, sus siervos todos, los que le teméis, pequeños y grandes (Ap 19, 5).\n\nY ahora bendecid al Señor,\nlos siervos del Señor,\nlos que pasáis la noche\nen la casa del Señor.\n \nLevantad las manos hacia el santuario\ny bendecid al Señor.\n \nEl Señor te bendiga desde Sión,\nel que hizo cielo y tierra.\n\nAnt. Aleluya, aleluya, aleluya.\n\nLECTURA BREVE Dt 6, 4-7\n\nEscucha, Israel: El Señor, nuestro Dios, es solamente uno. Amarás al Señor, tu Dios, con todo el corazón, con toda el alma, con todas las fuerzas. Las palabras que hoy te digo quedarán en tu memoria, se las repetirás a tus hijos y hablarás de ellas estando en casa y yendo de camino, acostado y levantado.\n\nRESPONSORIO BREVE\n\nV. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL\n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nORACIÓN \n\nGuárdanos, Señor, durante esta noche y haz que mañana, ya al clarear el nuevo día, la celebración del domingo nos llene con la alegría de la resurrección de tu Hijo. Que vive y reina por los siglos de los siglos.\n\nCONCLUSIÓN\nBendición\n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén.\n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN\n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate Virgen María, aleluya.\nPorque ha resucitado verdaderamente el Señor, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.  \n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.  \n\nEXAMEN DE CONCIENCIA  \n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.  \n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:  \nI  \n\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.  \n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.    \n\nII  \n\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.  \n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.  \n\nHIMNO  \n\nTiembla el frío de los astros,\ny el silencio de los montes\nduerme sin fin. (Sólo el agua\nde mi corazón se oye).\n \nSu dulce latir, ¡tan dentro!,\ncalladamente responde\na la soledad inmensa\nde algo que late en la noche.\n \nSomos tuyos, tuyos, tuyos;\nsomos, Señor, ese insomne\ntemblor del agua nocturna,\nmás limpia después que corre.\n \n¡Agua en reposo viviente,\nque vuelve a ser pura y joven\ncon una esperanza! (Sólo\nen mi alma sonar se oye).\n \nGloria al Padre, gloria al Hijo,\ngloria al Espíritu Santo,\npor los siglos de los siglos. Amén.  \n\nSALMODIA  \n\nAnt. No me escondas tu rostro, ya que confío en ti. Aleluya.  \n\nSalmo 142, 1-11\nLAMENTACIÓN Y SÚPLICA ANTE LA ANGUSTIA\nEl hombre no se justifica por cumplir la ley; sino por creer en Cristo Jesús (Ga 2, 16).  \n\nSeñor, escucha mi oración;\ntú, que eres fiel, atiende a mi súplica;\ntú, que eres justo, escúchame.\nNo llames a juicio a tu siervo,\npues ningún hombre vivo es inocente frente a ti.\n \nEl enemigo me persigue a muerte,\nempuja mi vida al sepulcro,\nme confina a las tinieblas\ncomo a los muertos ya olvidados.\nMi aliento desfallece,\nmi corazón dentro de mí está yerto.\n \nRecuerdo los tiempos antiguos,\nmedito todas tus acciones,\nconsidero las obras de tus manos\ny extiendo mis brazos hacia ti:\ntengo sed de ti como tierra reseca.\n \nEscúchame en seguida, Señor,\nque me falta el aliento.\nNo me escondas tu rostro,\nigual que a los que bajan a la fosa.\n \nEn la mañana hazme escuchar tu gracia,\nya que confío en ti.\nIndícame el camino que he de seguir,\npues levanto mi alma a ti.\n \nLíbrame del enemigo, Señor,\nque me refugio en ti.\nEnséñame a cumplir tu voluntad,\nya que tú eres mi Dios.\nTu espíritu, que es bueno,\nme guíe por tierra llana.\n \nPor tu nombre, Señor, consérvame vivo;\npor tu clemencia, sácame de la angustia.   \n\nAnt. No me escondas tu rostro, ya que confío en ti. Aleluya.  \n\nLECTURA BREVE 1 Pe 5, 8-9  \n\nSed sobrios, estad alerta, que vuestro enemigo, el diablo, como león rugiente, ronda buscando a quien devorar; resistidle firmes en la fe.  \n\nRESPONSORIO BREVE  \n\nV. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.  \n\nCÁNTICO EVANGÉLICO  \n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.  \n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL  \n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.  \n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.   \n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.  \n\nORACIÓN  \n\nIlumina, Señor, nuestra noche y concédenos un descanso tranquilo; que mañana nos levantemos en tu nombre y podamos contemplar, con salud y gozo, el clarear del nuevo día. Por Jesucristo nuestro Señor.  \n\nCONCLUSIÓN\nBendición  \n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén. \n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN \n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate, Virgen María; aleluya.\nPorque verdaderamente ha resucitado el Señor; aleluya. SALMODIA\n\nAnt. 1. Libremente confieso a Cristo; de Cristo está sedienta mi alma; deseo estar por siempre con Cristo.  Aleluya.\n\nSalmo 62, 2-9\nEL ALMA SEDIENTA DE DIOS\nMadruga por Dios todo el que rechaza las obras de las tinieblas. \n\n¡Oh Dios!, tú eres mi Dios, por ti madrugo,\nmi alma está sedienta de ti;\nmi carne tiene ansia de ti,\ncomo tierra reseca, agostada, sin agua.\n \n¡Cómo te contemplaba en el santuario\nviendo tu fuerza y tu gloria!\nTu gracia vale más que la vida,\nte alabarán mis labios.\n \nToda mi vida te bendeciré\ny alzaré las manos invocándote.\nMe saciaré de manjares exquisitos,\ny mis labios te alabarán jubilosos.\n \nEn el lecho me acuerdo de ti\ny velando medito en ti,\nporque fuiste mi auxilio,\ny a la sombra de tus alas canto con júbilo;\nmi alma está unida a ti,\ny tu diestra me sostiene.\n\nAnt. Libremente confieso a Cristo; de Cristo está sedienta mi alma; deseo estar por siempre con Cristo.  Aleluya.\n\nAnt. 2. Vírgenes del Señor, bendecid al Señor; el que sembró en vosotras el deseo de la virginidad ha coronado ya su obra. Aleluya.\n\nCántico Dn 3, 57-88. 56\nTODA LA CREACIÓN ALABE AL SEÑOR\nAlabad al Señor, sus siervos todos (Ap 19, 5). \n\nCriaturas todas del Señor, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nÁngeles del Señor, bendecid al Señor;\ncielos, bendecid al Señor.\n \nAguas del espacio, bendecid al Señor;\nejércitos del Señor, bendecid al Señor.  \n \nSol y luna, bendecid al Señor;\nastros del cielo, bendecid al Señor.  \n \nLluvia y rocío, bendecid al Señor;\nvientos todos, bendecid al Señor.  \n \nFuego y calor, bendecid al Señor;\nfríos y heladas, bendecid al Señor.  \n \nRocíos y nevadas, bendecid al Señor;\ntémpanos y hielos, bendecid al Señor.  \n \nEscarchas y nieves, bendecid al Señor;\nnoche y día, bendecid al Señor.  \n \nLuz y tinieblas, bendecid al Señor;\nrayos y nubes, bendecid al Señor.  \n \nBendiga la tierra al Señor,\nensálcelo con himnos por los siglos.\n \nMontes y cumbres, bendecid al Señor;\ncuanto germina en la tierra, bendiga al Señor.\n \nManantiales, bendecid al Señor;\nmares y ríos, bendecid al Señor.  \n \nCetáceos y peces, bendecid al Señor;\naves del cielo, bendecid al Señor.  \n \nFieras y ganados, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nHijos de los hombres, bendecid al Señor;\nbendiga Israel al Señor.  \n \nSacerdotes del Señor, bendecid al Señor;\nsiervos del Señor, bendecid al Señor.  \n \nAlmas y espíritus justos, bendecid al Señor;\nsantos y humildes de corazón, bendecid al Señor.  \n \nAnanías, Azarías y Misael, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nBendigamos al Padre, al Hijo y al Espíritu Santo,\nensalcémoslo con himnos por los siglos.\n \nBendito el Señor en la bóveda del cielo,\nalabado y glorioso y ensalzado por los siglos.\n\nAl final de este cántico no se dice Gloria al Padre\n\nAnt. Vírgenes del Señor, bendecid al Señor; el que sembró en vosotras el deseo de la virginidad ha coronado ya su obra.  Aleluya.\n\nAnt. 3. Que los santos se alegren en la gloria, pues han conseguido una brillante victoria sobre la carne y la sangre. Aleluya.\n\nSalmo 149\nALEGRÍA DE LOS SANTOS\nLos hijos de la Iglesia, nuevo pueblo de Dios, se alegran en su Rey, Cristo, el Señor (Hesiquio). \n\nCantad al Señor un cántico nuevo,\nresuene su alabanza en la asamblea de los fieles;\nque se alegre Israel por su Creador,\nlos hijos de Sión por su Rey.\n \nAlabad su nombre con danzas,\ncantadle con tambores y cítaras;\nporque el Señor ama a su pueblo\ny adorna con la victoria a los humildes.\n \nQue los fieles festejen su gloria\ny canten jubilosos en filas:\ncon vítores a Dios en la boca\ny espadas de dos filos en las manos:\n \npara tomar venganza de los pueblos\ny aplicar el castigo a las naciones,\nsujetando a los reyes con argollas,\na los nobles con esposas de hierro.\n \nEjecutar la sentencia dictada\nes un honor para todos sus fieles.\n\nAnt. Que los santos se alegren en la gloria, pues han conseguido una brillante victoria sobre la carne y la sangre. Aleluya.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description':
              'SALMODIA\n\nAnt. 1. Quiero ser solamente tuya, oh Cristo esposo, a ti vengo con mi lámpara encendida. Aleluya.\n\nSalmo 121\nLA CIUDAD SANTA DE JERUSALÉN\n\n¡Qué alegría cuando me dijeron:\n\"Vamos a la casa del Señor\"!\nYa están pisando nuestros pies\ntus umbrales, Jerusalén.\n\nJerusalén está fundada\ncomo ciudad bien compacta.\nAllá suben las tribus,\nlas tribus del Señor,\n\nsegún la costumbre de Israel,\na celebrar el nombre del Señor;\nen ella están los tribunales de justicia,\nen el palacio de David.\n\nDesead la paz a Jerusalén:\n\"Vivan seguros los que te aman,\nhaya paz dentro de tus muros,\nseguridad en tus palacios\".\n\nPor mis hermanos y compañeros,\nvoy a decir: \"La paz contigo\".\nPor la casa del Señor, nuestro Dios,\nte deseo todo bien.\n\nAnt. Quiero ser solamente tuya, oh Cristo esposo, a ti vengo con mi lámpara encendida.  Aleluya.\n\nAnt. 2. Dichosos los limpios de corazón, porque ellos verán a Dios. Aleluya.\n\nSalmo 126\nEL ESFUERZO HUMANO ES INÚTIL SIN DIOS\n\nSi el Señor no construye la casa,\nen vano se cansan los albañiles;\nsi el Señor no guarda la ciudad,\nen vano vigilan los centinelas.\n\nEs inútil que madruguéis,\nque veléis hasta muy tarde,\nque comáis el pan de vuestros sudores:\n¡Dios lo da a sus amigos mientras duermen!\n\nLa herencia que da el Señor son los hijos;\nsu salario, el fruto del vientre:\nson saetas en manos de un guerrero\nlos hijos de la juventud.\n\nDichoso el hombre que llena\ncon ellas su aljaba:\nNo quedará derrotado cuando litigue\ncon su adversario en la plaza.\n\nAnt. Dichosos los limpios de corazón, porque ellos verán a Dios. Aleluya.\n\nAnt. 3. Mi alma se siente firme, está cimentada en Cristo, el Señor. Aleluya.\n\nCántico Ef 1, 3-10\nEL PLAN DIVINO DE LA SALVACIÓN\n\nBendito sea Dios,\nPadre de nuestro Señor Jesucristo,\nque nos ha bendecido en la persona de Cristo\ncon toda clase de bienes espirituales y celestiales.\n\nÉl nos eligió en la persona de Cristo,\nantes de crear el mundo,\npara que fuésemos consagrados\ne irreprochables ante él por el amor.\n\nÉl nos ha destinado en la persona de Cristo,\npor pura iniciativa suya,\na ser sus hijos,\npara que la gloria de su gracia,\nque tan generosamente nos ha concedido\nen su querido Hijo,\nredunde en alabanza suya.\n\nPor este Hijo, por su sangre,\nhemos recibido la redención,\nel perdón de los pecados.\nEl tesoro de su gracia, sabiduría y prudencia\nha sido un derroche para con nosotros,\ndándonos a conocer el misterio de su voluntad.\n\nÉste es el plan\nque había proyectado realizar por Cristo\ncuando llegase el momento culminante:\nhacer que todas las cosas tuviesen a Cristo por cabeza,\nlas del cielo y las de la tierra.\n\nAnt. Mi alma se siente firme, está cimentada en Cristo, el Señor. Aleluya.',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description':
              'Ant. 1. Virgen ilustre, sensata, prudente en tu decisión, tienes como esposo del alma al Verbo inmaculado.  Aleluya.\n\nSalmo 18 A\nEL CIELO PROCLAMA LA GLORIA DE DIOS\n\nEl cielo proclama la gloria de Dios,\nel firmamento pregona\nla obra de sus manos:\nel día al día le pasa el mensaje,\nla noche a la noche se lo susurra.\n\nSin que hablen, sin que pronuncien,\nsin que resuene su voz,\na toda la tierra alcanza su pregón\ny hasta los límites del orbe su lenguaje.\n\nAllí le ha puesto su tienda al sol:\nél sale como el esposo de su alcoba,\ncontento como un héroe,\na recorrer su camino.\n\nAsoma por un extremo del cielo,\ny su órbita llega al otro extremo:\nnada se libra de su calor.\n\nAnt. Virgen ilustre, sensata, prudente en tu decisión, tienes como esposo del alma al Verbo inmaculado.  Aleluya.\n\nAnt. 2. Por amor a mi Señor Jesucristo, tuve en nada los bienes de este mundo y del tiempo presente. Aleluya.\n\nSalmo 44\nLAS NUPCIAS DEL REY\nI\n\nMe brota del corazón un poema bello,\nrecito mis versos a un rey;\nmi lengua es ágil pluma de escribano.\n\nEres el más bello de los hombres,\nen tus labios se derrama la gracia,\nel Señor te bendice eternamente.\n\nCíñete al flanco la espada, valiente:\nes tu gala y tu orgullo;\ncabalga victorioso por la verdad y la justicia,\ntu diestra te enseñe a realizar proezas.\nTus flechas son agudas, los pueblos se te rinden,\nse acobardan los enemigos del rey.\n\nTu trono, oh Dios, permanece para siempre,\ncetro de rectitud es tu cetro real;\nhas amado la justicia y odiado la impiedad:\npor eso el Señor, tu Dios, te ha ungido\ncon aceite de júbilo\nentre todos tus compañeros.\n\nA mirra, áloe y acacia huelen tus vestidos,\ndesde los palacios de marfiles te deleitan las arpas.\nHijas de reyes salen a tu encuentro,\nde pie a tu derecha está la reina,\nenjoyada con oro de Ofir.\n\nAnt. Por amor a mi Señor Jesucristo, tuve en nada los bienes de este mundo y del tiempo presente.  Aleluya.\n\nAnt. 3. Prendado está el rey de tu belleza, porque él es tu Señor y tu Dios. Aleluya.\n\nII\n\nEscucha, hija, mira: inclina el oído,\nolvida tu pueblo y la casa paterna;\nprendado está el rey de tu belleza:\npóstrate ante él, que él es tu señor.\nLa ciudad de Tiro viene con regalos,\nlos pueblos más ricos buscan tu favor.\n\nYa entra la princesa, bellísima,\nvestida de perlas y brocado;\nla llevan ante el rey, con séquito de vírgenes,\nla siguen sus compañeras:\nlas traen entre alegría y algazara,\nvan entrando en el palacio real.\n\n\"A cambio de tus padres tendrás hijos,\nque nombrarás príncipes por toda la tierra\".\n\nQuiero hacer memorable tu nombre\npor generaciones y generaciones,\ny los pueblos te alabarán\npor los siglos de los siglos.\n\nAnt. Prendado está el rey de tu belleza, porque él es tu Señor y tu Dios. (T.P. Aleluya).\n\nVERSÍCULO\n\nV. Me enseñarás el sendero de la vida. Aleluya.\nR. Me saciarás de gozo en tu presencia. Aleluya.\n\nPRIMERA LECTURA \n\nDe la primera carta del apóstol san Pablo a los Corintios 7, 25-40\nLA VIRGINIDAD CRISTIANA\n\nHermanos: Respecto al celibato no tengo órdenes del Señor, sino que doy mi parecer como hombre de fiar que soy, por la misericordia del Señor. Estimo que es un bien, por la necesidad actual: quiero decir que es un bien vivir así. ¿Estás unido a una mujer? No busques la separación. ¿Estás libre? No busques mujer; aunque si te casas, no haces mal; y si una soltera se casa, tampoco hace mal. Pero estos tales sufrirán la tribulación de la carne respeto vuestras razones. Os digo esto, hermanos: el momento es apremiante. Queda como solución: que los que tienen mujer vivan como si no la tuvieran; los que lloran, como si no lloraran; los que están alegres, como si no lo estuvieran; los que compran, como si no poseyeran; los que negocian en el mundo, como si no disfrutaran de él: porque la presentación de este mundo se termina.\nQuiero que os ahorréis preocupaciones: el célibe se preocupa de los asuntos del Señor, buscando contentar al Señor; en cambio, el casado se preocupa de los asuntos del mundo, buscando contentar a su mujer, y anda dividido. Lo mismo, la mujer sin marido y la soltera se preocupan de los asuntos del Señor, consagrándose a ellos en cuerpo y alma; en cambio, la casada se preocupa de los asuntos del mundo, buscando contentar a su marido. Os digo todo esto para vuestro bien, no para poneros una trampa, sino para induciros a una cosa noble y al trato con el Señor sin preocupaciones. Si, a pesar de todo, alguien cree faltar a la conveniencia respecto de su doncella, por estar en la flor de su edad, y conviene proceder así, haga lo que quiera, no hace mal; cásense. Mas el que permanece firme en su corazón, y sin presión alguna y en pleno uso de su libertad está resuelto en su interior a guardar a su doncella, hará bien. Así pues, el que casa a su doncella obra bien. Y el que no la casa obra mejor. La mujer está ligada a su marido mientras él viva; mas una vez muerto el marido, queda libre para casarse con quien quiera, pero en el Señor. Sin embargo, será más feliz si permanece así según mi consejo; que yo también creo tener el Espíritu de Dios.\n\nRESPONSORIO\n\nV. Prendado está el rey de tu belleza, obra de sus manos; él es tu Dios y tu rey.\nR. Tu rey es al mismo tiempo tu esposo. Aleluya.\nV. Has tomado por esposo al rey y Dios; él te ha dotado, él te ha engalanado, te ha redimido, te ha santificado.\nR. Tu rey es al mismo tiempo tu esposo. Aleluya.',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nPastor, que con tus silbos amorosos\nme despertaste del profundo sueño,\ntú me hiciste cayado de este leño\nen que tiendes los brazos poderosos.\n \nVuelve los ojos a mi fe piadosos,\npues te confieso por mi amor y dueño,\ny la palabra de seguir empeño\ntus dulces silbos y tus pies hermosos.\n \nOye, Pastor, que por amores mueres,\nno te espante el rigor de mis pecados,\npues tan amigo de rendidos eres.\n \nEspera, pues, y escucha mis cuidados.\nPero ¿cómo te digo que me esperes,\nsi estás, para esperar, los pies clavados? Amén.\n\nSALMODIA \n\nAnt. Aleluya, aleluya, aleluya. \n\nSalmo 118, 73-80 \n\nTus manos me hicieron y me formaron:\ninstrúyeme para que aprenda tus mandatos;\ntus fieles verán con alegría\nque he esperado en tu palabra;\nreconozco, Señor, que tus mandamientos son justos,\nque con razón me hiciste sufrir.\n \nQue tu bondad me consuele,\nsegún la promesa hecha a tu siervo;\ncuando me alcance tu compasión, viviré,\ny mis delicias serán tu voluntad;\nque se avergüencen los insolentes\ndel daño que me hacen;\nyo meditaré tus decretos.\n \nVuelvan a mí tus fieles\nque hacen caso de tus preceptos;\nsea mi corazón perfecto en tus leyes,\nasí no quedaré avergonzado.\n\nAnt. Aleluya, aleluya, aleluya.  \n\nSalmo 58\nORACIÓN PIDIENDO LA PROTECCIÓN DE DIOS CONTRA LOS ENEMIGOS\nEstas súplicas expresan la confianza del Salvador ante su Padre (Eussebio de Cesárea).   \n\nLíbrame de mi enemigo, Dios mío;\nprotégeme de mis agresores,\nlíbrame de los malhechores,\nsálvame de los hombres sanguinarios.\n \nMira que me están acechando,\ny me acosan los poderosos:\nsin que yo haya pecado ni faltado, Señor,\nsin culpa mía, avanzan para acometerme.\n \nDespierta, ven a mi encuentro, mira:\ntú, el Señor de los ejércitos,\nel Dios de Israel.\n \nEstoy velando contigo, fuerza mía,\nporque tú, oh Dios, eres mi alcázar;\nque tu favor se adelante, oh Dios,\ny me haga ver la derrota del enemigo.\n \nPero yo cantaré tu fuerza,\npor la mañana aclamaré tu misericordia;\nporque has sido mi alcázar\ny mi refugio en el peligro.\n \nY tocaré en tu honor, fuerza mía,\nporque tú, oh Dios, eres mi alcázar. \n\nAnt. Aleluya, aleluya, aleluya.  \n\nSalmo 59\nORACIÓN DESPUÉS DE UNA CALAMIDAD\nEn el mundo tendréis luchas, pero tened valor: Yo he vencido al mundo (Jn 16, 33). \n\nOh Dios, nos rechazaste y rompiste nuestras filas;\nestabas airado, pero restáuranos.\nHas sacudido y agrietado el país:\nrepara sus grietas, que se desmorona.\n \nHiciste sufrir un desastre a tu pueblo,\ndándole a beber un vino de vértigo;\ndiste a tus fieles la señal de desbandada,\nhaciéndolos huir de los arcos.\n \nPara que se salven tus predilectos,\nque tu mano salvadora nos responda.\n \nDios habló en su santuario:\n\"Triunfante ocuparé Siquén,\nparcelaré el valle de Sucot;\n \nmío es Galaad, mío Manasés,\nEfraín es yelmo de mi cabeza,\nJudá es mi cetro;\n \nMoab, una jofaina para lavarme;\nsobre Edom echo mi sandalia,\nsobre Filistea canto victoria\".\n \nPero ¿quién me guiará a la plaza fuerte,\nquién me conducirá a Edom,\nsi tú, oh Dios, nos has rechazado\ny no sales ya con nuestras tropas?\n \nAuxílianos contra el enemigo,\nque la ayuda del hombre es inútil.\nCon Dios haremos proezas,\nél pisoteará a nuestros enemigos. \n\nAnt. Aleluya, aleluya, aleluya.\n\nTERCIA\n\nLECTURA BREVE Sb 8, 21\n\nComprendí que no podría poseer la sabiduría si Dios no me la daba, y ya era un fruto de la prudencia saber de quién procedía esta gracia.\n\nV. Ésta es la virgen sensata. Aleluya.\nR. Que el Señor encontró velando. Aleluya.\n\nORACIÓN\n\nOH, Dios,\nque inflamaste de amor divino a santa Catalina de Siena\nen la contemplación de la pasión del Señor\ny en el servicio a tu Iglesia,\nconcede a tu pueblo, por su intercesión,\nque, unido al misterio de Cristo,\nse alegre siempre por la manifestación de su gloria.\nPor nuestro Señor Jesucristo.\n\nSEXTA\n\nLECTURA BREVE 1 Co 7, 25\n\nRespecto al celibato no tengo órdenes del Señor, sino que doy mi parecer como hombre de fiar que soy, por la misericordia del Señor.\n\nV. Ésta es la virgen sensata. Aleluya.\nR. Una del número de las prudentes. Aleluya.\n\nORACIÓN\n\nOH, Dios,\nque inflamaste de amor divino a santa Catalina de Siena\nen la contemplación de la pasión del Señor\ny en el servicio a tu Iglesia,\nconcede a tu pueblo, por su intercesión,\nque, unido al misterio de Cristo,\nse alegre siempre por la manifestación de su gloria.\nPor nuestro Señor Jesucristo.\n\nNONA\n\nLECTURA BREVE Ap 19, 6. 7\n\nReina el Señor, nuestro Dios, dueño de todo; alegrémonos y gocemos y démosle gracias, porque llegó la boda del Cordero, y su esposa se ha embellecido.\n\nV. Encontré al amor de mi alma. Aleluya.\nR. Lo abracé y ya no lo soltaré. Aleluya.\n\nORACIÓN\n\nOH, Dios,\nque inflamaste de amor divino a santa Catalina de Siena\nen la contemplación de la pasión del Señor\ny en el servicio a tu Iglesia,\nconcede a tu pueblo, por su intercesión,\nque, unido al misterio de Cristo,\nse alegre siempre por la manifestación de su gloria.\nPor nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya.\nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        }
      ]
    },
    {
      'date': '2024-04-30',
      'info': [
        {
          'title': 'Completas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.  \n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.  \n\nEXAMEN DE CONCIENCIA  \n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.  \n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:  \n\nI  \n\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.  \n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.    \n\nII  \n\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.  \n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.  \n\nHIMNO  \n\nTiembla el frío de los astros,\ny el silencio de los montes\nduerme sin fin. (Sólo el agua\nde mi corazón se oye).\n \nSu dulce latir, ¡tan dentro!,\ncalladamente responde\na la soledad inmensa\nde algo que late en la noche.\n \nSomos tuyos, tuyos, tuyos;\nsomos, Señor, ese insomne\ntemblor del agua nocturna,\nmás limpia después que corre.\n \n¡Agua en reposo viviente,\nque vuelve a ser pura y joven\ncon una esperanza! (Sólo\nen mi alma sonar se oye).\n \nGloria al Padre, gloria al Hijo,\ngloria al Espíritu Santo,\npor los siglos de los siglos. Amén.  \n\nSALMODIA  \n\nAnt. No me escondas tu rostro, ya que confío en ti. Aleluya.  \n\nSalmo 142, 1-11\nLAMENTACIÓN Y SÚPLICA ANTE LA ANGUSTIA\nEl hombre no se justifica por cumplir la ley; sino por creer en Cristo Jesús (Ga 2, 16).  \n\nSeñor, escucha mi oración;\ntú, que eres fiel, atiende a mi súplica;\ntú, que eres justo, escúchame.\nNo llames a juicio a tu siervo,\npues ningún hombre vivo es inocente frente a ti.\n \nEl enemigo me persigue a muerte,\nempuja mi vida al sepulcro,\nme confina a las tinieblas\ncomo a los muertos ya olvidados.\nMi aliento desfallece,\nmi corazón dentro de mí está yerto.\n \nRecuerdo los tiempos antiguos,\nmedito todas tus acciones,\nconsidero las obras de tus manos\ny extiendo mis brazos hacia ti:\ntengo sed de ti como tierra reseca.\n \nEscúchame en seguida, Señor,\nque me falta el aliento.\nNo me escondas tu rostro,\nigual que a los que bajan a la fosa.\n \nEn la mañana hazme escuchar tu gracia,\nya que confío en ti.\nIndícame el camino que he de seguir,\npues levanto mi alma a ti.\n \nLíbrame del enemigo, Señor,\nque me refugio en ti.\nEnséñame a cumplir tu voluntad,\nya que tú eres mi Dios.\nTu espíritu, que es bueno,\nme guíe por tierra llana.\n \nPor tu nombre, Señor, consérvame vivo;\npor tu clemencia, sácame de la angustia.   \n\nAnt. No me escondas tu rostro, ya que confío en ti. Aleluya.  \n\nLECTURA BREVE 1 Pe 5, 8-9  \n\nSed sobrios, estad alerta, que vuestro enemigo, el diablo, como león rugiente, ronda buscando a quien devorar; resistidle firmes en la fe.  \n\nRESPONSORIO BREVE  \n\nV. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.  \n\nCÁNTICO EVANGÉLICO  \n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.  \n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL  \n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.  \n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.   \n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.  \n\nORACIÓN  \n\nIlumina, Señor, nuestra noche y concédenos un descanso tranquilo; que mañana nos levantemos en tu nombre y podamos contemplar, con salud y gozo, el clarear del nuevo día. Por Jesucristo nuestro Señor.  \n\nCONCLUSIÓN\nBendición  \n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén. \n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN \n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate, Virgen María; aleluya.\nPorque verdaderamente ha resucitado el Señor; aleluya.',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description':
              'V. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nINVITATORIO\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nHIMNO.\n\nOfrezcan los cristianos\nofrendas de alabanza\na gloria de la Víctima\npropicia de la Pascua.\n \nCordero sin pecado\nque a las ovejas salva,\na Dios y a los culpables\nunió con nueva alianza.\n \nLucharon vida y muerte\nen singular batalla\ny muerto el que es la Vida,\ntriunfante se levanta.\n \n¿Qué has visto de camino,\n María, en la mañana?\nA mi Señor glorioso,\nla tumba abandonada,\nlos ángeles testigos,\nsudarios y mortaja.\n \n¡Resucitó de veras\nmi amor y mi esperanza!\n \nVenid a Galilea,\nallí el Señor aguarda;\nallí veréis los suyos\nla gloria de la Pascua.\n \nPrimicia de los muertos,\nsabemos por tu gracia\nque estás resucitado;\nla muerte en ti no manda.\n \nRey vencedor, apiádate\nde la miseria humana\ny da a tus fieles parte\nen tu victoria santa.\n\nSALMODIA\n\nAnt. 1. El que bajó es el mismo que subió por encima de todos los cielos. Aleluya.\n\nSalmo 23\nENTRADA SOLEMNE DE DIOS EN SU TEMPLO\nLas puertas del cielo se abren ante Cristo que como hombre sube al cielo (S. Ireneo).\n\nDel Señor es la tierra y cuanto la llena,\nel orbe y todos sus habitantes:\nél la fundó sobre los mares,\nél la afianzó sobre los ríos.\n \n— ¿Quién puede subir al monte del Señor?\n¿Quién puede estar en el recinto sacro?\n \n— El hombre de manos inocentes\ny puro corazón,\nque no confía en los ídolos\nni jura contra el prójimo en falso.\nÉse recibirá la bendición del Señor,\nle hará justicia el Dios de salvación.\n \n— Éste es el grupo que busca al Señor,\nque viene a tu presencia, Dios de Jacob.\n \n¡Portones!, alzad los dinteles,\nque se alcen las antiguas compuertas:\nva a entrar el Rey de la gloria.\n \n— ¿Quién es ese Rey de la gloria?\n— El Señor, héroe valeroso;\nel Señor, héroe de la guerra.\n      \n¡Portones!, alzad los dinteles,\nque se alcen las antiguas compuertas:\nva a entrar el Rey de la gloria.\n \n— ¿Quién es ese Rey de la gloria?\n— El Señor, Dios de los ejércitos.\nÉl es el Rey de la gloria.\n\nAnt. El que bajó es el mismo que subió por encima de todos los cielos. Aleluya.\n\nAnt. 2. Ensalzad al Rey del cielo y alegraos de su grandeza. Aleluya.\n\nCántico Tb 13, 1-10\nESPERANZA DE ISRAEL EN BABILONIA\nBendito sea Dios, Padre de nuestro Señor Jesucristo, que en su gran misericordia nos ha hecho nacer de nuevo para una esperanza viva (1 Pe 1, 3). \n\nBendito sea Dios, que vive eternamente,\ny cuyo reino dura por los siglos:\nél azota y se compadece,\nhunde hasta el abismo y saca de él,\ny no hay quien escape de su mano.\n \nDadle gracias, israelitas, ante los gentiles,\nporque él nos dispersó entre ellos.\nProclamad allí su grandeza,\nensalzadlo ante todos los vivientes:\nque él es nuestro Dios y Señor,\nnuestro padre por todos los siglos.\n \nÉl nos azota por nuestros delitos,\npero se compadecerá de nuevo,\ny os congregará de entre todas las naciones\npor donde estáis dispersados.\n \nSi volvéis a él de todo corazón\ny con toda el alma,\nsiendo sinceros con él,\nél volverá a vosotros\ny no os ocultará su rostro.\n \nVeréis lo que hará con vosotros,\nle daréis gracias a boca llena,\nbendeciréis al Señor de la justicia\ny ensalzaréis al rey de los siglos.\n \nYo le doy gracias en mi cautiverio,\nanuncio su grandeza y su poder\na un pueblo pecador.\n \nConvertíos, pecadores,\nobrad rectamente en su presencia:\nquizá os mostrará benevolencia\ny tendrá compasión.\n \nEnsalzaré a mi Dios, al rey del cielo,\ny me alegraré de su grandeza.\nAnuncien todos los pueblos sus maravillas\ny alábenle sus elegidos en Jerusalén.\n\nAnt. Ensalzad al rey del cielo y alegraos de su grandeza. Aleluya.\n\nAnt. 3. La misericordia del Señor llena la tierra. Aleluya.\n\nSalmo 32\nHIMNO AL PODER Y A LA PROVIDENCIA DE DIOS\nPor la Palabra empezaron a existir todas las cosas (Jn 1, 3).\n\nAclamad, justos, al Señor,\nque merece la alabanza de los buenos.\n \nDad gracias al Señor con la cítara,\ntocad en su honor el arpa de diez cuerdas;\ncantadle un cántico nuevo,\nacompañando vuestra música con aclamaciones:\n \nque la palabra del Señor es sincera,\ny todas sus acciones son leales,\nél ama la justicia y el derecho,\ny su misericordia llena la tierra.\n \nLa palabra del Señor hizo el cielo;\nel aliento de su boca, sus ejércitos;\nencierra en un odre las aguas marinas,\nmete en un depósito el océano.\n \nTema al Señor la tierra entera,\ntiemblen ante él los habitantes del orbe:\nporque él lo dijo, y existió;\nél lo mandó, y surgió.\n \nEl Señor deshace los planes de las naciones,\nfrustra los proyectos de los pueblos;\npero el plan del Señor subsiste por siempre,\nlos proyectos de su corazón, de edad en edad.\n \nDichosa la nación cuyo Dios es el Señor,\nel pueblo que él se escogió como heredad.\n \nEl Señor mira desde el cielo,\nse fija en todos los hombres;\ndesde su morada observa\na todos los habitantes de la tierra:\nél modeló cada corazón,\ny comprende todas sus acciones.\n \nNo vence el rey por su gran ejército,\nno escapa el soldado por su mucha fuerza,\nnada valen sus caballos para la victoria,\nni por su gran ejército se salva.\n \nLos ojos del Señor están puestos en sus fieles,\nen los que esperan en su misericordia,\npara librar sus vidas de la muerte\ny reanimarlos en tiempo de hambre.\n \nNosotros esperamos en el Señor:\nél es nuestro auxilio y escudo,\ncon él se alegra nuestro corazón,\nen su santo nombre confiamos.\n \nQue tu misericordia, Señor, venga sobre nosotros,\ncomo lo esperamos de ti.\n\nAnt. La misericordia del Señor llena la tierra. Aleluya.\n\nLECTURA BREVE Hch 13, 30-33\n\nDios resucitó a Jesús de entre los muertos. Durante muchos días, se apareció a los que lo habían acompañado de Galilea a Jerusalén, y ellos son ahora sus testigos ante el pueblo. Nosotros os anunciamos que la promesa que Dios hizo a nuestros padres, nos la ha cumplido a los hijos resucitando a Jesús. Así está escrito en el salmo segundo: «Tú eres mi Hijo: yo te he engendrado hoy».\n\nRESPONSORIO BREVE\n\nV. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\nR. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\nV. El que por nosotros colgó del madero.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. La paz os dejo, aleluya, mi paz os doy. Aleluya.\n\nBENEDICTUS Lucas 1, 68-79\nEL MESÍAS Y SU PRECURSOR\n\nBendito sea el Señor, Dios de Israel,\nporque ha visitado y redimido a su pueblo,\nsuscitándonos una fuerza de salvación\nen la casa de David, su siervo,\nsegún lo había predicho desde antiguo,\npor boca de sus santos profetas.\n \nEs la salvación que nos libra de nuestros enemigos\ny de la mano de todos los que nos odian;\nrealizando la misericordia\nque tuvo con nuestros padres,\nrecordando su santa alianza\ny el juramento que juró a nuestro padre Abrahán.\n \nPara concedernos que, libres de temor,\narrancados de la mano de los enemigos,\nle sirvamos con santidad y justicia,\nen su presencia, todos nuestros días.\n \nY a ti, niño, te llamarán profeta del Altísimo,\nporque irás delante del Señor\na preparar sus caminos,\nanunciando a su pueblo la salvación,\nel perdón de sus pecados.\n \nPor la entrañable misericordia de nuestro Dios,\nnos visitará el sol que nace de lo alto,\npara iluminar a los que viven en tinieblas\ny en sombra de muerte,\npara guiar nuestros pasos\npor el camino de la paz.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. La paz os dejo, aleluya, mi paz os doy. Aleluya.\n\nPRECES\n\nAlabemos a Cristo, que con su poder reconstruyó el templo destruido de su cuerpo, y supliquémosle:\n\nConcédenos, Señor, los frutos de tu resurrección.\n\nOh Cristo Salvador, que en tu resurrección anunciaste la alegría a las mujeres y a los apóstoles y salvaste al universo entero,\n— conviértenos en testigos del Dios viviente.\n\nTú que has prometido la resurrección universal y has anunciado una vida nueva,\n— haz de nosotros mensajeros del Evangelio de la vida.\n\nTú que te apareciste repetidas veces a los apóstoles y les comunicaste el Espíritu Santo,\n— renuévanos por el Espíritu Defensor.\n\nTú que prometiste estar con tus discípulos hasta el fin del mundo,\n— quédate hoy con nosotros y sé siempre nuestro compañero.\n\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN \n\nSeñor, tú que en la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre y al Hijo y al Espíritu Santo\ncomo era en el principio, ahora y siempre\ny por los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nNuestra Pascua inmolada, aleluya,\nes Cristo el Señor, aleluya, aleluya.\n \nPascua sagrada, ¡oh fiesta universal!,\nel mundo renovado\ncanta un himno a su Señor.\n \nPascua sagrada, ¡victoria de la cruz!\nLa muerte, derrotada,\nha perdido su aguijón.\n \nPascua sagrada,\n¡oh noche bautismal!\n \nDel seno de las aguas\nrenacemos al Señor.\n \nPascua sagrada, ¡eterna novedad!\nDejad al hombre viejo,\nrevestíos del Señor.\n \nPascua sagrada. La sala del festín\nse llena de invitados\nque celebran al Señor.\n \nPascua sagrada, ¡Cantemos al Señor!\nVivamos la alegría\ndada a luz en el dolor.\n\nSALMODIA\n\nAnt. 1. Ahora se estableció el reinado de nuestro Dios y la potestad de su Cristo. Aleluya.\n\nSalmo 19.\nORACIÓN POR LA VICTORIA DEL REY.\nCuantos invoquen el nombre del Señor se salvarán (Hch 2, 21).\n\nQue te escuche el Señor el día del peligro,\nque te sostenga el nombre del Dios de Jacob;\nque te envíe auxilio desde el santuario,\nque te apoye desde el monte Sión:\n \nque se acuerde de todas tus ofrendas,\nque le agraden tus sacrificios;\nque cumpla el deseo de tu corazón,\nque dé éxito a todos tus planes.\n \nQue podamos celebrar tu victoria\ny en el nombre de nuestro Dios alzar estandartes;\nque el Señor te conceda todo lo que pides.\n \nAhora reconozco que el Señor\nda la victoria a su Ungido,\nque lo ha escuchado desde su santo cielo,\ncon los prodigios de su mano victoriosa.\n \nUnos confían en sus carros,\notros en su caballería;\nnosotrosinvocamos el nombre\ndel Señor, Dios nuestro.\n \nEllos cayeron derribados,\nnosotros nos mantenemos en pie.\n \nSeñor, da la victoria al rey\ny escúchanos cuando te invocamos.\n\nAnt. Ahora se estableció el reinado de nuestro Dios y la potestad de su Cristo. Aleluya.\n\nAnt. 2. Has asumido, Señor, el poder y comenzaste a reinar. Aleluya.\n\nSalmo 20, 2-8. 14.\nACCIÓN DE GRACIAS POR LA VICTORIA DEL REY.\nEl Señor resucitado recibió la vida, años que se prolongan sin término (S. Ireneo).\n\nSeñor, el rey se alegra por tu fuerza,\n¡y cuánto goza con tu victoria!\nLe has concedido el deseo de su corazón,\nno le has negado lo que pedían sus labios.\n \nTe adelantaste a bendecirlo con el éxito,\ny has puesto en su cabeza una corona de oro fino.\nTe pidió vida, y se la has concedido,\naños que se prolongan sin término.\n \nTu victoria ha engrandecido su fama,\nlo has vestido de honor y majestad.\nLe concedes bendiciones incesantes,\nlo colmas de gozo en tu presencia:\nporque el rey confía en el Señor\ny con la gracia del Altísimo no fracasará.\n \nLevántate, Señor, con tu fuerza,\ny al son de instrumentos cantaremos tu poder.\n\nAnt. Has asumido, Señor, el poder y comenzaste a reinar. Aleluya.\n\nAnt. 3. Que te sirva toda la creación, porque tú lo mandaste, y existió. Aleluya.\n\nCántico Ap 4, 11; 5, 9-10. 12.\nHIMNO A DIOS CREADOR.\n\nEres digno, Señor Dios nuestro, de recibir la gloria,\nel honor y el poder,\nporque tú has creado el universo;\nporque por tu voluntad lo que no existía fue creado.\n \nEres digno de tomar el libro y abrir sus sellos,\nporque fuiste degollado\ny por tu sangre compraste para Dios\nhombres de toda raza, lengua, pueblo y nación;\ny has hecho de ellos para nuestro Dios\nun reino de sacerdotes\ny reinan sobre la tierra.\n \nDigno es el Cordero degollado\nde recibir el poder, la riqueza y la sabiduría,\nla fuerza y el honor, la gloria y la alabanza.\n\nAnt. Que te sirva toda la creación, porque tú lo mandaste, y existió. Aleluya.\n\nLECTURA BREVE 1 Pe 2, 4-5\n\nAcercándoos al Señor, la piedra viva desechada por los hombres, pero escogida y preciosa ante Dios, también vosotros, como piedras vivas, entráis en la construcción del templo del Espíritu, formando un sacerdocio sagrado, para ofrecer sacrificios espirituales que Dios acepta por Jesucristo.\n\nRESPONSORIO BREVE\n\nV. Los discípulos se llenaron de alegría. Aleluya, aleluya.\nR. Los discípulos se llenaron de alegría. Aleluya, aleluya.\nV. Al ver al Señor.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Los discípulos se llenaron de alegría. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Si me amarais, os alegraríais de que vaya al Padre. Aleluya.  \n\nMAGNÍFICAT Lc 1, 46-55.\nALEGRÍA DEL ALMA EN EL SEÑOR.\n\nProclama mi alma la grandeza del Señor,\nse alegra mi espíritu en Dios mi salvador;\nporque ha mirado la humillación de su esclava.\n \nDesde ahora me felicitarán todas las generaciones,\nporque el Poderoso ha hecho obras grandes por mí:\nsu nombre es santo\ny su misericordia llega a sus fieles\nde generación en generación.\n \nÉl hace proezas con su brazo:\ndispersa a los soberbios de corazón,\nderriba del trono a los poderosos\ny enaltece a los humildes,\na los hambrientos los colma de bienes\ny a los ricos los despide vacíos.\n \nAuxilia a Israel, su siervo,\nacordándose de su misericordia\n—como lo había prometido a nuestros padres—\nen favor de Abraham y su descendencia por siempre.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Si me amarais, os alegraríais de que vaya al Padre. Aleluya. \n\nPRECES\n\nAclamemos alegres a Cristo, que después de ser sepultado en el seno de la tierra resucitó gloriosamente a una vida nueva, y digámosle confiados:\n\nRey de la gloria, escúchanos.\n\nTe rogamos, Señor, por los obispos, los presbíteros y los diáconos: que sirvan con celo a tu pueblo\n— y le conduzcan por los caminos del bien.\n\nTe rogamos, Señor, por los que sirven a la Iglesia con el estudio de tu palabra:\n— que escudriñen tu doctrina con pureza de corazón y deseo de adoctrinar a tu pueblo.\n\nTe rogamos, Señor, por todos los fieles de la Iglesia: que combatan bien el combate de la fe,\n— y, habiendo corrido hasta la meta, alcancen la corona merecida.\n\nTú que en la cruz clavaste y borraste el protocolo que nos condenaba,\n— destruye también en nosotros toda clase de esclavitud y líbranos de toda tiniebla.\n\nTú que al bajar al lugar de los muertos abriste las puertas del abismo,\n— recibe a nuestros hermanos difuntos en tu reino.\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN \n\nSeñor, tú que por la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN \n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description':
              'V. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nINVITATORIO\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya.\n\nHIMNO\n\n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya!\n \nMuerte y Vida lucharon,\ny la muerte fue vencida.\n¡Aleluya, aleluya!\n \nEs el grano que muere\npara el triunfo de la espiga.\n¡Aleluya, aleluya!\n \nCristo es nuestra esperanza\nnuestra paz y nuestra vida.\n¡Aleluya, aleluya!\n \nVivamos vida nueva,\nel bautismo es nuestra Pascua.\n¡Aleluya, aleluya!\n \n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya! Amén.\n\nSALMODIA.\n\nAnt. 1. El Señor hará justicia a los pobres. Aleluya.\n\nSalmo 9 B.\nCANTO DE ACCIÓN DE GRACIAS.\nDichosos los pobres, porque vuestro es el reino de Dios (Lc 6, 20).\nI\n\n¿Por qué te quedas lejos, Señor,\ny te escondes en el momento del aprieto?\nLa soberbia del impío oprime al infeliz\ny lo enreda en las intrigas que ha tramado.\n \nEl malvado se gloría de su ambición,\nel codicioso blasfema y desprecia al Señor.\nEl malvado dice con insolencia:\n«No hay Dios que me pida cuentas.»\n \nLa intriga vicia siempre su conducta,\naleja de su mente tus juicios\ny desafía a sus rivales.\nPiensa: «No vacilaré,\nnunca jamás seré desgraciado.»\n \nSu boca está llena de maldiciones,\nde engaños y de fraudes;\nsu lengua encubre maldad y opresión;\nen el zaguán se sienta al acecho\npara matar a escondidas al inocente.\n \nSus ojos espían al pobre;\nacecha en su escondrijo como león en su guarida,\nacecha al desgraciado para robarle,\narrastrándolo a sus redes;\n \nse agacha y se encoge\ny con violencia cae sobre el indefenso.\nPiensa: «Dios lo olvida,\nse tapa la cara para no enterarse.»\n\nAnt. El Señor hará justicia a los pobres. Aleluya.\n\nAnt. 2. Tú, Señor, ves las penas y los trabajos. Aleluya.\n\nII\n\nLevántate, Señor, extiende tu mano,\nno te olvides de los humildes;\n¿por qué ha de despreciar a Dios el malvado,\npensando que no le pedirá cuentas?\n \nPero tú ves las penas y los trabajos,\ntú miras y los tomas en tus manos.\nA ti se encomienda el pobre,\ntú socorres al huérfano.\n \nRómpele el brazo al malvado,\npídele cuentas de su maldad, y que desaparezca.\nEl Señor reinará eternamente\ny los gentiles desaparecerán de su tierra.\n \nSeñor, tú escuchas los deseos de los humildes,\nles prestas oído y los animas;\ntú defiendes al huérfano y al desvalido:\nque el hombre hecho de tierra\nno vuelva a sembrar su terror.\n\nAnt. Tú, Señor, ves las penas y los trabajos. Aleluya.\n\nAnt. 3. Las palabras del Señor son palabras auténticas, como plata refinada siete veces. Aleluya.\n\nSalmo 11.\nINVOCACIÓN A LA FIDELIDAD DE DIOS CONTRA LOS ENEMIGOS MENTIROSOS.\nPorque éramos pobres, el Padre nos ha mandado a su Hijo (San Agustín).\n\nSálvanos, Señor, que se acaban los buenos,\nque desaparece la lealtad entre los hombres:\nno hacen más que mentir a su prójimo,\nhablan con labios embusteros\ny con doblez de corazón.\n \nExtirpe el Señor los labios embusteros\ny la lengua fanfarrona\nde los que dicen: \"la lengua es nuestra fuerza,\nnuestros labios nos defienden,\n¿quién será nuestro amor?\"\n \nEl Señor responde: \"por la opresión del humilde,\npor el gemido del pobre,\nyo me levantaré,\ny pondré a salvo al que lo ansía\".\n \nLas palabras del Señor son palabras auténticas,\ncomo plata limpia de ganga,\nrefinada siete veces.\n \nTú nos guardarás, Señor,\nnos librarás para siempre de esa gente:\nde los malvados que merodean\npara chupar como sanguijuelas sangre humana.\n\nAnt. Las palabras del Señor son palabras auténticas, como plata refinada siete veces. Aleluya.\n\nVERSÍCULO.\n\nV. Cristo, una vez resucitado de entre los muertos, ya no muere. Aleluya.\nR. La muerte no tiene ya poder sobre él. Aleluya.\n\nPRIMERA LECTURA.\n\nDel libro del Apocalipsis 20, 1-15\nÚLTIMA BATALLA DE LA SERPIENTE\n\nYo, Juan, vi a un ángel que descendía del cielo, trayendo en su mano la llave del abismo y una gran cadena. Sujetó a la serpiente, a la serpiente antigua, que es el Diablo y Satanás, y la encadenó por mil años. La arrojó al abismo, la encerró y puso encima un sello, para que no engañase más a los pueblos, hasta que se cumplieran los mil años. Después será puesta en libertad por un poco de tiempo.\nVi también las almas de los que habían sido degollados por causa del testimonio de Jesús y por la palabra de Dios; revivieron y reinaron con Cristo por mil años. Luego vi unos tronos, y se sentaron en ellos todos los que no adoraron a la bestia ni a su imagen, ni aceptaron su marca en su frente ni en su mano. Y se les dio poder de juzgar. Ésta es la resurrección primera. Los demás muertos no volvieron ya a la vida en todos estos mil años.\nBienaventurado y santo el que toma parte en la resurrección primera. Sobre ellos no tendrá poder alguno la segunda muerte. Serán sacerdotes de Dios y de Cristo; y reinarán con él por mil años.\nCuando se hayan cumplido los mil años, Satanás será soltado de su cárcel, y saldrá a engañar a las naciones que habitan en los cuatro ángulos de la tierra, a Gog y a Magog. Los congregará para la guerra y su ejército será tan numeroso como las arenas del mar. Subieron hacia la llanura de la tierra, y cercaron el campamento de los santos y la ciudad amada de Dios; pero descendió de pronto fuego del cielo y los devoró. El Diablo, que los había engañado, fue arrojado en el estanque de fuego y de azufre, donde están también la bestia y el falso profeta; y serán atormentados día y noche por los siglos de los siglos.\nVi luego un gran trono blanco, y al que estaba sentado en él. El cielo y la tierra desaparecieron de su presencia sin dejar rastro. Y vi a los muertos, grandes y pequeños, de pie delante del trono. Fueron abiertos unos libros y luego fue abierto también otro libro, que es el libro de la vida. Fueron juzgados los muertos según lo que está escrito en los libros, según sus obras. El mar devolvió los muertos que en sí retenía, la muerte y el hades devolvieron los muertos que guardaban en su seno; y fue juzgado cada uno según sus obras. Y la muerte y el hades fueron arrojados al lago de fuego. Ésta es la muerte segunda: el lago de fuego. Y todo el que no fue hallado escrito en el libro de la vida fue arrojado al lago de fuego.\n\nRESPONSORIO 1 Co 15, 25-26; cf. Ap 20, 13. 14\n\nV. Cristo debe reinar hasta que Dios ponga todos sus enemigos bajo sus pies. \nR. El último enemigo aniquilado será la muerte. Aleluya.\nV. Entonces la muerte y el hades devolverán los muertos, y la muerte y el hades serán arrojados al lago de fuego.\nR. El último enemigo aniquilado será la muerte. Aleluya.\n\nSEGUNDA LECTURA\n\nDel comentario de san Cirilo de Alejandría, obispo, sobre el evangelio de san Juan.\n(Libro 10, cap. 2: PG 74, 331-334)\nYO SOY LA VID, VOSOTROS LOS SARMIENTOS.\n\nEl Señor, para convencernos de que es necesario que nos adhiramos a él por el amor, ponderó cuán grandes bienes se derivan de nuestra unión con él, comparándose a sí mismo con la vid y afirmando que los que están unidos a él e injertados en su persona, vienen a ser como sus sarmientos y, al participar del Espíritu Santo, comparten su misma naturaleza (pues el Espíritu de Cristo nos une con él). La adhesión de quienes se vinculan a la vid consiste en una adhesión de voluntad y de deseo; en cambio, la unión de la vid con nosotros es una unión de amor y de inhabilitación. Nosotros, en efecto, partimos de un buen deseo y nos adherimos a Cristo por la fe; así llegamos a participar de su propia naturaleza y alcanzamos la dignidad de hijos adoptivos, pues, como afirma san Pablo, el que se une al Señor es un espíritu con él.\nDe la misma forma que en un lugar de la Escritura se dice de Cristo que es cimiento y fundamento (pues nosotros, se afirma, estamos edificados sobre él y, como piedras vivas y espirituales, entramos en la construcción del templo del Espíritu, formando un sacerdocio sagrado, cosa que no sería posible si Cristo no fuera fundamento), así, de manera semejante, Cristo se llama a sí mismo vid, como si fuera la madre y nodriza de los sarmientos que proceden de él. En él y por él hemos sido regenerados en el Espíritu para producir fruto de vida, no de aquella vida caduca y antigua, sino de la vida nueva que se funda en su amor. Y esta vida la conservaremos si perseveramos unidos a él y como injertados en su persona; si seguimos fielmente los mandamientos que nos dio y procuramos conservar los grandes bienes que nos confió, esforzándonos por no contristar, ni en lo más mínimo, al Espíritu que habita en nosotros, pues, por medio de él, Dios mismo tiene su morada en nuestro interior. De qué modo nosotros estamos en Cristo y Cristo en nosotros nos lo pone en claro el evangelista Juan al decir: En esto conocemos que permanecemos en él, y él en nosotros: en que nos ha dado de su Espíritu. Pues, así como la raíz hace llegar su misma manera de ser a los sarmientos, del mismo modo el Verbo unigénito de Dios Padre comunica a los santos una especie de parentesco consigo mismo y con el Padre, al darles parte en su propia naturaleza, y otorga su Espíritu a los que están unidos con él por la fe: así les comunica una santidad inmensa, los nutre en la piedad y los lleva al conocimiento de la verdad y a la práctica de la virtud.\n\nRESPONSORIO  Jn 15, 4. 16.\n\nV. Permaneced en mí y yo permaneceré en vosotros:\nR. Como el sarmiento no puede dar fruto por sí mismo, si no está unido a la vid, así tampoco vosotros, si no permanecéis en mí. Aleluya.\nV. Yo os he elegido para que vayáis y deis fruto, y que vuestro fruto sea permanente.\nR. Como el sarmiento no puede dar fruto por sí mismo, si no está unido a la vid, así tampoco vosotros, si no permanecéis en mí. Aleluya.\n\nORACIÓN \n\nSeñor, tú que por la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya.\nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nPastor, que con tus silbos amorosos\nme despertaste del profundo sueño,\ntú me hiciste cayado de este leño\nen que tiendes los brazos poderosos.\n \nVuelve los ojos a mi fe piadosos,\npues te confieso por mi amor y dueño,\ny la palabra de seguir empeño\ntus dulces silbos y tus pies hermosos.\n \nOye, Pastor, que por amores mueres,\nno te espante el rigor de mis pecados,\npues tan amigo de rendidos eres.\n \nEspera, pues, y escucha mis cuidados.\nPero ¿cómo te digo que me esperes,\nsi estás, para esperar, los pies clavados? Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 118, 1-8\nMEDITACIÓN SOBRE LA PALABRA DE DIOS REVELADA EN LA LEY\nEl amor de Dios consiste en guardar sus mandamientos (1 Jn 5, 3).\n\nDichoso el que, con vida intachable,\ncamina en la voluntad del Señor;\ndichoso el que, guardando sus preceptos,\nlo busca de todo corazón;\nel que, sin cometer iniquidad,\nanda por sus senderos.\n \nTú promulgas tus decretos\npara que se observen exactamente.\nOjalá esté firme mi camino,\npara cumplir tus consignas;\nentonces no sentiré vergüenza\nal mirar tus mandatos.\n \nTe alabaré con sincero corazón\ncuando aprenda tus justos mandamientos.\nQuiero guardar tus leyes exactamente,\ntú, no me abandones.\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 12\nSÚPLICA DEL JUSTO QUE CONFÍA EN EL SEÑOR\nEl Dios de la esperanza os colme de todo gozo (Rom 15, 13).\n\n¿Hasta cuándo, Señor, seguirás olvidándome?\n¿Hasta cuándo me esconderás tu rostro?\n¿Hasta cuándo he de estar preocupado,\ncon el corazón apenado todo el día?\n¿Hasta cuándo va a triunfar mi enemigo?\n \nAtiende y respóndeme, Señor, Dios mío;\nda luz a mis ojos\npara que no me duerma en la muerte,\npara que no diga mi enemigo: \"le he podido\",\nni se alegre mi adversario de mi fracaso.\n \nPorque yo confío en tu misericordia:\nalegra mi corazón con tu auxilio,\ny cantaré al Señor por el bien que me ha hecho.\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 13\nCORRUPCIÓN Y NECEDAD DEL IMPÍO\nDonde abundó el pecado sobreabundó la gracia (Rom 5, 20).\n\nDice el necio para sí:\n\"No hay Dios\".\nSe han corrompido cometiendo execraciones,\nno hay quien obre bien.\n \nEl Señor observa desde el cielo\na los hijos de Adán,\npara ver si hay alguno sensato\nque busque a Dios.\n \nTodos se extravían\nigualmente obstinados,\nno hay uno que obre bien,\nni uno solo.\n \nPero ¿no aprenderán los malhechores,\nque devoran a mi pueblo como pan\ny no invocan al Señor?\n \nPues temblarán de espanto,\nporque Dios está con los justos.\nPodéis burlaros de los planes del desvalido,\npero el Señor es su refugio.\n \n¡Ojalá venga desde Sión\nla salvación de Israel!\nCuando el Señor cambie la suerte de su pueblo,\nse alegrará Jacob y gozará Israel.\n\nAnt. Aleluya, aleluya, aleluya.\n\nTERCIA\n\nLECTURA BREVE Cf. Hch 4, 11-12\n\nJesús es la piedra que desecharon los arquitectos, y que se ha convertido en piedra angular: ningún otro puede salvar; bajo el cielo, no se nos ha dado otro nombre que pueda salvarnos.\n\nV. Verdaderamente ha resucitado el Señor. Aleluya.\nR. Y se ha aparecido a Simón. Aleluya.\n\nORACIÓN \n\nSeñor, tú que por la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nSEXTA\n\nLECTURA BREVE Cf. 1 Pe 3, 21-22a\n\nA vosotros actualmente os salva el bautismo: que no consiste en limpiar una suciedad corporal, sino en impetrar de Dios una conciencia pura, por la resurrección de Jesucristo, que está a la derecha de Dios.\n\nV. Los discípulos se llenaron de alegría. Aleluya.\nR. Al ver al Señor. Aleluya.\n\nORACIÓN \n\nSeñor, tú que por la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nNONA\n\nLECTURA BREVE Col 3, 1-2\n\nYa que habéis resucitado con Cristo, buscad los bienes de allá arriba, donde está Cristo, sentado a la derecha de Dios; aspirad a los bienes de arriba, no a los de la tierra.\nV. Quédate con nosotros, Señor. Aleluya.\nR. Porque ya es tarde. Aleluya.\n\nORACIÓN \n\nSeñor, tú que por la resurrección de Jesucristo nos has engendrado de nuevo para que renaciéramos a una vida eterna, fortifica la fe de tu pueblo y afianza su esperanza, a fin de que nunca dudemos que llegará a realizarse lo que nos tienes prometido. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya.\nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        }
      ]
    },
    {
      'date': '2024-05-01',
      'info': [
        {
          'title': 'Completas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Alaluya.\n\nEXAMEN DE CONCIENCIA\n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.\n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:\n\nI\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.  \n\nII\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.\n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén. Aleluya.\n\nHIMNO\n\nTras las cimas más altas, \ntodas las noches\nmi corazón te sueña,\nno te conoce.\n\n¿Entre qué manos, dime,\nduerme la noche,\nla música en la brisa, \nmi amor en dónde?\n\n¿La infancia de mis ojos\ny el leve roce\nde la sangre en mis venas,\nSeñor, en dónde?\n\nLo mismo que las nubes,\ny más veloces,\n¿las horas de mi infancia,\nSeñor, en dónde?\n\nTras las cimas más altas,\ntodas las noches\nmi corazón te sueña,\nno te conoce.\n\nGloria al Padre, y al Hijo,\ny al Espíritu Santo. Amén.\n\nSALMODIA\n\nAnt. 1. Aleluya, aleluya, aleluya.\n\nSalmo 30, 2-6\nSÚPLICA CONFIADA Y ACCIÓN DE GRACIAS\nPadre en tus manos encomiendo mi espíritu (Lc 23, 46).\n\nA ti, Señor, me acojo:\nno quede yo nunca defraudado;\ntú, que eres justo, ponme a salvo,\ninclina tu oído hacia mí;\n \nven aprisa a librarme,\nsé la roca de mi refugio,\nun baluarte donde me salve,\ntú que eres mi roca y mi baluarte;\n \npor tu nombre dirígeme y guíame:\nsácame de la red que me han tendido,\nporque tú eres mi amparo.\n \nA tus manos encomiendo mi espíritu:\nTú, el Dios leal, me librarás\n\nAnt. Aleluya, aleluya, aleluya.\n\nAnt. 2. Aleluya, aleluya, aleluya.\n\nSalmo 129\nDESDE LO HONDO A TI GRITO, SEÑOR\nÉl salvará a su pueblo de los pecados (Mt 1, 21).\n\nDesde lo hondo a ti grito, Señor;\nSeñor, escucha mi voz;\nestén tus oídos atentos\na la voz de mi súplica.\n \nSi llevas cuenta de los delitos, Señor,\n¿quién podrá resistir?\nPero de ti procede el perdón,\ny así infundes respeto.\n \nMi alma espera en el Señor,\nespera en su palabra;\nmi alma aguarda al Señor,\nmás que el centinela la aurora.\n \nAguarde Israel al Señor,\ncomo el centinela la aurora;\nporque del Señor viene la misericordia,\nla redención copiosa;\ny él redimirá a Israel\nde todos sus delitos.\n\nAnt. Aleluya, aleluya, aleluya.\n\nLECTURA BREVE Ef 4, 26-27\n\nNo lleguéis a pecar; que la puesta del sol no os sorprenda en vuestro enojo. No dejéis resquicio al diablo.\n\nRESPONSORIO BREVE\n\nV. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz.  Aleluya.\n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL\n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nORACIÓN\n\nSeñor Jesucristo, que eres manso y humilde de corazón y ofreces a los que vienen a ti un yugo llevadero y una carga ligera; dígnate, pues, aceptar los deseos y las acciones del día que hemos terminado: que podamos descansar durante la noche para que así, renovado nuestro cuerpo y nuestro espíritu, perseveremos constantes en tu servicio. Tú que vives y reinas por los siglos de los siglos.\n\nCONCLUSIÓN\nBendición\n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén.\n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN\n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate Virgen María, aleluya.\nPorque ha resucitado verdaderamente el Señor, aleluya. ',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description':
              'V. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nINVITATORIO\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya.\n\nHIMNO\n\nOfrezcan los cristianos\nofrendas de alabanza\na gloria de la Víctima\npropicia de la Pascua.\n \nCordero sin pecado\nque a las ovejas salva,\na Dios y a los culpables\nunió con nueva alianza.\n \nLucharon vida y muerte\nen singular batalla\ny, muerto el que es la Vida,\ntriunfante se levanta.\n \n¿Qué has visto de camino,\n María, en la mañana?\nA mi Señor glorioso,\nla tumba abandonada,\nlos ángeles testigos,\nsudarios y mortaja.\n \n¡Resucitó de veras\nmi amor y mi esperanza!\n \nVenid a Galilea,\nallí el Señor aguarda;\nallí veréis los suyos\nla gloria de la Pascua.\n \nPrimicia de los muertos,\nsabemos por tu gracia\nque estás resucitado;\nla muerte en ti no manda.\n \nRey vencedor, apiádate\nde la miseria humana\ny da a tus fieles parte\nen tu victoria santa.\n\nSALMODIA\n\nAnt. 1. En ti, Señor, está la fuente viva. Aleluya.\n\nSalmo 35\nDEPRAVACIÓN DEL MALVADO Y BONDAD DE DIOS\nEl que me sigue no camina en tinieblas, sino que tendrá la luz de la vida (Jn 8, 12). \n\nEl malvado escucha en su interior\nun oráculo del pecado:\n«No tengo miedo a Dios,\nni en su presencia.»\nPorque se hace la ilusión de que su culpa\nno será descubierta ni aborrecida.\n \nLas palabras de su boca son maldad y traición,\nrenuncia a ser sensato y a obrar bien;\nacostado medita el crimen,\nse obstina en el mal camino,\nno rechaza la maldad.\n \nSeñor, tu misericordia llega al cielo,\ntu fidelidad hasta las nubes,\ntu justicia hasta las altas cordilleras;\ntus sentencias son como el océano inmenso.\n \nTú socorres a hombres y animales;\n¡qué inapreciable es tu misericordia, oh Dios!;\nlos humanos se acogen a la sombra de tus alas;\n \nse nutren de lo sabroso de tu casa,\nles das a beber del torrente de tus delicias,\nporque en ti está la fuente viva\ny tu luz nos hace ver la luz.\n \nProlonga tu misericordia con los que te reconocen,\ntu justicia con los rectos de corazón;\nque no me pisotee el pie del soberbio,\nque no me eche fuera la mano del malvado.\n \nHan fracasado los malhechores;\nderribados, no se pueden levantar.\n\nAnt. En ti, Señor, está la fuente viva. Aleluya.\n\nAnt. 2.  Enviaste tu Espíritu, Señor, y existió la creación. Aleluya.\n\nCántico Jdt 16, 2.3. 15-19\nHIMNO A DIOS, CREADOR DEL MUNDO Y PROTECTOR DE SU PUEBLO\nCantaban un cántico nuevo (Ap 5,9).\n\n¡Alabad a mi Dios con tambores,\nelevad cantos al Señor con cítaras,\nofrecedle los acordes de un salmo de alabanza,\nensalzad e invocad su nombre!\nPorque el Señor es un Dios quebrantador de guerras,\nsu nombre es el Señor.\n \nCantaré a mi Dios un cántico nuevo:\nSeñor, tú eres grande y glorioso,\nadmirable en tu fuerza, invencible.\n \nQue te sirva toda la creación,\nporque tú lo mandaste y existió;\nenviaste tu aliento y la construiste,\nnada puede resistir a tu voz.\n \nSacudirán las olas los cimientos de los montes\nlas peñas en tu presencia se derretirán como cera,\npero tú serás propicio a tus fieles.\n\nAnt. Enviaste tu Espíritu, Señor, y existió la creación. Aleluya.\n\nAnt. 3. Dios es el Rey del mundo: tocad con maestría. Aleluya.\n\nSalmo 46\nENTRONIZACIÓN DEL DIOS DE ISRAEL\n\nEstá sentado a la derecha del Padre y su reino no tendrá fin.\nPueblos todos, batid palmas,\naclamad a Dios con gritos de júbilo;\nporque el Señor es sublime y terrible,\nemperador de toda la tierra.\n \nÉl nos somete los pueblos\ny nos sojuzga las naciones;\nél nos escogió por heredad suya:\ngloria de Jacob, su amado.\n \nDios asciende entre aclamaciones;\nel Señor, al son de trompetas:\ntocad para Dios, tocad,\ntocad para nuestro Rey, tocad.\n \nPorque Dios es el rey del mundo:\ntocad con maestría.\nDios reina sobre las naciones\nDios se sienta en su trono sagrado.\n \nLos príncipes de los gentiles se reúnen\ncon el pueblo del Dios de Abraham;\nporque de Dios son los grandes de la tierra,\ny él es excelso.\n\nAnt. Dios es el Rey del mundo: tocad con maestría. Aleluya.\n\nLECTURA BREVE Rm 6, 8-11\n\nSi hemos muerto con Cristo, creemos que también viviremos con él; pues sabemos que Cristo, una vez resucitado de entre los muertos, ya no muere más; la muerte ya no tiene dominio sobre él. Porque su morir fue un morir al pecado de una vez para siempre; y su vivir es un vivir para Dios. Lo mismo vosotros consideraos muertos al pecado y vivos para Dios en Cristo Jesús.\n\nRESPONSORIO BREVE\n\nV. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\nR. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\nV. El que por nosotros colgó del madero.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. El Señor ha resucitado del sepulcro. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Yo soy la verdadera vid, aleluya; vosotros, mis sarmientos. Aleluya.\n\nBENEDICTUS Lc 1, 68-79\nEL MESÍAS Y SU PRECURSOR\n\nBendito sea el Señor, Dios de Israel,\nporque ha visitado y redimido a su pueblo,\nsuscitándonos una fuerza de salvación\nen la casa de David, su siervo,\nsegún lo había predicho desde antiguo,\npor boca de sus santos profetas.\n \nEs la salvación que nos libra de nuestros enemigos\ny de la mano de todos los que nos odian;\nrealizando la misericordia\nque tuvo con nuestros padres,\nrecordando su santa alianza\ny el juramento que juró a nuestro padre Abrahán.\n \nPara concedernos que, libres de temor,\narrancados de la mano de los enemigos,\nle sirvamos con santidad y justicia,\nen su presencia, todos nuestros días.\n \nY a ti, niño, te llamarán profeta del Altísimo,\nporque irás delante del Señor\na preparar sus caminos,\nanunciando a su pueblo la salvación,\nel perdón de sus pecados.\n \nPor la entrañable misericordia de nuestro Dios,\nnos visitará el sol que nace de lo alto,\npara iluminar a los que viven en tinieblas\ny en sombra de muerte,\npara guiar nuestros pasos\npor el camino de la paz.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Yo soy la verdadera vid, aleluya; vosotros, mis sarmientos. Aleluya.\n\nPRECES\n\nOremos a Cristo, que fue entregado por nuestros pecados y resucitado para nuestra justificación, y aclamémosle, diciendo:\n\nPor tu victoria, sálvanos, Señor.\n\nSalvador nuestro, Señor Jesús, que con tu victoria sobre la muerte nos has alegrado y con tu resurrección nos has exaltado y nos has enriquecido,\n— ilumina hoy nuestras mentes y santifica nuestra jornada con la gracia de tu Espíritu Santo.\n\nTú que en el cielo eres glorificado por los ángeles y en la tierra eres adorado por los hombres,\n— recibe la adoración que en espíritu y verdad te tributamos en esta fiesta de tu resurrección.\n\nSálvanos, Señor Jesús, muestra tu amor y tu misericordia al pueblo que confía en tu resurrección\n— y, compadecido de nosotros, defiéndenos hoy de todo mal.\n\nRey de la gloria y vida nuestra, haz que, cuando aparezcas,\n— podamos aparecer también nosotros, juntamente contigo, en gloria.\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN \n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre y al Hijo y al Espíritu Santo\ncomo era en el principio, ahora y siempre\ny por los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nNuestra Pascua inmolada, aleluya,\nes Cristo el Señor, aleluya, aleluya.\n \nPascua sagrada, ¡oh fiesta universal!,\nel mundo renovado\ncanta un himno a su Señor.\n \nPascua sagrada, ¡victoria de la cruz!\nLa muerte, derrotada,\nha perdido su aguijón.\n \nPascua sagrada,\n¡oh noche bautismal!\n \nDel seno de las aguas\nrenacemos al Señor.\n \nPascua sagrada, ¡eterna novedad!\nDejad al hombre viejo,\nrevestíos del Señor.\n \nPascua sagrada. La sala del festín\nse llena de invitados\nque celebran al Señor.\n \nPascua sagrada, ¡Cantemos al Señor!\nVivamos la alegría\ndada a luz en el dolor.\n\nSALMODIA\n\nAnt. 1. La diestra del Señor lo exaltó haciéndolo jefe y salvador. Aleluya.\n\nSalmo 26\nCONFIANZA ANTE EL PELIGRO\nSi Dios está con nosotros, ¿quién estará contra nosotros?, ¿quién podrá apartarnos del amor de Cristo? (Rm 8, 31. 35).\nI\n\nEl Señor es mi luz y mi salvación,\n¿a quién temeré?\n† El Señor es la defensa de mi vida,\n¿quién me hará temblar?\n \nCuando me asaltan los malvados\npara devorar mi carne,\nellos, enemigos y adversarios,\ntropiezan y caen.\n \nSi un ejército acampa contra mí,\nmi corazón no tiembla;\nsi me declaran la guerra,\nme siento tranquilo.\n \nUna cosa pido al Señor,\neso buscaré:\nhabitar en la casa del Señor\npor los días de mi vida;\ngozar de la dulzura del Señor\ncontemplando su templo.\n \nÉl me protegerá en su tienda\nel día del peligro;\nme esconderá en lo escondido de su morada,\nme alzará sobre la roca;\n \ny así levantaré la cabeza\nsobre el enemigo que me cerca;\nen su tienda sacrificaré\nsacrificios de aclamación:\ncantaré y tocaré para el Señor.\n\nAnt. La diestra del Señor lo exaltó haciéndolo jefe y salvador. Aleluya.\n\nAnt. 2. Espero gozar de la dicha del Señor en el país de la vida. Aleluya.\n\nII\n\nAlgunos, poniéndose de pie, daban testimonio contra Jesús (Mc 14, 57).\n\nEscúchame, Señor, que te llamo;\nten piedad, respóndeme.\n \nOigo en mi corazón: «Buscad mi rostro.»\nTu rostro buscaré, Señor,\nno me escondas tu rostro.\n \nNo rechaces con ira a tu siervo,\nque tú eres mi auxilio;\nno me deseches, no me abandones,\nDios de mi salvación.\n \nSi mi padre y mi madre me abandonan,\nel Señor me recogerá.\n \nSeñor, enséñame tu camino,\nguíame por la senda llana,\nporque tengo enemigos.\n \nNo me entregues a la saña de mi adversario,\nporque se levantan contra mí testigos falsos,\nque respiran violencia.\n \nEspero gozar de la dicha del Señor\nen el país de la vida.\n \nEspera en el Señor, sé valiente,\nten ánimo, espera en el Señor.\n\nAnt. Espero gozar de la dicha del Señor en el país de la vida. Aleluya.\n\nAnt. 3. Él es el origen, guía y meta del universo. A él la gloria por los siglos. Aleluya.\n\nCántico Col 1, 12-20\nHIMNO A CRISTO, PRIMOGÉNITO DE TODA CRIATURA Y PRIMER RESUCITADO DE ENTRE LOS MUERTOS\n\nDamos gracias a Dios Padre,\nque nos ha hecho capaces de compartir\nla herencia del pueblo santo en la luz.\n \nÉl nos ha sacado del dominio de las tinieblas,\ny nos ha trasladado al reino de su Hijo querido,\npor cuya sangre hemos recibido la redención,\nel perdón de los pecados.\n \nÉl es imagen de Dios invisible,\nprimogénito de toda criatura;\npues por medio de él fueron creadas todas las cosas:\ncelestes y terrestres, visibles e invisibles,\nTronos, Dominaciones, Principados, Potestades;\ntodo fue creado por él y para él.\n \nÉl es anterior a todo, y todo se mantiene en él.\nÉl es también la cabeza del cuerpo de la Iglesia.\nÉl es el principio, el primogénito de entre los muertos,\ny así es el primero en todo.\n \nPorque en él quiso Dios que residiera toda plenitud.\nY por él quiso reconciliar consigo todos los seres:\nlos del cielo y los de la tierra,\nhaciendo la paz por la sangre de su cruz.\n\nAnt. Él es el origen, guía y meta del universo. A él la gloria por los siglos. Aleluya.\n\nLECTURA BREVE Hb 7, 24-27\n\nJesús, como permanece para siempre, tiene el sacerdocio que no pasa. De ahí que puede salvar definitivamente a los que por medio de él se acercan a Dios, porque vive siempre para interceder en su favor. Y tal convenía que fuese nuestro sumo sacerdote: santo, inocente, sin mancha, separado de los pecadores y encumbrado sobre el cielo. Él no necesita ofrecer sacrificios cada día –como los sumos sacerdotes, que ofrecían primero por los propios pecados, después por los del pueblo-, porque lo hizo de una vez para siempre, ofreciéndose a sí mismo.\n\nRESPONSORIO BREVE\n\nV. Los discípulos se llenaron de alegría. Aleluya, aleluya.\nR. Los discípulos se llenaron de alegría. Aleluya, aleluya.\nV. Al ver al Señor.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Los discípulos se llenaron de alegría. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Si permanecéis en mí y mis palabras permanecen en vosotros, pediréis lo que deseéis, y se realizará. Aleluya.\n\nMAGNÍFICAT Lc 1, 46-55\nALEGRÍA DEL ALMA EN EL SEÑOR\n\nProclama mi alma la grandeza del Señor,\nse alegra mi espíritu en Dios mi salvador;\nporque ha mirado la humillación de su esclava.\n \nDesde ahora me felicitarán todas las generaciones,\nporque el Poderoso ha hecho obras grandes por mí:\nsu nombre es santo\ny su misericordia llega a sus fieles\nde generación en generación.\n \nÉl hace proezas con su brazo:\ndispersa a los soberbios de corazón,\nderriba del trono a los poderosos\ny enaltece a los humildes,\na los hambrientos los colma de bienes\ny a los ricos los despide vacíos.\n \nAuxilia a Israel, su siervo,\nacordándose de su misericordia\n—como lo había prometido a nuestros padres—\nen favor de Abraham y su descendencia por siempre.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Si permanecéis en mí y mis palabras permanecen en vosotros, pediréis lo que deseéis, y se realizará. Aleluya.\n\nPRECES\n\nOremos a Cristo, que resucitó de entre los muertos y está sentado a la derecha del Padre y digámosle:\n\nOh Cristo, siempre vivo para interceder por los hombres, escucha nuestra oración.\n\nAcuérdate, Señor, de los que se han consagrado al ministerio pastoral;\n— que sean para tu pueblo ejemplo de santidad.\n\nConcede, Señor, el espíritu de justicia y de paz a los que gobiernan las naciones\n— y haz que trabajen para que todos podamos vivir según tu ley.\n\nConcede paz a nuestros días\n— y multiplica las bienes de la tierra, para que los pobres puedan gozar de las riquezas de tu bondad.\n\nOh Cristo, que con tu triunfo has iluminado el mundo entero y has llamado a la vida a toda la creación, que estaba sometida a la frustración,\n— concede la luz eterna a nuestros hermanos difuntos.\n\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description':
              'V. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nINVITATORIO\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nSalmo 66\nQUE TODOS LOS PUEBLOS ALABEN AL SEÑOR\nSabed que esta salvación de Dios, ha sido enviada a los gentiles (Hch 28, 28).\n\nEl Señor tenga piedad y nos bendiga,\nilumine su rostro sobre nosotros;\nconozca la tierra tus caminos,\ntodos los pueblos tu salvación.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nQue canten de alegría las naciones,\nporque riges el mundo con justicia,\nriges los pueblos con rectitud\ny gobiernas las naciones de la tierra.\n\n¡Oh Dios!, que te alaben los pueblos,\nque todos los pueblos te alaben.\n\nLa tierra ha dado su fruto,\nnos bendice el Señor, nuestro Dios.\nQue Dios nos bendiga; que le teman\nhasta los confines del orbe.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Verdaderamente ha resucitado el Señor. Aleluya. \n\nHIMNO\n\n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya!\n \nMuerte y Vida lucharon,\ny la muerte fue vencida.\n¡Aleluya, aleluya!\n \nEs el grano que muere\npara el triunfo de la espiga.\n¡Aleluya, aleluya!\n \nCristo es nuestra esperanza\nnuestra paz y nuestra vida.\n¡Aleluya, aleluya!\n \nVivamos vida nueva,\nel bautismo es nuestra Pascua.\n¡Aleluya, aleluya!\n \n¡Cristo ha resucitado!\n¡Resucitemos con él!\n¡Aleluya, aleluya! Amén.\n\nSALMODIA\n\nAnt. 1. Yo te amo, Señor; tú eres mi fortaleza. Aleluya.\n\nSalmo 17, 2-30\nACCIÓN DE GRACIAS DESPUÉS DE LA VICTORIA\nEn aquella hora ocurrió un violento terremoto (Ap 11, 13).\nI\n\nYo te amo, Señor; tú eres mi fortaleza;\nSeñor, mi roca, mi alcázar, mi libertador.\nDios mío, peña mía, refugio mío, escudo mío,\nmi fuerza salvadora, mi baluarte.\nInvoco al Señor de mi alabanza\ny quedo libre de mis enemigos.\n \nMe cercaban olas mortales,\ntorrentes destructores me aterraban,\nme envolvían las redes del abismo,\nme alcanzaban los lazos de la muerte.\n \nEn el peligro invoqué al Señor,\ngrité a mi Dios:\ndesde su templo él escuchó mi voz,\ny mi grito llegó a sus oídos.\n\nAnt. Yo te amo, Señor; tú eres mi fortaleza. Aleluya.\n\nAnt. 2. El Señor me libró porque me amaba. Aleluya.\n\nII\n\nEntonces tembló y retembló la tierra,\nvacilaron los cimientos de los montes,\nsacudidos por su cólera;\nde su nariz se alzaba una humareda,\nde su boca un fuego voraz.\ny lanzaba carbones ardiendo.\n \nInclinó el cielo y bajó\ncon nubarrones debajo de sus pies;\nvolaba a caballo de un querubín\ncerniéndose sobre las alas del viento,\nenvuelto en un manto de oscuridad;\n \ncomo un toldo, lo rodeaban\noscuro aguacero y nubes espesas;\nal fulgor de su presencia, las nubes\nse deshicieron en granizo y centellas;\n \ny el Señor tronaba desde el cielo,\nel Altísimo hacía oír su voz:\ndisparando sus saetas, los dispersaba,\ny sus continuos relámpagos los enloquecían.\n \nEl fondo del mar apareció,\ny se vieron los cimientos del orbe,\ncuando tú, Señor, lanzaste un bramido,\ncon tu nariz resoplando de cólera.\n \nDesde el cielo alargó la mano y me agarró,\nme sacó de las aguas caudalosas,\nme libró de un enemigo poderoso,\nde adversarios más fuertes que yo.\n \nMe acosaban el día funesto,\npero el Señor fue mi apoyo:\nme sacó a un lugar espacioso,\nme libró porque me amaba.\n\nAnt. El Señor me libró porque me amaba. Aleluya.\n\nAnt. 3. Señor, tú eres mi lámpara, tú alumbras mis tinieblas. Aleluya.\n\nIII\n\nEl Señor retribuyó mi justicia,\nretribuyó la pureza de mis manos,\nporque seguí los caminos del Señor\ny no me rebelé contra mi Dios;\nporque tuve presentes sus mandamientos\ny no me aparté de sus preceptos;\n \nle fui enteramente fiel,\nguardándome de toda culpa;\nel Señor retribuyó mi justicia,\nla pureza de mis manos en su presencia.\n \nCon el fiel, tú eres fiel;\ncon el íntegro, tú eres íntegro;\ncon el sincero, tú eres sincero;\ncon el astuto, tú eres sagaz.\nTú salvas al pueblo afligido\ny humillas los ojos soberbios.\n \nSeñor, tú eres mi lámpara;\nDios mío, tú alumbras mis tinieblas.\nFiado en ti, me meto en la refriega,\nfiado en mi Dios, asalto la muralla.\n\nAnt. Señor, tú eres mi lámpara, tú alumbras mis tinieblas. Aleluya.\n\nVERSÍCULO\n\nV. Dios resucitó a Cristo de entre los muertos. Aleluya.\nR. Para que nuestra fe y esperanza se centren en Dios. Aleluya.\n\nPRIMERA LECTURA\n\nAño I:\n\nDel libro del Apocalipsis 21, 1-8\nLA NUEVA JERUSALÉN\n\nYo, Juan, vi un cielo nuevo y una tierra nueva. El primer cielo y la primera tierra habían desaparecido y el mar no existía ya. Y vi la ciudad santa, la nueva Jerusalén, que descendía del cielo, enviada por Dios, arreglada como una novia que se adorna para su esposo. Y escuché una voz potente que decía desde el trono:\n«Ésta es la morada de Dios con los hombres, y acampará entre ellos. Ellos serán su pueblo y Dios estará con ellos. Les enjugará Dios toda lágrima de sus ojos y no habrá ya muerte ni desdichas, ni lamentos ni aflicciones, pues el primer mundo habrá desaparecido.»\nY dijo el que estaba sentado en el trono:\n«Mirad que voy a renovar todas las cosas.»\nY añadió:\n«Escribe, porque éstas son palabras fidedignas y verdaderas.»\nY dijo:\n«Ya está hecho. Yo soy el alfa y la omega, el principio y el fin. Al que tenga sed le daré gratuitamente de la fuente del agua de la vida. El que venza poseerá en herencia estos bienes. Yo seré su Dios y él será mi hijo. Los cobardes, los incrédulos, los manchados con abominaciones, los asesinos, los impuros, los hechiceros, los idólatras y todos los embusteros tendrán su parte en el lago que arde en fuego y azufre, que es la muerte segunda.»\n\nRESPONSORIO Ap 21, 3. 4\n\nV. Ésta es la morada de Dios con los hombres, y acampará entre ellos. \nR. Y les enjugará Dios toda lágrima de sus ojos. Aleluya.\nV. No habrá ya muerte ni desdichas, ni lamentos ni aflicciones, pues el primer mundo habrá desaparecido.\nR. Y les enjugará Dios toda lágrima de sus ojos. Aleluya.\n\nAño II:\n\nDe los Hechos de los apóstoles 18, 1-28\nFUNDACIÓN DE LA IGLESIA DE CORINTO\n\nEn aquellos días, salió Pablo de Atenas y vino a Corinto. Allí se encontró con un judío del Ponto, llamado Áquila, y con su mujer Priscila, recientemente venidos de Italia, por haber mandado Claudio que saliesen de Roma todos los judíos. Pablo trabó amistad con ellos y, como tenía el mismo oficio, se quedó a vivir en casa de ellos, trabajando en su compañía. Eran fabricantes de lona. Cada sábado discutía en la sinagoga, tratando de convencer a judíos y griegos. Cuando Silas y Timoteo llegaron de Macedonia, Pablo se entregó por entero a la predicación del Evangelio, afirmando claramente ante los judíos que Jesús era el Mesías. Pero, ante su oposición y sus palabras injuriosas, Pablo sacudió sus vestidos y les dijo: «Caiga vuestra sangre sobre vuestra cabeza; yo no tengo la culpa. De aquí en adelante, me dirigiré a los gentiles.»\nCon esto, salió de allí y se fue a casa de un prosélito, llamado Ticio Justo, que vivía al lado de la sinagoga. Crispo, el jefe de la sinagoga, creyó en el Señor, con toda su familia; y muchos corintios, después de escuchar la predicación de Pablo, abrazaban la fe y se hacían bautizar. Una noche, en una visión, el Señor dijo a Pablo: «No temas. Habla y no calles; que yo estoy contigo y nadie osará hacerte daño. Sabe que tengo en esta ciudad muchísima gente que me pertenece.»\nSe detuvo allí un año y seis meses, enseñando la palabra de Dios. Siendo Galión procónsul de Acaya, se levantaron a una los judíos contra Pablo y lo llevaron ante el tribunal, diciendo: «Este hombre incita a la gente a dar a Dios un culto contrario a la ley.»\nYa estaba Pablo para hablar, cuando Galión, dirigiéndose a los judíos, les habló así: «Si se tratase de una injusticia o de un grave delito, os escucharía, como es lógico. Pero tratándose, como se trata, de discusiones sobre palabras, sobre nombres y sobre vuestra ley, allá vosotros. Yo no quiero ser juez en tales asuntos.»\nY los despachó del tribunal. Por lo que todos se arrojaron sobre Sóstenes, el jefe de la sinagoga, y comenzaron a golpearlo delante del tribunal, sin que Galión se preocupase lo más mínimo. Pablo, después de haber permanecido todavía muchos días, se despidió de los hermanos y, junto con Priscila y Áquila, se embarcó para Siria; antes, se había hecho rapar la cabeza en Cencreas, pues tenía hecho voto de nazareato. Desembarcaron en Éfeso, y Pablo, dejando allí a sus compañeros, entró en la sinagoga para hablar con los judíos. Le rogaron que se quedase por más tiempo, pero él no accedió, sino que se despidió con estas palabras: «Si Dios quiere, volveré otra vez a veros.»\nY partió de Éfeso. Desembarcó en Cesarea, subió a saludar a la Iglesia de Jerusalén y bajó luego a Antioquia. Después de haberse detenido allí algún tiempo, salió a recorrer sucesivamente las regiones de Galacia y Frigia, fortaleciendo en la fe a todos los discípulos.\nEntretanto, un judío, llamado Apolo, natural de Alejandría, hombre elocuente y muy versado en las Escrituras, llegó a Éfeso. Había sido instruido en la doctrina del Señor y, con fervor de espíritu, hablaba y enseñaba rectamente todo lo referente a Jesús; pero sólo conocía el bautismo de Juan. Apolo, pues, comenzó a predicar resueltamente en la sinagoga. Priscila y Áquila, que lo escucharon, lo tomaron aparte y le expusieron con mayor exactitud la doctrina evangélica. Como quería él pasar a Acaya, lo animaron a ello los hermanos, y escribieron a los discípulos para que le dispensasen buena acogida. Su llegada fue muy provechosa para los fieles, por la gracia de Dios que poseía, porque refutaba vigorosamente en público a los judíos y les demostraba, por las Escrituras, que Jesús es el Mesías.\n\nRESPONSORIO Hch 18, 9-10a; Ex 4, 12\n\nV. En una visión, el Señor dijo a Pablo: «No temas. \nR. Habla y no calles; que yo estoy contigo.» Aleluya.\nV. Yo estaré en tu boca y te enseñaré lo que tienes que decir.\nR. Habla y no calles: que yo estoy contigo. Aleluya.\n\nSEGUNDA LECTURA\n\nDe la carta a Diogneto\n(Caps. 5-6: Funk 1, 397-401)\nLOS CRISTIANOS EN EL MUNDO\n\nLos cristianos no se distinguen de los demás hombres, ni por el lugar en que viven, ni por su lenguaje, ni por su modo de vida. Ellos, en efecto, no tienen ciudades propias, ni utilizan un hablar insólito, ni llevan un género de vida distinto. Su sistema doctrinal no ha sido inventado gracias al talento y especulación de hombres estudiosos, ni profesan, como otros, una enseñanza basada en autoridad de hombres.\nViven en ciudades griegas y bárbaras, según les cupo en suerte, siguen las costumbres de los habitantes del país, tanto en el vestir como en todo su estilo de vida y, sin embargo, dan muestras de un tenor de vida admirable y, a juicio de todos, increíble. Habitan en su propia patria, pero como forasteros; toman parte en todo como ciudadanos, pero lo soportan todo como extranjeros; toda tierra extraña es patria para ellos, pero están en toda patria como en tierra extraña. Igual que todos, se casan y engendran hijos, pero no se deshacen de los hijos que conciben. Tienen la mesa en común, pero no el lecho. Viven en la carne, pero no según la carne. Viven en la tierra, pero su ciudadanía está en el cielo. Obedecen las leyes establecidas, y con su modo de vivir superan estas leyes. Aman a todos, y todos los persiguen. Se los condena sin conocerlos. Se les da muerte, y con ello reciben la vida. Son pobres, y enriquecen a muchos; carecen de todo, y abundan en todo. Sufren la deshonra, y ello les sirve de gloria; sufren detrimento en su fama, y ello atestigua su justicia. Son maldecidos, y bendicen; son tratados con ignominia, y ellos, a cambio, devuelven honor: Hacen el bien, y son castigados como malhechores; y, al ser castigados a muerte, se alegran como si se les diera la vida. Los judíos los combaten como a extraños, y los gentiles los persiguen, y, sin embargo, los mismos que los aborrecen no saben explicar el motivo de su enemistad.\nPara decirlo en pocas palabras: los cristianos son en el mundo lo que el alma es en el cuerpo. El alma, en efecto, se halla esparcida por todos los miembros del cuerpo; así también los cristianos se encuentran dispersos por todas las ciudades del mundo. El alma habita en el cuerpo, pero no procede del cuerpo; los cristianos viven en el mundo, pero no son del mundo. El alma invisible está encerrada en la cárcel del cuerpo visible; los cristianos viven visiblemente en el mundo, pero su religión es invisible. La carne aborrece y combate al alma, sin haber recibido de ella agravio alguno, sólo porque le impide disfrutar de los placeres; también el mundo aborrece a los cristianos, sin haber recibido agravio de ellos, porque se oponen a sus placeres. El alma ama al cuerpo y a sus miembros, a pesar de que éste la aborrece; también los cristianos aman a los que los odian. El alma está encerrada en el cuerpo, pero es ella la que mantiene unido el cuerpo; también los cristianos se hallan retenidos en el mundo como en una cárcel, pero ellos son los que mantienen la trabazón del mundo. El alma inmortal habita en una tienda mortal; también los cristianos viven como peregrinos en moradas corruptibles, mientras esperan la incorrupción celestial. El alma se perfecciona con la mortificación en el comer y beber; también los cristianos, constantemente mortificados, se multiplican más y más. Tan importante es el puesto que Dios les ha asignado, del que no les es lícito desertar.\n\nRESPONSORIO Jn 8, 12; Sir 24, 25\n\nV. Yo soy la luz del mundo.\nR. El que me sigue no camina en tinieblas, sino que tendrá la luz de la vida. Aleluya.\nV. En mí está toda gracia de camino y de verdad, en mí toda esperanza de vida y de fuerza.\nR. El que me sigue no camina en tinieblas, sino que tendrá la luz de la vida. Aleluya.\n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya. \nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description':
              'V. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nPastor, que con tus silbos amorosos\nme despertaste del profundo sueño,\ntú me hiciste cayado de este leño\nen que tiendes los brazos poderosos.\n \nVuelve los ojos a mi fe piadosos,\npues te confieso por mi amor y dueño,\ny la palabra de seguir empeño\ntus dulces silbos y tus pies hermosos.\n \nOye, Pastor, que por amores mueres,\nno te espante el rigor de mis pecados,\npues tan amigo de rendidos eres.\n \nEspera, pues, y escucha mis cuidados.\nPero ¿cómo te digo que me esperes,\nsi estás, para esperar, los pies clavados? Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 118, 9-16\nII (Beth)\n\n¿Cómo podrá un joven andar honestamente?\nCumpliendo tus palabras.\n \nTe busco de todo corazón,\nno consientas que me desvíe de tus mandamientos.\nEn mi corazón escondo tus consignas,\nasí no pecaré contra ti.\n \nBendito eres, Señor,\nenséñame tus leyes.\nMis labios van enumerando\nlos mandamientos de tu boca;\nmi alegría es el camino de tus preceptos,\nmás que todas las riquezas.\n \nMedito tus decretos,\ny me fijo en tus sendas;\ntu voluntad es mi delicia,\nno olvidaré tus palabras.\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 16\nDIOS, ESPERANZA DEL INOCENTE PERSEGUIDO\nEn los días de su vida mortal presentó oraciones y súplicas y fue escuchado (Heb 5,7).\nI\n\nSeñor, escucha mi apelación\natiende a mis clamores,\npresta oído a mi súplica,\nque en mis labios no hay engaño:\nemane de ti la sentencia,\nmiren tus ojos la rectitud.\n \nAunque sondees mi corazón,\nvisitándolo de noche,\naunque me pruebes al fuego,\nno encontrarás malicia en mí.\n \nMi boca no ha faltado\ncomo suelen los hombres;\nsegún tus mandatos, yo me he mantenido\nen la senda establecida.\nMis pies estuvieron firmes en tus caminos,\ny no vacilaron mis pasos.\n \nYo te invoco porque tú me respondes, Dios mío;\ninclina el oído y escucha mis palabras.\nMuestra las maravillas de tu misericordia,\ntú que salvas de los adversarios\na quien se refugia a tu derecha.\n \nGuárdame como a las niñas de tus ojos,\na la sombra de tus alas escóndeme\nde los malvados que me asaltan,\ndel enemigo mortal que me cerca.\n\nAnt. Aleluya, aleluya, aleluya.\n\nII\n\nHan cerrado sus entrañas\ny hablan con boca arrogante;\nya me rodean sus pasos,\nse hacen guiños para derribarme,\ncomo un león ávido de presa,\ncomo un cachorro agazapado en su escondrijo.\n \nLevántate, Señor, hazle frente, doblégalo,\nque tu espada me libre del malvado,\ny tu mano, Señor, de los mortales;\nmortales de este mundo:\nsea su lote esta vida;\nde tu despensa les llenarás el vientre,\nse saciarán sus hijos\ny dejarán a sus pequeños lo que sobra.\n \nPero yo con mi apelación vengo a tu presencia,\ny al despertar me saciaré de tu semblante.\n\nAnt. Aleluya, aleluya, aleluya.\n\nTERCIA\n\nLECTURA BREVE Cf. Rm 4, 24-25\n\nCreemos en el que resucitó de entre los muertos a nuestro Señor Jesús, que fue entregado por nuestros pecados y resucitado para nuestra justificación.\n\nV. Verdaderamente ha resucitado el Señor. Aleluya.\nR. Y se ha aparecido a Simón. Aleluya.\n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nSEXTA\n\nLECTURA BREVE 1 Jn 5, 5-6a\n\n¿Quién es el que vence al mundo, sino el que cree que Jesús es el Hijo de Dios? Éste es el que vino con agua y con sangre: Jesucristo. No sólo con agua, sino con agua y con sangre. \n\nV. Los discípulos se llenaron de alegría. Aleluya.\nR. Al ver al Señor. Aleluya.\n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nNONA\n\nLECTURA BREVE Cf. Ef 4, 23-24\n\nRenovaos en la mente y en el espíritu y vestíos de la nueva condición humana, creada a imagen de Dios: justicia y santidad verdaderas.\n\nV. Quédate con nosotros, Señor. Aleluya.\nR. Porque ya es tarde. Aleluya.\n\nORACIÓN \n\nOh Dios, que amas la inocencia y la devuelves a quienes la han perdido, atrae hacia ti el corazón de tus fieles, para que siempre vivan a la luz de tu verdad los que han sido liberados de las tinieblas del error. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya.\nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-02',
      'info': [
        {
          'title': 'Completas',
          'description': 'Completas \n\nV. Dios mío, ven en mi ayuda.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nEXAMEN DE CONCIENCIA\n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, reconozcamos humildemente nuestros pecados.\n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:\n\nI\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.\n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.  \n\nII\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.\n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.\n\nHIMNO\n\nComo el niño que no sabe dormirse\nsin cogerse a la mano de su madre, \nasí mi corazón viene a ponerse\nsobre tus manos al caer la tarde.\n\nComo el niño que sabe que alguien vela \nsu sueño de inocencia y esperanza,\nasí descansará mi alma segura, \nsabiendo que eres tú quien nos aguarda.\n\nTú endulzarás mi última amargura, \ntú aliviarás el último cansancio,\ntú cuidarás los sueños de la noche,\ntú borrarás las huellas de mi llanto.\n\nTú nos darás mañana nuevamente\nla antorcha de la luz y la alegría,\ny por las horas que te traigo muertas,\ntú me darás una mañana viva. Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 15\nEL SEÑOR ES EL LOTE DE MI HEREDAD\nDios resucitó a Jesús rompiendo las ataduras de la muerte (Hch 2, 24).\n\nProtégeme, Dios mío, que me refugio en ti;\nyo digo al Señor: «Tú eres mi bien.»\nLos dioses y señores de la tierra\nno me satisfacen.\n\nMultiplican las estatuas\nde dioses extraños;\nno derramaré sus libaciones con mis manos,\nni tomaré sus nombres en mis labios.\n\nEl Señor es el lote de mi heredad y mi copa;\nmi suerte está en tu mano:\nme ha tocado un lote hermoso,\nme encanta mi heredad.\n\nBendeciré al Señor, que me aconseja, \nhasta de noche me instruye internamente. \nTengo siempre presente al Señor,\ncon él a mi derecha no vacilaré.\n\nPor eso se me alegra el corazón,\nse gozan mis entrañas,\ny mi carne descansa serena.\nPorque no me entregarás a la muerte,\nni dejarás a tu fiel conocer la corrupción.\n\nMe enseñarás el sendero de la vida,\nme saciarás de gozo en tu presencia,\nde alegría perpetua a tu derecha.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Aleluya, aleluya, aleluya.\n\nLECTURA BREVE 1Ts 5, 23\n\nQue el mismo Dios de la paz os consagre totalmente, y que todo vuestro espíritu, alma y cuerpo, sea custodiado sin reproche hasta la venida de nuestro Señor Jesucristo.\n\nRESPONSORIO BREVE\n\nV. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL\n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nORACIÓN\n\nSeñor Dios nuestro, concédenos un descanso tranquilo que restaure nuestras fuerzas, desgastadas ahora por el trabajo del día; así, fortalecidos con tu ayuda, te serviremos siempre con todo nuestro cuerpo y nuestro espíritu. Por Jesucristo nuestro Señor.\n\nCONCLUSIÓN\n\nV. El Señor todopoderoso nos conceda una noche tranquila y una muerte santa.\nR. Amén.\n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN\n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate Virgen María, aleluya.\nPorque ha resucitado verdaderamente el Señor, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '\n\nV. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. \n\nAnt. Venid, adoremos a Cristo, Pastor supremo. \n\nSalmo 94\n\nVenid, aclamemos al Señor,\ndemos vítores a la Roca que nos salva;\nentremos a su presencia dándole gracias,\naclamándolo con cantos.\n\nPorque el Señor es un Dios grande,\nsoberano de todos los dioses:\ntiene en su mano las simas de la tierra,\nson suyas las cumbres de los montes.\nSuyo es el mar, porque él lo hizo,\nla tierra firme que modelaron sus manos.\n\nVenid, postrémonos por tierra,\nbendiciendo al Señor, creador nuestro.\nPorque él es nuestro Dios,\ny nosotros su pueblo,\nel rebaño que él guía.\n\nOjalá escuchéis hoy su voz:\n"No endurezcáis el corazón como en Meribá,\ncomo el día de Masá en el desierto:\ncuando vuestros padres me pusieron a prueba,\ny dudaron de mí, aunque habían visto mis obras."\n\nDurante cuarenta años\naquella generación me repugnó, y dije:\n"Es un pueblo de corazón extraviado,\nque no reconoce mi camino;\npor eso he jurado en mi cólera\nque no entrarán en mi descanso."\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. \n\nAnt. Venid, adoremos a Cristo, Pastor supremo. \n\nHIMNO\n\nCristo, Cabeza, Rey de los pastores,\nel pueblo entero, madrugando a fiesta,\ncanta a la gloria de tu sacerdote\nhimnos sagrados.\n \nCon abundancia de sagrado crisma,\nla unción profunda de tu Santo Espíritu\nlo armó guerrero y lo nombró en la Iglesia\njefe del pueblo.\n \nÉl fue pastor y forma del rebaño,\nluz para el ciego, báculo del pobre,\npadre común, presencia providente,\ntodo de todos.\n \nTú que coronas sus merecimientos,\ndanos la gracia de imitar su vida\ny al fin, sumisos a su magisterio,\ndanos su gloria. Amén.\n\nSALMODIA\n\nAnt. 1. Elévate sobre el cielo, Dios mío. Aleluya.\n\nSalmo 56\nORACIÓN MATUTINA DE UN AFLIGIDO\nEste salmo canta la pasión del Señor (S. Agustín).\n\nMisericordia, Dios mío, misericordia,\nque mi alma se refugia en ti;\nme refugio a la sombra de tus alas\nmientras pasa la calamidad.\n \nInvoco al Dios Altísimo,\nal Dios que hace tanto por mí:\ndesde el cielo me enviará la salvación,\nconfundirá a los que ansían matarme,\nenviará su gracia y su lealtad.\n \nEstoy echado entre leones\ndevoradores de hombres;\nsus dientes son lanzas y flechas,\nsu lengua es una espada afilada.\n \nElévate sobre el cielo, Dios mío,\ny llene la tierra tu gloria.\n \nHan tendido una red a mis pasos\npara que sucumbiera;\nme han cavado delante una fosa,\npero han caído en ella.\n \nMi corazón está firme, Dios mío,\nmi corazón está firme.\nVoy a cantar y a tocar:\ndespierta, gloria mía;\ndespertad, cítara y arpa;\ndespertaré a la aurora.\n \nTe daré gracias ante los pueblos, Señor;\ntocaré para ti ante las naciones:\npor tu bondad, que es más grande que los cielos;\npor tu fidelidad, que alcanza a las nubes.\n \nElévate sobre el cielo, Dios mío,\ny llene la tierra tu gloria.\n\nAnt. Elévate sobre el cielo, Dios mío. Aleluya.\n\nAnt. 2. El Señor redimió a su pueblo. Aleluya.\n\nCántico Jr 31, 10-14\nFELICIDAD DEL PUEBLO REDIMIDO\nJesús iba a morir... para reunir a los hijos de Dios dispersos (Jn 11, 51. 52).\n\nEscuchad, pueblos, la palabra del Señor,\nanunciadla en las islas remotas:\n«El que dispersó a Israel lo reunirá,\nlo guardará como un pastor a su rebaño;\nporque el Señor redimió a Jacob,\nlo rescató de una mano más fuerte.»\n \nVendrán con aclamaciones a la altura de Sión,\nafluirán hacia los bienes del Señor:\nhacia el trigo y el vino y el aceite,\ny los rebaños de ovejas y de vacas;\nsu alma será como un huerto regado,\ny no volverán a desfallecer.\n \nEntonces se alegrará la doncella en la danza,\ngozarán los jóvenes y los viejos;\nconvertiré su tristeza en gozo,\nlos alegraré y aliviaré sus penas;\nalimentaré a los sacerdotes con manjares sustanciosos,\ny mi pueblo se saciará de mis bienes.\n\nAnt. El Señor redimió a su pueblo. Aleluya.\n\nAnt. 3. Éste es nuestro Dios por siempre jamás. Aleluya.\n\nSalmo 47\nHIMNO A LA GLORIA DE JERUSALÉN\nMe transportó en espíritu a un monte altísimo y me enseñó la ciudad santa, Jerusalén (Ap 21, 10). \n\nGrande es el Señor y muy digno de alabanza\nen la ciudad de nuestro Dios,\nsu monte santo, altura hermosa,\nalegría de toda la tierra:\n \nel monte Sión, vértice del cielo,\nciudad del gran rey;\nentre sus palacios,\nDios descuella como un alcázar.\n \nMirad: los reyes se aliaron\npara atacarla juntos;\npero, al verla, quedaron aterrados\ny huyeron despavoridos;\n \nallí los agarró un temblor\ny dolores como de parto;\ncomo un viento del desierto,\nque destroza las naves de Tarsis.\n \nLo que habíamos oído lo hemos visto\nen la ciudad del Señor de los ejércitos,\nen la ciudad de nuestro Dios:\nque Dios la ha fundado para siempre.\n \n¡Oh Dios!, meditamos tu misericordia\nen medio de tu templo:\ncomo tu renombre, ¡oh Dios!, tu alabanza\nllega al confín de la tierra;\n \ntu diestra está llena de justicia:\nel monte Sión se alegra,\nlas ciudades de Judá se gozan\ncon tus sentencias.\n \nDad la vuelta en torno a Sión,\ncontando sus torreones;\nfijaos en sus baluartes,\nobservad sus palacios,\n \npara poder decirle a la próxima generación:\n«Éste es el Señor, nuestro Dios.»\nÉl nos guiará por siempre jamás.\n\nAnt. Éste es nuestro Dios por siempre jamás. Aleluya.\n\nLECTURA BREVE Hb 13, 7-9a\n\nAcordaos de aquellos superiores vuestros que os expusieron la palabra de Dios: reflexionando sobre el desenlace de su vida, ¡mitad su fe. Jesucristo es el mismo hoy que ayer, y para siempre. No os dejéis extraviar por doctrinas llamativas y extrañas.\n\nRESPONSORIO BREVE\n\nV. Sobre tus murallas, Jerusalén, he colocado centinelas. Aleluya, aleluya.\nR. Sobre tus murallas, Jerusalén, he colocado centinelas. Aleluya, aleluya.\nV. Ni de día ni de noche dejarán de anunciar el nombre del Señor.\nR. Aleluya, aleluya..\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Sobre tus murallas, Jerusalén, he colocado centinelas. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. No sois vosotros los que habláis, sino el Espíritu de vuestro Padre quien habla por vosotros. Aleluya.\n\nBENEDICTUS Lc 1, 68-79\nEL MESÍAS Y SU PRECURSOR\n\nBendito sea el Señor, Dios de Israel,\nporque ha visitado y redimido a su pueblo,\nsuscitándonos una fuerza de salvación\nen la casa de David, su siervo,\nsegún lo había predicho desde antiguo,\npor boca de sus santos profetas.\n \nEs la salvación que nos libra de nuestros enemigos\ny de la mano de todos los que nos odian;\nrealizando la misericordia\nque tuvo con nuestros padres,\nrecordando su santa alianza\ny el juramento que juró a nuestro padre Abrahán.\n \nPara concedernos que, libres de temor,\narrancados de la mano de los enemigos,\nle sirvamos con santidad y justicia,\nen su presencia, todos nuestros días.\n \nY a ti, niño, te llamarán profeta del Altísimo,\nporque irás delante del Señor\na preparar sus caminos,\nanunciando a su pueblo la salvación,\nel perdón de sus pecados.\n \nPor la entrañable misericordia de nuestro Dios,\nnos visitará el sol que nace de lo alto,\npara iluminar a los que viven en tinieblas\ny en sombra de muerte,\npara guiar nuestros pasos\npor el camino de la paz.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. No sois vosotros los que habláis, sino el Espíritu de vuestro Padre quien habla por vosotros. Aleluya.\n\nPRECES\n\nDemos gracias a Cristo, el buen pastor que entregó la vida por sus ovejas, y supliquémosle diciendo:\n\nApacienta a tu pueblo, Señor.\n \nSeñor Jesucristo, tú que en los santos pastores has revelado tu misericordia y tu amor,\n— haz que, por ellos, continúe llegando a nosotros tu acción misericordiosa.\n \nSeñor Jesucristo, tú que a través de los santos pastores sigues siendo el único pastor de tu pueblo,\n— no dejes de guiarnos siempre por medio de ellos.\n \nSeñor Jesucristo, tú que por medio de los santos pastores eres el médico de los cuerpos y de las almas,\n— haz que nunca falten en tu Iglesia los ministros que nos guíen por las sendas de una vida santa.\n \nSeñor Jesucristo, tú que has adoctrinado a la Iglesia con la prudencia y el amor de los santos,\n— haz que, guiados por nuestros pastores, progresemos en la santidad.\n\nSe pueden añadir algunas intenciones libres.\n\nOremos confiadamente al Padre, como Cristo nos enseñó: \n\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN\n\nDios todopoderoso y eterno, que hiciste de tu obispo san Atanasio un preclaro defensor de la divinidad de tu Hijo, concédenos, en tu bondad, que, fortalecidos con su doctrina y protección, te conozcamos y te amemos cada vez más plenamente. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': 'Vísperas\n\nV. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. \n\nHIMNO\n\nCantemos al Señor con alegría,\nunidos a la voz del Pastor santo;\ndemos gracias a Dios, que es luz y guía,\nsolícito pastor de su rebaño.\n \nEs su voz y su amor el que nos llama\nen la voz del pastor que él ha elegido,\nes su amor infinito el que nos ama\nen la entrega y amor de este otro cristo.\n \nConociendo en la fe su fiel presencia,\nhambrientos de verdad y luz divina,\nsigamos al pastor que es providencia\nde pastos abundantes que son vida.\n \nApacienta, Señor, guarda a tus hijos,\nmanda siempre a tu mies trabajadores;\ncada aurora, a la puerta del aprisco,\nnos aguarde el amor de tus pastores. Amén.\n\nSALMODIA\n\nAnt. 1. Cambiaste mi luto en danzas. Aleluya.\n\nSalmo 29\nACCIÓN DE GRACIAS POR LA CURACIÓN DE UN ENFERMO EN PELIGRO DE MUERTE\nCristo, después de su gloriosa resurrección, da gracias al Padre (Casiano).\n\nTe ensalzaré, Señor, porque me has librado\ny no has dejado que mis enemigos se rían de mí.\n \nSeñor, Dios mío, a ti grité,\ny tú me sanaste.\nSeñor, sacaste mi vida del abismo,\nme hiciste revivir cuando bajaba a la fosa.\n \nTañed para el Señor, fieles suyos,\ndad gracias a su nombre santo;\nsu cólera dura un instante;\nsu bondad, de por vida;\nal atardecer nos visita el llanto,\npor la mañana, el júbilo.\n \nYo pensaba muy seguro:\n«No vacilaré jamás.»\nTu bondad, Señor, me aseguraba\nel honor y la fuerza;\npero escondiste tu rostro,\ny quedé desconcertado.\n \nA ti, Señor, llamé,\nsupliqué a mi Dios:\n«¿Qué ganas con mi muerte,\ncon que yo baje a la fosa?\n \n¿Te va a dar gracias el polvo,\no va a proclamar tu lealtad?\nEscucha, Señor, y ten piedad de mí.\nSeñor, socórreme.»\n \nCambiaste mi luto en danzas,\nme desataste el sayal y me has vestido de fiesta;\nte cantará mi alma sin callarse.\nSeñor, Dios mío, te daré gracias por siempre.\n\nAnt. Cambiaste mi luto en danzas. Aleluya.\n\nAnt. 2. Hemos sido reconciliados con Dios por la muerte de su Hijo. Aleluya.\n\nSalmo 31\nACCIÓN DE GRACIAS DE UN PECADOR PERDONADO\nDavid proclama dichoso al hombre a quien Dios confiere la justificación haciendo caso omiso de las obras (Rom 4, 6).\n\nDichoso el que está absuelto de su culpa,\na quien le han sepultado su pecado;\ndichoso el hombre a quien el Señor\nno le apunta el delito.\n \nMientras callé se consumían mis huesos,\nrugiendo todo el día,\nporque día y noche tu mano\npesaba sobre mí;\nmi savia se me había vuelto\nun fruto seco.\n \nHabía pecado, lo reconocí,\nno te encubrí mi delito;\npropuse: «Confesaré al Señor mi culpa»,\ny tú perdonaste mi culpa y mi pecado.\n \nPor eso, que todo fiel te suplique\nen el momento de la desgracia:\nla crecida de las aguas caudalosas\nno lo alcanzará.\n \nTú eres mi refugio, me libras del peligro,\nme rodeas de cantos de liberación.\n \nTe instruiré y te enseñaré el camino que has de seguir,\nfijaré en ti mis ojos.\n \nNo seáis irracionales como caballos y mulos,\ncuyo brío hay que domar con freno y brida;\nsi no, no puedes acercarte.\n \nLos malvados sufren muchas penas;\nal que confía en el Señor,\nla misericordia lo rodea.\n \nAlegraos, justos, y gozad con el Señor,\naclamadlo, los de corazón sincero.\n\nAnt. Hemos sido reconciliados con Dios por la muerte de su Hijo. Aleluya.\n\nAnt. 3. ¿Quién como tú, Señor, entre los dioses? ¿Quién como tú, terrible entre los santos? Aleluya.\n\nCántico Ap 11, 17-18; 12, 10b-12a\nEL JUICIO DE DIOS\n\nGracias te damos, Señor Dios omnipotente,\nel que eres y el que eras,\nporque has asumido el gran poder\ny comenzaste a reinar.\n \nSe encolerizaron las naciones,\nllegó tu cólera,\ny el tiempo de que sean juzgados los muertos,\ny de dar el galardón a tus siervos los profetas,\ny a los santos y a los que temen tu nombre,\ny a los pequeños y a los grandes,\ny de arruinar a los que arruinaron la tierra.\n \nAhora se estableció la salud y el poderío,\ny el reinado de nuestro Dios,\ny la potestad de su Cristo;\nporque fue precipitado\nel acusador de nuestros hermanos,\nel que los acusaba ante nuestro Dios día y noche.\n \nEllos le vencieron en virtud de la sangre del Cordero\ny por la palabra del testimonio que dieron,\ny no amaron tanto su vida que temieran la muerte.\nPor esto, estad alegres, cielos,\ny los que moráis en sus tiendas.\n\nAnt. ¿Quién como tú, Señor, entre los dioses? ¿Quién como tú, terrible entre los santos? Aleluya.\n\nLECTURA BREVE 1 Pe 5, 1-4\n\nA los presbíteros en esa comunidad, yo, presbítero como ellos, testigo de los sufrimientos de Cristo y partícipe de la gloria que va a descubrirse, os exhorto: Sed pastores del rebaño de Dios a vuestro cargo, gobernándolo, no a la fuerza, sino de buena gana, como Dios quiere, no por sórdida ganancia, sino con generosidad, no como dominadores sobre la heredad de Dios, sino convirtiéndoos en modelos del rebaño. Y, cuando aparezca el supremo Pastor, recibiréis la corona de gloria que no se marchita.\n\nRESPONSORIO BREVE\n\nV. Éste es el que ama a sus hermanos, el que ora mucho por su pueblo. Aleluya, aleluya.\nR. Éste es el que ama a sus hermanos, el que ora mucho por su pueblo. Aleluya, aleluya.\nV. El que entregó su vida por sus hermanos.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. Éste es el que ama a sus hermanos, el que ora mucho por su pueblo. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Éste es el administrador fiel y prudente, a quien su señor ha puesto al frente de su servidumbre para que les reparta la ración a sus horas. Aleluya.\n\nMAGNÍFICAT Lc 1, 46-55\nALEGRÍA DEL ALMA EN EL SEÑOR\n\nProclama mi alma la grandeza del Señor,\nse alegra mi espíritu en Dios mi salvador;\nporque ha mirado la humillación de su esclava.\n \nDesde ahora me felicitarán todas las generaciones,\nporque el Poderoso ha hecho obras grandes por mí:\nsu nombre es santo\ny su misericordia llega a sus fieles\nde generación en generación.\n \nÉl hace proezas con su brazo:\ndispersa a los soberbios de corazón,\nderriba del trono a los poderosos\ny enaltece a los humildes,\na los hambrientos los colma de bienes\ny a los ricos los despide vacíos.\n \nAuxilia a Israel, su siervo,\nacordándose de su misericordia\n—como lo había prometido a nuestros padres—\nen favor de Abraham y su descendencia por siempre.\n \nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Éste es el administrador fiel y prudente, a quien su señor ha puesto al frente de su servidumbre para que les reparta la ración a sus horas. Aleluya.\n\nPRECES\n\nGlorifiquemos a Cristo, constituido pontífice en favor de los hombres en lo que se refiere a Dios, y supliquémosle humildemente diciendo:\n\nSalva a tu pueblo, Señor.\n \nTú que por medio de pastores santos y eximios has glorificado a tu Iglesia,\n— haz que todos los cristianos resplandezcan por su virtud.\n \nTú que por la oración de los santos pastores, que a semejanza de Moisés oraban por el pueblo, perdonaste los pecados de tus fieles,\n— purifica y santifica también ahora a la santa Iglesia por la intercesión de los santos.\n \nTú que de entre los fieles elegiste a los santos pastores y, por tu Espíritu, los consagraste como ministros en bien de sus hermanos,\n— llena también de tu Espíritu a todos los pastores del pueblo de Dios.\n \nTú que fuiste la heredad de los santos pastores,\n— no permitas que ninguno de los que fueron adquiridos por tu sangre viva alejado de ti.\n\nSe pueden añadir algunas intenciones libres.\n\nTú que por medio de los pastores de la Iglesia das la vida eterna a tus ovejas para que nadie las arrebate de tu mano,\n— salva a los difuntos, por quienes entregaste tu vida.\n \nDigamos juntos la oración que Cristo nos enseñó como modelo de toda oración: \n\nPadre nuestro, que estás en el cielo, santificado sea tu Nombre; venga a nosotros tu reino; hágase tu voluntad  en la tierra como en el cielo. Danos hoy nuestro pan de cada día; perdona nuestras ofensas, como también nosotros perdonamos a los que nos ofenden; no nos dejes caer en la tentación, y líbranos del mal. \n\nORACIÓN\n\nDios todopoderoso y eterno, que hiciste de tu obispo san Atanasio un preclaro defensor de la divinidad de tu Hijo, concédenos, en tu bondad, que, fortalecidos con su doctrina y protección, te conozcamos y te amemos cada vez más plenamente. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. El Señor nos bendiga, nos guarde de todo mal y nos lleve a la vida eterna.\nR. Amén.',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': 'Oficio de Lecturas\n\nV. Señor, ábreme los labios.\nR. Y mi boca proclamará tu alabanza.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. \n\nINVITATORIO\n\nAnt. Venid, adoremos a Cristo, Pastor supremo. \n\nSalmo 94 \n\nVenid, aclamemos al Señor,\ndemos vítores a la Roca que nos salva;\nentremos a su presencia dándole gracias,\naclamándolo con cantos. \n\nPorque el Señor es un Dios grande,\nsoberano de todos los dioses:\ntiene en su mano las simas de la tierra,\nson suyas las cumbres de los montes.\nSuyo es el mar, porque él lo hizo,\nla tierra firme que modelaron sus manos. \n\nVenid, postrémonos por tierra,\nbendiciendo al Señor, creador nuestro.\nPorque él es nuestro Dios,\ny nosotros su pueblo,\nel rebaño que él guía. \n\nOjalá escuchéis hoy su voz:\n"No endurezcáis el corazón como en Meribá,\ncomo el día de Masá en el desierto:\ncuando vuestros padres me pusieron a prueba,\ny dudaron de mí, aunque habían visto mis obras." \n\nDurante cuarenta años\naquella generación me repugnó, y dije:\n"Es un pueblo de corazón extraviado,\nque no reconoce mi camino;\npor eso he jurado en mi cólera\nque no entrarán en mi descanso." \n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. \n\nAnt. Venid, adoremos a Cristo, Pastor supremo. \n\nHIMNO\n\nPuerta de Dios en el redil humano\nfue Cristo, el buen Pastor que al mundo vino,\nglorioso va delante del rebaño,\nguiando su marchar por buen camino.\n \nMadero de la cruz es su cayado,\nsu voz es la verdad que a todos llama,\nsu amor es el del Padre, que le ha dado\nEspíritu de Dios, que a todos ama.\n \nPastores del Señor son sus ungidos,\nnuevos cristos de Dios, son enviados\na los pueblos del mundo redimidos;\ndel único Pastor siervos amados.\n \nLa cruz de su Señor es su cayado,\nla voz de la verdad es su llamada,\nlos pastos de su amor, fecundo prado,\nson vida del Señor que nos es dada. Amén.\n\nSALMODIA\n\nAnt. 1. La promesa del Señor es escudo para los que a ella se acogen. Aleluya.\n\nSalmo 17, 31-51\nEL SEÑOR REVELA SU PODER SALVADOR\nSi Dios está con nosotros, ¿quién estará contra nosotros? (Rom 8, 31).\nIV\n\nPerfecto es el camino de Dios,\nacendrada es la promesa del Señor;\nél es escudo para los que a él se acogen.\n \n¿Quién es dios fuera del Señor?\n¿Qué roca hay fuera de nuestro Dios?\nDios me ciñe de valor\ny me enseña un camino perfecto.\n \nÉl me da pies de ciervo,\ny me coloca en las alturas;\nél adiestra mis manos para la guerra,\ny mis brazos para tensar la ballesta.\n\nAnt. La promesa del Señor es escudo para los que a ella se acogen. Aleluya.\n\nAnt. 2. Tu diestra, Señor, me sostuvo. Aleluya.\n\nV\n\nMe dejaste tu escudo protector,\ntu diestra me sostuvo,\nmultiplicaste tus cuidados conmigo.\nEnsanchaste el camino a mis pasos,\ny no flaquearon mis tobillos;\n \nyo perseguía al enemigo hasta alcanzarlo,\ny no me volvía sin haberlo aniquilado:\nlos derroté, y no pudieron rehacerse,\ncayeron bajo mis pies.\n \nMe ceñiste de valor para la lucha,\ndoblegaste a los que me resistían;\nhiciste volver la espalda a mis enemigos,\nrechazaste a mis adversarios.\n \nPedían auxilio, pero nadie los salvaba;\ngritaban al Señor, pero no les respondía.\nLos reduje a polvo, que arrebataba el viento;\nlos pisoteaba como barro de las calles.\n \nMe libraste de las contiendas de mi pueblo,\nme hiciste cabeza de naciones,\nun pueblo extraño fue mi vasallo.\n \nLos extranjeros me adulaban,\nme escuchaban y me obedecían.\nLos extranjeros palidecían\ny salían temblando de sus baluartes.\n\nAnt. Tu diestra, Señor, me sostuvo. Aleluya.\n\nAnt. 3. Viva el Señor, bendito sea mi Dios y Salvador.  Aleluya.\n\nVI\n\nViva el Señor, bendita sea mi Roca,\nsea ensalzado mi Dios y Salvador:\nel Dios que me dio el desquite\ny me sometió los pueblos;\n \nque me libró de mis enemigos,\nme levantó sobre los que resistían\ny me salvó del hombre cruel.\n \nPor eso te daré gracias entre las naciones, Señor,\ny tañeré en honor de tu nombre:\ntú diste gran victoria a tu rey,\ntuviste misericordia de tu Ungido,\nde David y su linaje por siempre.\n\nAnt. Viva el Señor, bendito sea mi Dios y Salvador. Aleluya.\n\nVERSÍCULO\n\nV. Dios resucitó al Señor. Aleluya.\nR. Y nos resucitará también a nosotros por su poder. Aleluya.\n\nPRIMERA LECTURA\n\nDel libro del Apocalipsis 21, 9-27\nVISIÓN DE LA JERUSALÉN CELESTE\n\nVino uno de los siete ángeles que tenía las siete copas llenas de las siete últimas plagas, y me habló, diciendo:«Ven y te mostraré la desposada, la esposa del Cordero.»\nMe transportó en espíritu a un monte altísimo y me enseñó la ciudad santa, Jerusalén, que bajaba del cielo, de junto a Dios, y traía la gloria de Dios. Su resplandor era como el de una piedra muy preciosa, como jaspe cristalino. Tenía una muralla grande y alta con doce puertas; y, sobre las puertas, doce ángeles y nombres grabados, que son los de las doce tribus de los hijos de Israel; tres puertas al oriente; tres puertas al norte; tres puertas al mediodía; tres puertas al occidente. La muralla de la ciudad se asienta sobre doce piedras, que llevan los nombres de los doce apóstoles del Cordero.\nEl que hablaba conmigo tenía una caña de medir, de oro, para medir la ciudad, sus puertas y su muralla. La ciudad es un cuadrado: su largo es igual a su ancho. Midió la ciudad con la caña, y tenía doce mil estadios. Su largo, ancho y alto son iguales.\nMidió luego su muralla, y tenía ciento cuarenta y cuatro codos con medida humana, la empleada por el ángel. El material de esta muralla es jaspe y la ciudad es de oro puro semejante al vidrio puro.\nLas piedras en que se asienta la muralla de la ciudad están adornadas de toda clase de piedras preciosas: la primera piedra es de jaspe; la segunda, de zafiro; la tercera, de calcedonia; la cuarta, de esmeralda; la quinta, de sardónica; la sexta, de cornalina; la séptima, de crisólito; la octava, de berilo; la novena, de topacio; la décima, de crisoprasa; la undécima, de jacinto; la duodécima, de amatista.\nY las doce puertas son doce perlas, cada una de las puertas hecha de una sola perla; y la plaza de la ciudad es de oro puro, transparente como el cristal.\nPero no vi santuario alguno en ella; porque el Señor, Dios todopoderoso, y el Cordero, es su santuario. La ciudad no necesita ni de sol ni de luna que la alumbren, porque la ilumina la gloria de Dios, y su lámpara es el Cordero. Las naciones caminarán a su luz, y los reyes de la tierra irán a llevarle su esplendor. Sus puertas no se cerrarán con el día —porque allí no habrá noche— y traerán a ella el esplendor y los tesoros de las naciones. Nada profano entrará en ella, ni los que cometen abominación y mentira, sino solamente los inscritos en el libro de la vida del Cordero.\n\nRESPONSORIO Cf. Ap 21, 21; Tb 13, 21. 22. 13\n\nV. Tus plazas, Jerusalén, están pavimentadas de oro puro, y en tus puertas se entonarán cantos de alegría. \nR. Y todas tus casas cantarán: «Aleluya».\nV. Brillarás cual luz de lámpara y todos los confines de la tierra vendrán a ti.\nR. Y todas tus casas cantarán: «Aleluya».\n\nAño II:\n\nDe los Hechos de los apóstoles 19, 1-20\nPABLO EN ÉFESO\n\nEn aquellos días, mientras Apolo se encontraba en Corinto, Pablo, después de atravesar la región alta del Asia proconsular, llegó a Éfeso, donde encontró algunos discípulos. Y les preguntó: «¿Recibisteis el Espíritu Santo cuando abrazasteis la fe?»\nEllos contestaron: «Ni siquiera hemos oído que exista el Espíritu Santo.»\nÉl les preguntó de nuevo: «Pues entonces, ¿qué bautismo recibisteis?»\nLe respondieron: «El bautismo de Juan.»\nY dijo Pablo: «Juan bautizó con un bautismo que era sólo una señal de arrepentimiento, y fue diciendo al pueblo que creyese en el que iba a venir después de él, esto es, en Jesús.»\nOídas estas palabras, se hicieron bautizar en el nombre de Jesús, el Señor. Pablo les impuso después las manos, y descendió sobre ellos el Espíritu Santo; y comenzaron a hablar distintas lenguas y a proferir discursos inspirados por Dios. Eran en total unos doce hombres.\nEntró Pablo en la sinagoga, y con entereza y libertad habló por espacio de tres meses acerca del reino de Dios, tratando de convencer a los judíos. Pero, como algunos de ellos se obstinasen en no creer y en plena asamblea blasfemasen de la doctrina del Señor, Pablo rompió con ellos. Tomó aparte a sus discípulos y comenzó a enseñar todos los días en la escuela de un tal Tirano. Esta situación se prolongó por dos años, de manera que todos los habitantes del Asia proconsular, tanto judíos como griegos, llegaron a escuchar la doctrina del Señor.\nObraba Dios por medio de Pablo milagros extraordinarios; hasta tal punto que, con sólo aplicar a los enfermos los pañuelos y delantales que habían estado en contacto con su cuerpo, desaparecían las enfermedades y sanaban los espíritus malignos. Hasta unos exorcistas ambulantes, que eran judíos, llegaron a invocar sobre los posesos el nombre de Jesús, el Señor, con las siguientes palabras: «Os conjuro por Jesús, a quien Pablo predica.»\nLos que tal hacían eran siete hijos de un tal Esceva judío perteneciente a la familia pontifical. Pero, una vez, el mal espíritu les replicó: «Conozco a Jesús y sé quién es Pablo, pero vosotros, ¿quiénes sois?»\nY, abalanzándose el poseso sobre ellos, los sujetó a todos y la emprendió con tal violencia que, desnudos y maltrechos, tuvieron que escapar de aquella casa. Este suceso llegó a conocimiento de todos cuantos vivían en Éfeso, tanto judíos como griegos; con lo que se apoderó de todos un gran temor, y dieron gloria al nombre de Jesús, el Señor. Muchos de los que se habían hecho cristianos venían a confesar y revelar sus fórmulas secretas de magia. Y buen número de los que se habían dedicado a las artes mágicas traían sus libros para quemarlos en presencia de todos. Se calculó el valor de los mismos en cincuenta mil monedas de plata. De este modo, por la eficacia que daba el Señor, se extendía y arraigaba el Evangelio.\n\nRESPONSORIO Hch 2, 4; 19, 6\n\nV. Todos quedaron llenos del Espíritu Santo y comenzaron a hablar, \nR. Según les hacía expresarse el Espíritu. Aleluya.\nV. Pablo les impuso las manos, y descendió sobre ellos el Espíritu Santo; y comenzaron a hablar distintas lenguas y a proferir discursos inspirados.\nR. Según les hacía expresarse el Espíritu. Aleluya.\n\nSEGUNDA LECTURA\n\nDe los sermones de san Atanasio, obispo\n(Sermón sobre la encarnación del Verbo, 8-9: PG 25,110-111)\nDE LA ENCARNACIÓN DEL VERBO\n\nEl Verbo de Dios, incorpóreo, incorruptible e inmaterial vino a nuestro mundo, aunque tampoco antes se hallaba lejos, pues nunca parte alguna del universo se hallaba vacía de él, sino que lo llenaba todo en todas partes, ya que está junto a su Padre. Pero él vino por su benignidad hacia nosotros, y en cuanto se nos hizo visible. Tuvo piedad de nuestra raza y de nuestra debilidad y, compadecido de nuestra corrupción, no soportó que la muerte nos dominase, para que no pereciese lo que había sido creado, con lo que hubiera resultado inútil la obra de su Padre al crear al hombre, y por esto tomó para sí un cuerpo como el nuestro, ya que no se contentó con habitar en un cuerpo ni tampoco en hacerse simplemente visible. En efecto, si tan solo hubiese pretendido hacerse visible, hubiera podido ciertamente asumir un cuerpo más excelente; pero él tomó nuestro mismo cuerpo. En el seno de la Virgen, se construyó un templo, es decir, su cuerpo, y lo hizo su propio instrumento, en el que había de darse a conocer y habitar; de este modo, habiendo tomado un cuerpo semejante al de cualquiera de nosotros, ya que todos estaban sujetos a la corrupción de la muerte, lo entregó a la muerte por todos, ofreciéndolo al Padre con un amor sin límites; con ello, al morir en su persona todos los hombres, quedó sin vigor la ley de la corrupción que afectaba a todos, ya que agotó toda la eficacia de la muerte en el cuerpo del Señor; y así ya no le quedó fuerza alguna para ensañarse con los demás hombres, semejantes a él; con ello, también hizo de nuevo incorruptibles a los hombres, que habían caído en la corrupción, y los llamó de muerte a vida, consumiendo totalmente en ellos la muerte, con el cuerpo que había asumido y con el poder de su resurrección, del mismo modo que la paja es consumida por el fuego. Por esta razón, asumió un cuerpo mortal: para que este cuerpo, unido al Verbo que está por encima de todo, satisficiera por todos la deuda contraída con la muerte; para que, por el hecho de habitar el Verbo en él, no sucumbiera a la corrupción; y, finalmente, para que, en adelante, por el poder de la resurrección, se vieran ya todos libres de la corrupción. De ahí que el cuerpo que él había tomado, al entregarlo a la muerte como una hostia y víctima limpia de toda mancha, alejó al momento la muerte de todos los hombres, a los que él se había asemejado, ya que se ofreció en lugar de ellos. De este modo, el Verbo de Dios, superior a todo lo que existe, ofreciendo en sacrificio su cuerpo, templo e instrumento de su divinidad, pagó con su muerte la deuda que habíamos contraído, y, así, el Hijo de Dios, inmune a la corrupción, por la promesa de la resurrección, hizo partícipes de esta misma inmunidad a todos los hombres, con los que se había hecho una misma cosa por su cuerpo semejante al de ellos. Es verdad, pues, que la corrupción de la muerte no tiene ya poder alguno sobre los hombres, gracias al Verbo, que habita entre ellos por su encarnación.\n\nRESPONSORIO Jr 15, 19. 20; 2 Pe 2, 1\n\nV. Serás como mi boca, te pondré frente a este pueblo como muralla de bronce inexpugnable.\nR. Lucharán contra ti, mas no podrán vencerte, pues yo estoy contigo. Aleluya.\nV. Habrá falsos maestros que introducirán sectas perniciosas, y llegarán hasta a negar al Señor que los rescató.\nR. Lucharán contra ti, mas no podrán vencerte, pues yo estoy contigo. Aleluya.\n\nORACIÓN\n\nDios todopoderoso y eterno, que hiciste de tu obispo san Atanasio un preclaro defensor de la divinidad de tu Hijo, concédenos, en tu bondad, que, fortalecidos con su doctrina y protección, te conozcamos y te amemos cada vez más plenamente. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. Aleluya.\nR. Demos gracias a Dios. Aleluya, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': 'Hora Intermedia\n\nV. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén. Aleluya.\n\nHIMNO\n\nEl mundo brilla de alegría.\nSe renueva la faz de la tierra.\nGloria al Padre, y al Hijo, y al Espíritu\n \nÉsta es la hora\nen que rompe el Espíritu\nel techo de la tierra,\ny una lengua de fuego innumerable\npurifica, renueva, enciende, alegra\nlas entrañas del mundo.\n \nÉsta es la fuerza\nque pone en pie a la Iglesia\nen medio de las plazas\ny levanta testigos en el pueblo,\npara hablar con palabras como espadas\ndelante de los jueces.\n \nLlama profunda,\nque escrutas e iluminas\nel corazón del hombre:\nrestablece la fe con tu noticia,\ny el amor ponga en vela la esperanza,\nhasta que el Señor vuelva.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 118, 17-24\nIII (Ghimel)\n\nHaz bien a tu siervo: viviré\ny cumpliré tus palabras;\nábreme los ojos, y contemplaré\nlas maravillas de tu voluntad;\nsoy un forastero en la tierra:\nno me ocultes tus promesas.\n \nMi alma se consume, deseando\ncontinuamente tus mandamientos;\nreprendes a los soberbios,\nmalditos los que se apartan de tus mandatos.\n \nAleja de mí las afrentas y el desprecio,\nporque observo tus preceptos;\naunque los nobles se sienten a murmurar de mí,\ntu siervo medita tus leyes;\ntus preceptos son mi delicia,\ntus decretos son mis consejeros.\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 24\nORACIÓN POR TODA CLASE DE NECESIDADES\nLa esperanza no defrauda (Rom 5, 5).\nI\n\nA ti, Señor, levanto mi alma;\nDios mío, en ti confío\nno quede yo defraudado,\nque no triunfen de mí mis enemigos,\npues los que esperan en ti no quedan defraudados,\nmientras que el fracaso malogra a los traidores.\n \nSeñor, enséñame tus caminos,\ninstrúyeme en tus sendas:\nhaz que camine con lealtad;\nenséñame, porque tú eres mi Dios y Salvador,\ny todo el día te estoy esperando.\n \nRecuerda, Señor, que tu ternura\ny tu misericordia son eternas;\nno te acuerdes de los pecados\nni de las maldades de mi juventud;\nacuérdate de mí con misericordia,\npor tu bondad, Señor.\n \nEl Señor es bueno y es recto,\ny enseña el camino a los pecadores;\nhace caminar a los humildes con rectitud,\nenseña su camino a los humildes.\n \nLas sendas del Señor son misericordia y lealtad\npara los que guardan su alianza y sus mandatos.\nPor el honor de tu nombre, Señor,\nperdona mis culpas, que son muchas.\n\nAnt. Aleluya, aleluya, aleluya.\n\nII\n\n¿Hay alguien que tema al Señor?\nÉl le enseñará el camino escogido:\nsu alma vivirá feliz,\nsu descendencia poseerá la tierra.\n \nEl Señor se confía con sus fieles,\ny les da a conocer su alianza.\nTengo los ojos puestos en el Señor,\nporque Él saca mis pies de la red.\n \nMírame, oh Dios, y ten piedad de mí,\nque estoy solo y afligido.\nEnsancha mi corazón oprimido\ny sácame de mis tribulaciones.\n \nMira mis trabajos y mis penas\ny perdona todos mis pecados;\nmira cuántos son mis enemigos,\nque me detestan con odio cruel.\n \nGuarda mi vida y líbrame,\nno quede yo defraudado de haber acudido a ti.\nLa inocencia y la rectitud me protegerán,\nporque espero en ti.\n \nSalva, oh Dios, a Israel\nde todos sus peligros.\n\nAnt. Aleluya, aleluya, aleluya.\n\nTERCIA\n\nLECTURA BREVE 1 Co 12, 13\n\nTodos nosotros, judíos y griegos, esclavos y libres, hemos sido bautizados en un mismo Espíritu, para formar un solo cuerpo. Y todos hemos bebido de un solo Espíritu.\n\nV. Verdaderamente ha resucitado el Señor. Aleluya.\nR. Y se ha aparecido a Simón. Aleluya.\n\nORACIÓN\n\nSeñor Dios todopoderoso, que, sin mérito alguno de nuestra parte, nos haces pasar de la muerte a la vida y de la tristeza al gozo, no pongas fin a tus dones, ni ceses de realizar tus maravillas en nosotros, y concede a quienes ya hemos sido justificados por la fe la fuerza necesaria para perseverar siempre en ella. Por nuestro Señor Jesucristo.\n\nSEXTA\n\nLECTURA BREVE Tt 3, 5b-7\n\nDios nos ha salvado con el baño del segundo nacimiento y con la renovación por el Espíritu Santo; Dios lo derramó copiosamente sobre nosotros por medio de Jesucristo, nuestro Salvador. Así, justificados por su gracia, somos, en esperanza, herederos de la vida eterna.\n\nV. Los discípulos se llenaron de alegría. Aleluya.\nR. Al ver al Señor. Aleluya.\n\nORACIÓN\n\nSeñor Dios todopoderoso, que, sin mérito alguno de nuestra parte, nos haces pasar de la muerte a la vida y de la tristeza al gozo, no pongas fin a tus dones, ni ceses de realizar tus maravillas en nosotros, y concede a quienes ya hemos sido justificados por la fe la fuerza necesaria para perseverar siempre en ella. Por nuestro Señor Jesucristo.\n\nNONA\n\nLECTURA BREVE Cf. Col 1, 12-14\n\nDamos gracias a Dios Padre, que nos ha hecho capaces de compartir la herencia del pueblo santo en la luz. Él nos ha sacado del dominio de las tinieblas, y nos ha trasladado al reino de su Hijo querido, por cuya sangre hemos recibido la redención, el perdón de los pecados.\n\nV. Quédate con nosotros, Señor. Aleluya.\nR. Porque ya es tarde. Aleluya.\n\nORACIÓN\n\nSeñor Dios todopoderoso, que, sin mérito alguno de nuestra parte, nos haces pasar de la muerte a la vida y de la tristeza al gozo, no pongas fin a tus dones, ni ceses de realizar tus maravillas en nosotros, y concede a quienes ya hemos sido justificados por la fe la fuerza necesaria para perseverar siempre en ella. Por nuestro Señor Jesucristo.\n\nCONCLUSIÓN\n\nV. Bendigamos al Señor. \nR. Demos gracias a Dios.',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-03',
      'info': [
        {
          'title': 'Completas',
          'description': 'Completas\n\nV. Dios mío, ven en mi auxilio.\nR. Señor, date prisa en socorrerme.\n\nGloria al Padre y al Hijo y al Espíritu Santo\ncomo era en el principio, ahora y siempre\ny por los siglos de los siglos. Amén. Alelluya.\n\nEXAMEN DE CONCIENCIA\n\nHermanos: Llegados al fin de esta jornada que Dios nos ha concedido, agradezcamos sus dones y reconozcamos humildemente nuestros pecados.\n\nTodos examinan en silencio su conciencia. Terminado el examen se añade una de las siguientes fórmulas penitenciales:\n\nI\nYo confieso ante Dios todopoderoso\ny ante vosotros, hermanos,\nque he pecado mucho\nde pensamiento, palabra, obra y omisión:\npor mi culpa, por mi culpa, por mi gran culpa.\n\nPor eso ruego a santa María, siempre Virgen,\na los ángeles, a los santos y a vosotros, hermanos,\nque intercedáis por mí ante Dios, nuestro Señor.  \n\nII\n\nV. Señor, ten misericordia de nosotros.\nR. Porque hemos pecado contra ti.\nV. Muéstranos, Señor, tu misericordia.\nR. Y danos tu salvación.\n\nV. Dios todopoderoso tenga misericordia de nosotros, perdone nuestros pecados y nos lleve a la vida eterna.\nR. Amén.\n\nHIMNO\n\nDe la vida en la arena\nme llevas de la mano\nal puerto más cercano,\nal agua más serena.\nEl corazón se llena,\nSeñor, de tu ternura;\ny es la noche más pura\ny la ruta más bella\nporque tú estás en ella,\nsea clara u oscura.\n \nLa noche misteriosa\nacerca a lo escondido;\nel sueño es el olvido\ndonde la paz se posa.\nY esa paz es la rosa\nde los vientos. Velero,\ninquieto marinero,\nya mi timón preparo\n-tú el mar y cielo claro-\nhacia el alba que espero.\n \nGloria al Padre, y al Hijo,\ny al Espíritu Santo. Amén.\n\nSALMODIA\n\nAnt. Aleluya, aleluya, aleluya.\n\nSalmo 85\nORACIÓN DEL POBRE ANTE LOS PROBLEMAS\nBendito sea Dios, que nos alienta en nuestras luchas (2 Co 1, 3.4)\n\nInclina tu oído, Señor, escúchame,\nque soy un pobre desamparado;\nprotege mi vida, que soy un fiel tuyo;\nsalva a tu siervo, que confía en ti.\n \nTú eres mi Dios, piedad de mí, Señor,\nque a tí te estoy llamando todo el día;\nalegra el alma de tu siervo,\npues levanto mi alma hacia ti;\n \nporque tú, Señor, eres bueno y clemente,\nrico en misericordia\ncon los que te invocan.\nSeñor, escucha mi oración,\natiende a la voz de mi súplica.\n \nEn el día del peligro te llamo,\ny tú me escuchas.\nNo tienes igual entre los dioses, Señor,\nni hay obras como las tuyas.\n \nTodos los pueblos vendrán\na postrarse en tu presencia, Señor;\nbendecirán tu nombre:\n"Grande eres tú, y haces maravillas;\ntú eres el único Dios".\n \nEnséñame, Señor, tu camino,\npara que siga tu verdad;\nmantén mi corazón entero\nen el temor de tu nombre.\n \nTe alabaré de todo corazón, Dios mío;\ndaré gloria a tu nombre por siempre,\npor tu gran piedad para conmigo,\nporque me salvaste\ndel abismo profundo.\n \nDios mío, unos soberbios\nse levantan contra mí,\nuna banda de insolentes\natenta contra mi vida,\nsin tenerte en cuenta a ti.\n \nPero tú, Señor,\nDios clemente y misericordioso,\nlento a la cólera, rico en piedad y leal,\nmírame, ten compasión de mí.\n \nDa fuerza a tu siervo,\nsalva al hijo de tu esclava;\ndame una señal propicia,\nque la vean mis adversarios\ny se avergüencen,\nporque tú, Señor,\nme ayudas y consuelas.\n\nAnt. Aleluya, aleluya, aleluya.\n\nLECTURA BREVE 1 Ts 5, 9-10\n\nDios nos ha destinado a obtener la salvación por medio de nuestro Señor Jesucristo; él murió por nosotros, para que, despiertos o dormidos, vivamos con él.\n\nRESPONSORIO BREVE \n\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\nV. Tú, el Dios leal, nos librarás.\nR. Aleluya, aleluya.\nV. Gloria al Padre, y al Hijo, y al Espíritu Santo.\nR. A tus manos, Señor, encomiendo mi espíritu. Aleluya, aleluya.\n\nCÁNTICO EVANGÉLICO\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz. Aleluya.\n\nCántico de Simeón Lc 2, 29-32\nCRISTO, LUZ DE LAS NACIONES Y GLORIA DE ISRAEL\n\nAhora, Señor, según tu promesa,\npuedes dejar a tu siervo irse en paz,\nporque mis ojos han visto a tu Salvador,\na quien has presentado ante todos los pueblos:\nluz para alumbrar a las naciones\ny gloria de tu pueblo Israel.\nGloria al Padre, y al Hijo, y al Espíritu Santo.\nComo era en el principio, ahora y siempre,\npor los siglos de los siglos. Amén.\n\nAnt. Sálvanos, Señor, despiertos, protégenos mientras dormimos, para que velemos con Cristo y descansemos en paz.  Aleluya.\n\nORACIÓN\n\nConcede, Señor, a nuestros cuerpos fatigados el descanso necesario, y haz que la simiente del reino que con nuestro trabajo hemos sembrado hoy crezca y germine para la cosecha de la vida eterna. Por Jesucristo nuestro Señor.\n\nCONCLUSIÓN\nBendición\n\nV. El Señor todopoderoso nos conceda una noche tranquila y una santa muerte.\nR. Amén. Alelluya, alelluya.\n\nINVOCACIÓN A LA SANTÍSIMA VIRGEN\n\nReina del cielo, alégrate, aleluya,\nporque el Señor, a quien has merecido llevar, aleluya,\nha resucitado, según su palabra, aleluya.\nRuega al Señor por nosotros, aleluya.\nGózate y alégrate Virgen María, aleluya.\nPorque ha resucitado verdaderamente el Señor, aleluya.',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': 'Laudes\n\nSALMODIA\n\nAnt. 1. Señor, muéstranos al Padre y nos basta. Aleluya.\n\nSalmo 62, 2-9\nEL ALMA SEDIENTA DE DIOS\nMadruga por Dios todo el que rechaza las obras de las tinieblas.\n\n¡Oh Dios!, tú eres mi Dios, por ti madrugo,\nmi alma está sedienta de ti;\nmi carne tiene ansia de ti,\ncomo tierra reseca, agostada, sin agua.\n \n¡Cómo te contemplaba en el santuario\nviendo tu fuerza y tu gloria!\nTu gracia vale más que la vida,\nte alabarán mis labios.\n \nToda mi vida te bendeciré\ny alzaré las manos invocándote.\nMe saciaré como de enjundia y de manteca,\ny mis labios te alabarán jubilosos.\n \nEn el lecho me acuerdo de ti\ny velando medito en ti,\nporque fuiste mi auxilio,\ny a la sombra de tus alas canto con júbilo;\nmi alma está unida a ti,\ny tu diestra me sostiene.\n\nAnt. Señor, muéstranos al Padre y nos basta. Aleluya.\n\nAnt. 2. Hace tanto que estoy con vosotros, ¿y no me conoces, Felipe? Quien me ha visto a mí ha visto al Padre. Aleluya.\n\nCántico Dn 3, 57-88. 56\nTODA LA CREACIÓN ALABE AL SEÑOR\nAlabad al Señor, sus siervos todos (Ap 19, 5).\n\nCriaturas todas del Señor, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nÁngeles del Señor, bendecid al Señor;\ncielos, bendecid al Señor.\n \nAguas del espacio, bendecid al Señor;\nejércitos del Señor, bendecid al Señor. \n \nSol y luna, bendecid al Señor;\nastros del cielo, bendecid al Señor. \n \nLluvia y rocío, bendecid al Señor;\nvientos todos, bendecid al Señor. \n \nFuego y calor, bendecid al Señor;\nfríos y heladas, bendecid al Señor. \n \nRocíos y nevadas, bendecid al Señor;\ntémpanos y hielos, bendecid al Señor. \n \nEscarchas y nieves, bendecid al Señor;\nnoche y día, bendecid al Señor. \n \nLuz y tinieblas, bendecid al Señor;\nrayos y nubes, bendecid al Señor. \n \nBendiga la tierra al Señor,\nensálcelo con himnos por los siglos.\n \nMontes y cumbres, bendecid al Señor;\ncuanto germina en la tierra, bendiga al Señor.\n \nManantiales, bendecid al Señor;\nmares y ríos, bendecid al Señor. \n \nCetáceos y peces, bendecid al Señor;\naves del cielo, bendecid al Señor. \n \nFieras y ganados, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nHijos de los hombres, bendecid al Señor;\nbendiga Israel al Señor. \n \nSacerdotes del Señor, bendecid al Señor;\nsiervos del Señor, bendecid al Señor. \n \nAlmas y espíritus justos, bendecid al Señor;\nsantos y humildes de corazón, bendecid al Señor. \n \nAnanías, Azarías y Misael, bendecid al Señor,\nensalzadlo con himnos por los siglos.\n \nBendigamos al Padre, al Hijo y al Espíritu Santo,\nensalcémoslo con himnos por los siglos.\n \nBendito el Señor en la bóveda del cielo,\nalabado y glorioso y ensalzado por los siglos.\n\nNo se dice Gloria al Padre.\n\nAnt. Hace tanto que estoy con vosotros, ¿y no me conoces, Felipe? Quien me ha visto a mí ha visto al Padre. Aleluya.\n\nAnt. 3. Que no tiemble vuestro corazón ni se acobarde; creed en Dios y creed también en mí. En la casa de mi Padre hay muchas estancias. Aleluya.\n\nSalmo 149\nALEGRÍA DE LOS SANTOS\nLos hijos de la Iglesia, nuevo pueblo de Dios, se alegran en su Rey, Cristo, el Señor (Hesiquio).\n\nCantad al Señor un cántico nuevo,\nresuene su alabanza en la asamblea de los fieles;\nque se alegre Israel por su Creador,\nlos hijos de Sión por su Rey.\n \nAlabad su nombre con danzas,\ncantadle con tambores y cítaras;\nporque el Señor ama a su pueblo\ny adorna con la victoria a los humildes.\n \nQue los fieles festejen su gloria\ny canten jubilosos en filas:\ncon vítores a Dios en la boca\ny espadas de dos filos en las manos:\n \npara tomar venganza de los pueblos\ny aplicar el castigo a las naciones,\nsujetando a los reyes con argollas,\na los nobles con esposas de hierro.\n \nEjecutar la sentencia dictada\nes un honor para todos sus fieles.\n\nAnt. Que no tiemble vuestro corazón ni se acobarde: creed en Dios y creed también en mí; en la casa de mi Padre hay muchas estancias. Aleluya.',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-04',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',          
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-05',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-06',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-07',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-08',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-09',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-10',
      'info': [
       {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-11',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-12',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-13',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }
      ]
    },
    
    {
      'date': '2024-05-14',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },
    {
      'date': '2024-05-15',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-16',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-17',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-18',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-19',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-20',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-21',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-22',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-23',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-24',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-25',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-26',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-27',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-28',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-29',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-30',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-05-31',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-06-01',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },{
      'date': '2024-06-02',
      'info': [
        {
          'title': 'Completas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Laudes',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Visperas',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Oficio',
          'description': '',
          'isSelected': false
        },
        {
          'title': 'Intermedias',
          'description': '',
          'isSelected': false
        }      ]
    },
  ];
}
