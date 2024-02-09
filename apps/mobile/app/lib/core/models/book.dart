import 'dart:convert';

class Book {
  Book({
    required this.id,
    required this.name,
    required this.image,
    this.author,
    this.datePublish,
    this.path,
  });

  String id;
  String name;
  String image;
  String? author;
  String? datePublish;
  String? path;

  // factory Book.fromJson(Map<String, dynamic> json) => Book(
  //       id: json['id'],
  //       name: json['name'],
  //       image: json['image'],
  //     );

  factory Book.fromJson(String str) => Book.fromMap(json.decode(str));

  factory Book.fromMap(Map<String, dynamic> json) => Book(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        author: json['author'] ?? '',
        datePublish: json['date_publish'] ?? '',
        path: json['path'] ?? '',
      );
}
