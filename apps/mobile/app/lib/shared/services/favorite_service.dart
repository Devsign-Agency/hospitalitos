import 'package:flutter/material.dart';

import '../../core/app_export.dart';
import '../../core/models/list_view_favorite.dart';

class FavoriteService extends ChangeNotifier {
  List<Map<String, dynamic>> categories = [];
  List<ListViewFavoriteModel> favorites = [
    ListViewFavoriteModel(id: '', title: 'Título'),
    ListViewFavoriteModel(id: '', title: 'Título'),
    ListViewFavoriteModel(id: '', title: 'Título'),
    ListViewFavoriteModel(id: '', title: 'Título'),
  ];
  FavoriteService() {
    categories = [
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgDownloadGray30024x24,
        'title': 'Descargando',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
      {
        'icon': ImageConstant.imgPlay,
        'title': 'Sin empezar',
        'action': _handleActions
      },
    ];
  }

  void _handleActions() {
    print('You have clicked!');
  }
}
