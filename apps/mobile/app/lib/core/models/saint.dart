import 'dart:convert';

class Saint {
  String name;
  String description;
  String? image;

  Saint({required this.name, required this.description, this.image});

  factory Saint.fromJson(String str) => Saint.fromMap(json.decode(str));

  factory Saint.fromMap(Map<String, dynamic> json) => Saint(
      name: json['name'],
      description: json['description'],
      image: json['image']);
}
