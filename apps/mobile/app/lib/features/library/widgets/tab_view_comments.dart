import 'package:flutter/material.dart';

import '../../../core/app_export.dart';
import '../../../core/models/chat.dart';
import 'widgets.dart';

class TabViewComments extends StatelessWidget {
  const TabViewComments({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        children: [
          FutureBuilder(
            future: getComments(),
            builder: (_, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // Si estamos cargando los datos, mostramos un indicador de carga
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                // Si hubo un error al cargar los datos, mostramos un mensaje de error
                return Center(child: Text('Error al cargar los datos'));
              } else {
                // Si los datos se cargaron correctamente, los mostramos en un ListView
                final List<Chat> chatList = [
                  Chat(
                      id: '123',
                      title: 'Obi wan',
                      date: 'Hace 5 días',
                      image: 'img_image11.png',
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                      commentList: [1, 2, 3]),
                  Chat(
                      id: '123',
                      title: 'Obi wan',
                      date: 'Hace 5 días',
                      image: 'img_image11.png',
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  Chat(
                      id: '123',
                      title: 'Obi wan',
                      date: 'Hace 5 días',
                      image: 'img_image11.png',
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  Chat(
                      id: '123',
                      title: 'Obi wan',
                      date: 'Hace 5 días',
                      image: 'img_image11.png',
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                  Chat(
                      id: '123',
                      title: 'Obi wan',
                      date: 'Hace 5 días',
                      image: 'img_image11.png',
                      comment:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
                ];
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        return ChatBox(
                            item: chatList[index],
                            color: ColorConstant.gray400,
                            width: double.infinity,
                            margin: 10);
                      },
                      separatorBuilder: (_, __) => SizedBox(height: 8),
                      itemCount: 5),
                );
              }
            },
          ),

          // Widget that displays a text bar to write a message
          BottomChatBar(),
        ],
      ),
    );
  }

  Future<dynamic> getComments() {
    return Future.delayed(Duration(seconds: 2));
  }
}
