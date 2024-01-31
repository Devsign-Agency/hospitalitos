import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfImage extends StatelessWidget {
  const PdfImage({
    super.key,
    required this.pdf,
  });

  final SfPdfViewer pdf;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Container(
          width: double.infinity,
          height: 150.0,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          child: pdf),
    );
  }
}
