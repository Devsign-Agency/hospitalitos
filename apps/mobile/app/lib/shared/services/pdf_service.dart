import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_app/core/models/pdf_viewer.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfService with ChangeNotifier {
  PdfService() {
    openAssetsFolderPdf();
  }

  Future<List<PdfViewer>> openAssetsFolderPdf() async {
    String response = await rootBundle.loadString('assets/json/pdf.json');
    final Map<dynamic, dynamic> data = json.decode(response);

    final List<dynamic> items = data['items'];

    List<PdfViewer> pdfViewerList = items.map((item) {
      return PdfViewer.fromMap(item);
    }).toList();

    return pdfViewerList;
  }

  static Future<List<SfPdfViewer>> openAssetFolder(String folder) async {
    final manifestContent = await rootBundle.loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);

    final pdfPaths = manifestMap.keys
        .where((String key) => key.contains(folder))
        .where((String key) => key.contains('.pdf'))
        .toList();

    List<SfPdfViewer> list = [];

    for (var path in pdfPaths) {
      final GlobalKey<SfPdfViewerState> _pdfViewerKey = GlobalKey();

      final byteData = await rootBundle.load(path);
      final bytes = byteData.buffer.asUint8List();
      SfPdfViewer pdf = SfPdfViewer.memory(
        bytes,
        key: _pdfViewerKey,
        canShowScrollStatus: false,
        canShowScrollHead: false,
        onDocumentLoaded: (i) {
          print('Libro cargo correctamennte: $i');
        },
        // interactionMode: PdfInteractionMode.,KC
      );
      // EpubBook book = await EpubReader.readBook(bytes);
      list.add(pdf);
    }
    return list;
  }
}
