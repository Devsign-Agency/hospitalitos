import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/constants/constants.dart';
import 'package:mobile_app/core/models/refresh_token.response.dart';

class RefreshTokenService with ChangeNotifier {
  static Future refreshTokenRequest() async {
    final storage = FlutterSecureStorage();

    final refreshToken = await storage.read(key: Constants.refreshTokenKey);
    final data = {Constants.refreshTokenKey: refreshToken};

    final url = Uri.parse('${Constants.apiUrl}/${Constants.refreshTokenUri}');
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
      body: jsonEncode(data),
    );

    final refreshResponse =
        RefreshTokenResponse.fromJson(jsonDecode(response.body));
    return refreshResponse;
  }
}
