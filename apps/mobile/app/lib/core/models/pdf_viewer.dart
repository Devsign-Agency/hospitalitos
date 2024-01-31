import 'dart:convert';

class PdfViewer {
  PdfViewer({
    required this.id,
    required this.name,
    required this.image,
  });

  String id;
  String name;
  String image;

  // factory PdfViewer.fromJson(Map<String, dynamic> json) => PdfViewer(
  //       id: json['id'],
  //       name: json['name'],
  //       image: json['image'],
  //     );

  factory PdfViewer.fromJson(String str) => PdfViewer.fromMap(json.decode(str));

  factory PdfViewer.fromMap(Map<String, dynamic> json) => PdfViewer(
        id: json['id'],
        name: json['name'],
        image: json['image'],
      );
}
