// To parse this JSON data, do
//
//     final loginResponse = loginResponseFromJson(jsonString);

import 'dart:convert';

import 'package:mobile_app/core/models/user.dart';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        required this.user,
        required this.userId,
        required this.accessToken,
        required this.refreshToken,
    });

    User user;
    String userId;
    String accessToken;
    String refreshToken;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        user: User.fromJson(json['user']),
        userId: json['userId'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
    );

    Map<String, dynamic> toJson() => {
        'user': user.toJson(),
        'userId': userId,
        'accessToken': accessToken,
        'refreshToken': refreshToken,
    };
}

