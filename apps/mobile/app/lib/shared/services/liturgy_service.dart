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
      'description':["Oficio de Lecturas", "", "V. Señor, ábreme los labios.", "R. Y mi boca proclamará tu alabanza.", "", "Gloria al Padre, y al Hijo, y al Espíritu Santo.", "Como era en el principio, ahora y siempre,", "por los siglos de los siglos. Amén. ", "", "INVITATORIO", "", "Ant. Venid, adoremos al Dios de toda sabiduría, al Señor de toda verdad. ", "", "Venid, aclamemos al Señor,", "demos vítores a la Roca que nos salva;", "entremos a su presencia dándole gracias,", "aclamándolo con cantos.", "", "Porque el Señor es un Dios grande,", "soberano de todos los dioses:", "tiene en su mano las simas de la tierra,", "son suyas las cumbres de los montes.", "Suyo es el mar, porque él lo hizo,", "la tierra firme que modelaron sus manos. ", "", "Venid, postrémonos por tierra,", "bendiciendo al Señor, creador nuestro.", "Porque él es nuestro Dios,", "y nosotros su pueblo,", "el rebaño que él guía. ", "", "Ojalá escuchéis hoy su voz:", "No endurezcáis el corazón como en Meribá,", "como el día de Masá en el desierto:", "cuando vuestros padres me pusieron a prueba,", "y dudaron de mí, aunque habían visto mis obras.", "", "Durante cuarenta años", "aquella generación me repugnó, y dije:", "Es un pueblo de corazón extraviado,", "que no reconoce mi camino;", "por eso he jurado en mi cólera", "que no entrarán en mi descanso.", "", "Gloria al Padre, y al Hijo, y al Espíritu Santo.", "Como era en el principio, ahora y siempre,", "por los siglos de los siglos. Amén.", "", "Ant. Venid, adoremos al Dios de toda sabiduría, al Señor de toda verdad. Aleluya.", "", "HIMNO", "", "Hondo saber de Dios fue vuestra ciencia,", "su espíritu de verdad os dio a beberla", "en la Revelación, que es su presencia", "en velos de palabra siempre nueva.", " ", "Abristeis el camino para hallarla", "a todo el que de Dios hambre tenía,", "palabra del Señor que, al contemplarla,", "enciende nuestras luces que iluminan.", " ", "Saber de Dios en vida convertido", "es la virtud del justo, que, a su tiempo,", "si Dios le dio la luz, fue lo debido", "que fuera su verdad, su pensamiento.", " ", "Demos gracias a Dios humildemente,", "y al Hijo, su Verdad que a todos guía,", "dejemos que su Luz, faro esplendente,", "nos guíe por el mar de nuestra vida. Amén.", "", "SALMODIA", "", "Ant. 1. Quien quiera ser el primero que sea el ultimo de todos y el servidor de todos. Aleluya.", "", "Salmo 20, 2-8. 14", "ACCIÓN DE GRACIAS POR LA VICTORIA DEL REY", "", "Señor, el rey se alegra por tu fuerza,", "¡y cuánto goza con tu victoria!", "Le has concedido el deseo de su corazón,", "no le has negado lo que pedían sus labios.", " ", "Te adelantaste a bendecirlo con el éxito,", "y has puesto en su cabeza una corona de oro fino.", "Te pidió vida, y se la has concedido,", "años que se prolongan sin término.", " ", "Tu victoria ha engrandecido su fama,", "lo has vestido de honor y majestad.", "Le concedes bendiciones incesantes,", "lo colmas de gozo en tu presencia;", "porque el rey confía en el Señor,", "y con la gracia del Altísimo no fracasará.", " ", "Levántate, Señor, con tu fuerza,", "y al son de instrumentos cantaremos tu poder.", "", "Ant. Quien quiera ser el primero que sea el último de todos y el servidor de todos. Aleluya.", "", "Ant. 2. Cuando aparezca el supremo Pastor, recibiréis la corona de gloria que no se marchita. Aleluya.", "", "Salmo 91", "ALABANZA DEL DIOS CREADOR", "I", "", "Es bueno dar gracias al Señor", "y tocar para tu nombre, oh Altísimo,", "proclamar por la mañana tu misericordia", "y de noche tu fidelidad,", "con arpas de diez cuerdas y laúdes,", "sobre arpegios de cítaras.", " ", "Tus acciones, Señor, son mi alegría,", "y mi júbilo, las obras de tus manos.", "¡Qué magníficas son tus obras, Señor,", "qué profundos tus designios!", "El ignorante no los entiende", "ni el necio se da cuenta.", " ", "Aunque germinen como hierba los malvados", "y florezcan los malhechores,", "serán destruidos para siempre.", "Tú, en cambio, Señor,", "eres excelso por los siglos.", "", "Ant. Cuando aparezca el supremo Pastor, recibiréis la corona de gloria que no se marchita. Aleluya.", "", "Ant. 3. Siervo bueno y fiel, pasa al banquete de tu Señor. Aleluya.", "", "II", "", "Porque tus enemigos, Señor, perecerán,", "los malhechores serán dispersados;", "pero a mí me das la fuerza de un búfalo", "y me unges con aceite nuevo.", "Mis ojos despreciarán a mis enemigos,", "mis oídos escucharán su derrota.", " ", "El justo crecerá como una palmera,", "se alzará como un cedro del Líbano:", "plantado en la casa del Señor,", "crecerá en los atrios de nuestro Dios;", " ", "en la vejez seguirá dando fruto", "y estará lozano y frondoso,", "para proclamar que el Señor es justo,", "que en mi Roca no existe la maldad.", "", "Ant. Siervo bueno y fiel, pasa al banquete de tu Señor. Aleluya.", "", "VERSÍCULO", "", "V. Oirás de mi boca una palabra. Aleluya.", "R. Y les advertirás de mi parte. Aleluya.", "", "PRIMERA LECTURA", "", "En tiempo de cuaresma:", "", "Del libro de la Sabiduría 7, 7-16. 22-30", "EL HOMBRE SABIO, CONOCEDOR DE LAS ESCRITURAS", "", "Oré, y me fue dada la prudencia, supliqué, y descendió sobre mí el espíritu de la Sabiduría. La preferí a los cetros y a los tronos, y tuve por nada las riquezas en comparación con ella. No la igualé a la piedra más preciosa, porque todo el oro, comparado con ella, es un poco de arena; y la plata, a su lado, será considerada como barro. La amé más que a la salud y a la hermosura, y la quise más que a la luz del día, porque su resplandor no tiene ocaso.", "Junto con ella me vinieron todos los bienes, y ella tenía en sus manos una riqueza incalculable. Yo gocé de todos esos bienes, porque la Sabiduría es la que los dirige, aunque ignoraba que ella era su madre. La aprendí con sinceridad y la comunico sin envidia, y a nadie le oculto sus riquezas. Porque ella es para los hombres un tesoro inagotable: los que la adquieren se ganan la amistad de Dios, ya que son recomendados a él por los dones de la instrucción. Invocación a Dios, fuente de Sabiduría.", "Que Dios me conceda hablar con inteligencia, y que mis pensamientos sean dignos de los dones recibidos, porque él mismo es el guía de la Sabiduría y el que dirige a los sabios. En sus manos estamos nosotros y nuestras palabras, y también todo el saber y la destreza para obrar.", "Pues hay en ella un espíritu inteligente, santo, único, múltiple, sutil, ágil, perspicaz, inmaculado, claro, impasible, amante del bien, agudo, incoercible, bienhechor, amigo del hombre, firme, seguro, sereno, que todo lo puede, todo lo observa, penetra todos los espíritus, los inteligentes, los puros, los más sutiles. Porque a todo movimiento supera en movilidad la sabiduría, todo lo atraviesa y penetra en virtud de su pureza.", "Es un hálito del poder de Dios, una emanación pura de la gloria del Todopoderoso, por lo que nada manchado llega a alcanzarla. Es un reflejo de la luz eterna, un espejo sin mancha de la actividad de Dios, una imagen de su bondad.", "Aun siendo sola, lo puede todo; salir de sí misma, todo lo renueva; en todas las edades entra en las almas santas y forma en ellas amigos de Dios y profetas, porque Dios no ama sino a quien vive con la sabiduría. Es ella, en efecto, más bella que el sol, supera a todas las constelaciones; comparada con la luz sale vencedora, porque a la luz sucede la noche, pero contra la sabiduría no prevalece la maldad.", "", "RESPONSORIO Sab 7, 7-8; Sant 1, 5", "", "V. Oré, y me fue dada la prudencia.", "R. Supliqué, y descendió sobre mí el espíritu de la Sabiduría.", "V. Si a alguno de vosotros le falta sabiduría, que la pida a Dios, y la recibirá, porque él la da a todos generosamente, sin exigir nada en cambio.", "R. Supliqué, y descendió sobre mí el espíritu de la Sabiduría.", " ", "En tiempo pascual:", "", "De la primera carta del apóstol san Pablo a los Corintios 2, 1-16", "EL ESPÍRITU PENETRA HASTA LA PROFUNDIDAD DE DIOS", "", "Hermanos, cuando fui a vosotros, no fui con el prestigio de la palabra o de la sabiduría a anunciaros el misterio de Dios, pues no quise saber entre vosotros otra cosa sino a Jesucristo, y éste crucificado. Y me presenté ante vosotros débil, tímido y tembloroso. Y mi palabra y mi predicación no tuvieron nada de los persuasivos discursos de la sabiduría, sino que fueron una demostración del Espíritu y del poder para que vuestra fe se fundase, no en sabiduría de hombres, sino en el poder de Dios. Sin embargo, hablamos de sabiduría entre los perfectos, pero no de sabiduría de este mundo ni de los príncipes de este mundo, abocados a la ruina; sino que hablamos de una sabiduría de Dios, misteriosa, escondida, destinada por Dios desde antes de los siglos para gloria nuestra, desconocida de todos los príncipes de este mundo —pues de haberla conocido no hubieran crucificado al Señor de la Gloria—. Más bien, como dice la Escritura, anunciamos: “lo que ni el ojo vio, ni el oído oyó, ni al corazón del hombre llegó, lo que Dios preparó para los que le aman”. Porque a nosotros nos lo reveló Dios por medio del Espíritu; y el Espíritu todo lo sondea, hasta las profundidades de Dios. En efecto, ¿qué hombre conoce lo íntimo del hombre sino el espíritu del hombre que está en él? Del mismo modo, nadie conoce lo íntimo de Dios, sino el Espíritu de Dios. Y nosotros no hemos recibido el espíritu del mundo, sino el Espíritu que viene de Dios, para conocer las gracias que Dios nos ha otorgado, de las cuales también hablamos, no con palabras aprendidas de sabiduría humana, sino aprendidas del Espíritu, expresando realidades espirituales. El hombre naturalmente no capta las cosas del Espíritu de Dios; son necedad para él. Y no las puede conocer pues sólo espiritualmente pueden ser juzgadas. En cambio, el hombre de espíritu lo juzga todo; y a él nadie puede juzgarle. Porque “¿quién conoció la mente del Señor para instruirle?” Pero nosotros tenemos la mente de Cristo.", "", "RESPONSORIO 1 Co 1, 21. 23. 25", "", "V. Quiso Dios valerse de la necedad de la predicación, para salvar a los creyentes. ", "R. Nosotros predicamos a Cristo crucificado, aleluya.", "V. Pues lo necio de Dios es más sabio que los hombres; y lo débil de Dios es más fuerte que los hombres.", "R. Nosotros predicamos a Cristo crucificado, aleluya.", "", "SEGUNDA LECTURA", "", "Del tratado de san Isidoro, obispo, sobre los oficios eclesiásticos", "(Cap. 5, 1. 2: PL 83, 785)", "EL OBISPO DEBE TENER SU PUERTA ABIERTA A TODO EL QUE LLEGUE", "", "Es preciso que el obispo sobresalga en el conocimiento de las sagradas Escrituras, porque, si solamente puede presentar una vida santa, para sí exclusivamente aprovecha; pero, si es eminente en ciencia y pedagogía, podrá enseñar a los demás y refutar a los contestatarios, quienes, si no se les va a la mano y se les desenmascara, fácilmente seducen a los incautos. El  lenguaje del obispo debe ser limpio, sencillo, abierto, lleno de gravedad y corrección, dulce y suave. Su principal deber es estudiar la santa Biblia, repasar los cánones, seguir el ejemplo de los santos, moderarse en el sueño, comer poco y orar mucho, mantener la paz con los hermanos, a nadie tener en menos, no condenar a ninguno si no estuviere convicto, no excomulgar sino a los incorregibles. Sobresalga tanto en la humildad como en la autoridad, para que, ni por apocamiento queden por corregir los desmanes, ni por exceso de autoridad atemorice a los súbditos. Esfuércese en abundar en la caridad, sin la cual toda virtud es nada. Ocúpese con particular diligencia del cuidado de los pobres, alimente a los hambrientos, vista al desnudo, acoja al peregrino, redima al cautivo, sea amparo de viudas y huérfanos. Debe dar tales pruebas de hospitalidad que a todo el mundo abra sus puertas con caridad y benignidad. Si todo fiel cristiano debe procurar que Cristo le diga: Fui forastero y me hospedasteis, cuánto más el obispo, cuya residencia es la casa de todos. Un seglar cumple con el deber de hospitalidad abriendo su casa a algún que otro peregrino. El obispo, si no tiene su puerta abierta a todo el que llegue, es un hombre sin corazón.", "", "RESPONSORIO Mt 25,35-36; 1 Tm 3, 2-3", "", "V. Venid vosotros, benditos de mi Padre; heredad el reino preparado para vosotros, porque tuve hambre y me disteis de comer, tuve sed y me disteis de beber.", "R. Fui forastero y me hospedasteis, estuve desnudo y me vestisteis, enfermo y me visitasteis, en la cárcel y vinisteis a verme. Aleluya.", "V. El obispo tiene que ser irreprochable, hospitalario, hábil para enseñar, desinteresado.", "R. Fui forastero y me hospedasteis, estuve desnudo y me vestisteis, enfermo y me visitasteis, en la cárcel y vinisteis a verme. Aleluya.", "", "HIMNO TE DEUM", "", "A ti, oh Dios, te alabamos,", "a Ti, Señor, te reconocemos.", " ", "A ti, eterno Padre,", "te venera toda la creación.", " ", "Los ángeles todos, los cielos", "y todas las potestades te honran.", " ", "Los querubines y serafines", "te cantan sin cesar:", " ", "Santo, Santo, Santo es el Señor,", "Dios del universo.", " ", "Los cielos y la tierra", "están llenos de la majestad de tu gloria.", " ", "A ti te ensalza", "el glorioso coro de los apóstoles,", "la multitud admirable de los profetas,", "el blanco ejército de los mártires.", " ", "A ti la Iglesia santa,", "extendida por toda la tierra,", "te aclama:", " ", "Padre de inmensa majestad,", "Hijo único y verdadero, digno de adoración,", "Espíritu Santo, Defensor.", " ", "Tú eres el Rey de la gloria, Cristo.", "Tú eres el Hijo único del Padre.", " ", "Tú, para liberar al hombre,", "aceptaste la condición humana", "sin desdeñar el seno de la Virgen.", " ", "Tú, rotas las cadenas de la muerte,", "abriste a los creyentes el reino del cielo.", " ", "Tú te sientas a la derecha de Dios", "en la gloria del Padre.", " ", "Creemos que un día", "has de venir como juez.", " ", "Te rogamos, pues,", "que vengas en ayuda de tus siervos,", "a quienes redimiste con tu preciosa sangre.", " ", "Haz que en la gloria eterna", "nos asociemos a tus santos.", "", "ORACIÓN", "", "SEÑOR, Dios todopoderoso,", "tú elegiste a San Isidoro, obispo y doctor de la Iglesia,", "para que fuese testimonio y fuente", "del humano saber,", "concédenos, por su intercesión, una búsqueda atenta", "y una aceptación generosa de tu eterna verdad.", "Por nuestro Señor Jesucristo.", "", "CONCLUSIÓN", "", "V. Bendigamos al Señor.  ", "R. Demos gracias a Dios."],
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
          '',
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
