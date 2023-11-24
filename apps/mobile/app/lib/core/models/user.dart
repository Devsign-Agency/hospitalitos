// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';
import './category.response.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        this.documentId,
        required this.username,
        required this.email,
        required this.emailVerified,
        required this.firstname,
        this.lastname,
        required this.photoUrl,
        required this.role,
        this.preferences = const [],
        this.googleId,
    });

    DateTime createdAt;
    DateTime updatedAt;
    String id;
    dynamic documentId;
    String username;
    String email;
    bool emailVerified;
    String? firstname;
    String? lastname;
    String? photoUrl;
    List<String> role;
    List<Category> preferences;
    dynamic googleId;

    factory User.fromJson(Map<String, dynamic> json) => User(
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        id: json['id'],
        documentId: json['documentId'],
        username: json['username'],
        email: json['email'],
        emailVerified: json['emailVerified'],
        firstname: json['firstname'],
        lastname: json['lastname'],
        photoUrl: json['photoUrl'],
        role: List<String>.from(json['role'].map((x) => x)),
        preferences: List<Category>.from(json['preferences'].map((x) => Category.fromJson(x))),
        googleId: json['googleId'],
    );

    Map<String, dynamic> toJson() => {
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'id': id,
        'documentId': documentId,
        'username': username,
        'email': email,
        'emailVerified': emailVerified,
        'firstname': firstname,
        'lastname': lastname,
        'photoUrl': photoUrl,
        'role': List<dynamic>.from(role.map((x) => x)),
        'preferences': List<dynamic>.from(preferences.map((x) => x.toJson())),
        'googleId': googleId,
    };
}
