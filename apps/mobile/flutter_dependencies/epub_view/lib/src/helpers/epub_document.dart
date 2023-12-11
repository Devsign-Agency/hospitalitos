import 'dart:convert';

import 'package:epubx/epubx.dart';
import 'package:flutter/services.dart';
import 'package:universal_file/universal_file.dart';

class EpubDocument {
  static Future<EpubBook> openAsset(String assetName) async {
    final byteData = await rootBundle.load(assetName);
    final bytes = byteData.buffer.asUint8List();
    return EpubReader.readBook(bytes);
  }

  static Future<List<EpubBook>> openAssetFolder(String folder) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final epubPaths = manifestMap.keys
        .where((String key) => key.contains(folder))
        .where((String key) => key.contains('.epub'))
        .toList();

    List<EpubBook> list = [];

    for (var path in epubPaths) {
      final byteData = await rootBundle.load(path);
      final bytes = byteData.buffer.asUint8List();
      EpubBook book = await EpubReader.readBook(bytes);
      list.add(book);
    }

    return list;
  }

  static Future<EpubBook> openData(Uint8List bytes) async {
    return EpubReader.readBook(bytes);
  }

  static Future<EpubBook> openFile(File file) async {
    final bytes = await file.readAsBytes();
    return EpubReader.readBook(bytes);
  }
}
