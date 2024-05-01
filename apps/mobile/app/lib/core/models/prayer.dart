import 'dart:convert';

class Prayer {
  String title;
  String prayer;

  Prayer({
    required this.title,
    required this.prayer,
  });

  factory Prayer.fromJson(String str) => Prayer.fromMap(json.decode(str));

  factory Prayer.fromMap(Map<String, dynamic> json) => Prayer(
        title: json['title'],
        prayer: json['prayer'],
      );
}
