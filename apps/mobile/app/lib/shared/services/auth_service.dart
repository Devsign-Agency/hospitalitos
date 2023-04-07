import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/constants/constants.dart';
import 'package:mobile_app/core/models/login.response.dart';
import 'package:mobile_app/core/models/user.dart';
import 'package:mobile_app/shared/providers/interceptor.dart';

class AuthService with ChangeNotifier {
  final apiUrl = Constants.apiUrl;
  late User user;
  bool _authenticating = false;
  final _storage = FlutterSecureStorage();

  bool get authenticating => _authenticating;
  set authenticating(bool value) {
    _authenticating = value;
    notifyListeners();
  }

  static Future<String> getToken() async {
    final storage = FlutterSecureStorage();
    final token = await storage.read(key: Constants.accessTokenKey);
    return token!;
  }

  static Future<void> deleteToken() async {
    final storage = FlutterSecureStorage();
    await storage.delete(key: Constants.accessTokenKey);
    await storage.delete(key: Constants.refreshTokenKey);
  }

  Future<bool> login(String email, String password) async {
    bool isValid = false;
    authenticating = true;
    try {
      final data = {'username': email, 'password': password};

      final url = Uri.parse('$apiUrl/${Constants.authUri}');
      final response = await http.post(
        url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        final loginResponse = LoginResponse.fromJson(jsonDecode(response.body));
        user = loginResponse.user;

        await _saveToken(loginResponse.accessToken);
        await _saveRefreshToken(loginResponse.refreshToken);

        isValid = true;
      }
    } catch (e) {
        print(e);
    }
    authenticating = false;
    return isValid;
  }

  Future<bool> isLoggedIn() async {
    final token = await _storage.read(key: Constants.accessTokenKey);
    print(token);
    if (token == null || token.isEmpty) {
        return false;
    }

    final http_ = HttpInterceptor();

    try {
      final response = await http_.get('auth');
      print(response);
    } catch (e) {
      print(e);
      return false;
    }
    return true;
  }

  Future _saveToken(String token) async {
    return await _storage.write(key: Constants.accessTokenKey, value: token);
  }

  Future _saveRefreshToken(String token) async {
    return await _storage.write(key: Constants.refreshTokenKey, value: token);
  }

  Future logout() async {
    await _storage.delete(key: Constants.accessTokenKey);
    await _storage.delete(key: Constants.refreshTokenKey);
  }
}
