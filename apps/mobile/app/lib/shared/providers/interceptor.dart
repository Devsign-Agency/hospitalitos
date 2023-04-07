import 'dart:convert';
import 'dart:io';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:mobile_app/core/constants/constants.dart';
import 'package:mobile_app/core/models/refresh_token.response.dart';

import '../services/refresh_token.service.dart';

//IMP http_interceptor and http plugin used for this

// 1 Interceptor class
class AuthorizationInterceptor implements InterceptorContract {
  final _storage = FlutterSecureStorage();

  // We need to intercept request
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    try {
      // Fetching token from your locacl data
      var token = await _storage.read(key: Constants.accessTokenKey);

      // Clear previous header and update it with updated token
      data.headers.clear();

      data.headers['authorization'] = 'Bearer ${token!}';
      data.headers['content-type'] = 'application/json';
    } catch (e) {
      print(e);
    }

    return data;
  }

  // Currently we do not have any need to intercept response
  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

//2 Retry Policy
//This is where request retry
class ExpiredTokenRetryPolicy extends RetryPolicy {
  //Number of retry
  @override
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    //This is where we need to update our token on 401 response
    if (response.statusCode == 401) {
      //Refresh your token here. Make refresh token method where you get new token from
      //API and set it to your local data
      await HttpInterceptor
          .refreshToken(); //Find bellow the code of this function
      return true;
    }
    return false;
  }
}

//3 API Class where we have request methods
class HttpInterceptor {

  late InterceptedClient client;
  static final HttpInterceptor _instance = HttpInterceptor._();

  factory HttpInterceptor() {
    return _instance;
  }

  HttpInterceptor._() {
    client = InterceptedClient.build(
      interceptors: [AuthorizationInterceptor()],
      retryPolicy: ExpiredTokenRetryPolicy());
  }

  Future<Map<String, String>> parseHeaders(Map<String, String>? headers) async {
    headers ??= {};
    if (!headers.containsKey('Content-Type')) {
      headers.addAll({'Content-Type': 'application/json'});
    }
    if (!headers.containsKey('Accept')) {
      headers.addAll({'Accept': 'application/json'});
    }

    final storage = FlutterSecureStorage();
    var token = await storage.read(key: Constants.accessTokenKey);
    headers.addAll({'Authorization': 'Bearer $token'});

    return headers;
  }

  Future<dynamic> get(String endPoint,
      {String base = Constants.apiUrl,
      Map<String, String>? headers,
      Map<String, dynamic>? params}) async {
    http.Response response;
    try {
      headers = await parseHeaders(headers);
      //Request with interceptor client
      response = await client.get(Uri.parse('$base/$endPoint'), headers: headers, params: params);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(Constants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  Future<dynamic> post(String endPoint,
      {String base = Constants.apiUrl,
      Map<String, String>? headers,
      Map<String, dynamic>? params,
      Object? body,
      Encoding? encoding,}) async {
    http.Response response;
    try {
      headers = await parseHeaders(headers);
      //Request with interceptor client
      response = await client.post(Uri.parse('$base/$endPoint'), body: body, headers: headers, params: params, encoding: encoding);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(Constants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  Future<dynamic> put(String endPoint,
      {String base = Constants.apiUrl,
      Map<String, String>? headers,
      Map<String, dynamic>? params,
      Object? body,
      Encoding? encoding,}) async {
    http.Response response;
    try {
      headers = await parseHeaders(headers);
      //Request with interceptor client
      response = await client.put(Uri.parse('$base/$endPoint'), body: body, headers: headers, params: params, encoding: encoding);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(Constants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  Future<dynamic> patch(String endPoint,
      {String base = Constants.apiUrl,
      Map<String, String>? headers,
      Map<String, dynamic>? params,
      Object? body,
      Encoding? encoding,}) async {
    http.Response response;
    try {
      headers = await parseHeaders(headers);
      //Request with interceptor client
      response = await client.patch(Uri.parse('$base/$endPoint'), body: body, headers: headers, params: params, encoding: encoding);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(Constants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  Future<dynamic> delete(String endPoint,
      {String base = Constants.apiUrl,
      Map<String, String>? headers,
      Map<String, dynamic>? params,
      Object? body,
      Encoding? encoding,}) async {
    http.Response response;
    try {
      headers = await parseHeaders(headers);
      //Request with interceptor client
      response = await client.delete(Uri.parse('$base/$endPoint'), body: body, headers: headers, params: params, encoding: encoding);
    } on SocketException {
      throw FetchDataException(Constants.noInternetMsg);
    } on FormatException {
      throw FetchDataException(Constants.badResponseFormat);
    }

    return _returnResponse(response);
  }

  _returnResponse(http.Response response) {
    String responseJson = response.body;
    final jsonResponse = jsonDecode(responseJson);
    switch (response.statusCode) {
      case 200:
        return jsonResponse;
      case 400:
        throw BadRequestException(
            jsonResponse['message'] ?? Constants.exceptionMessage);
      case 401:
        throw InvalidInputException(
            jsonResponse['message'] ?? Constants.exceptionMessage);
      case 403:
        throw UnauthorisedException(
            jsonResponse['message'] ?? Constants.exceptionMessage);
      case 404:
        throw FetchDataException(
            jsonResponse['message'] ?? Constants.exceptionMessage);
      case 500:
      default:
        throw FetchDataException(
            jsonResponse['message'] ?? Constants.exceptionMessage);
    }
  }

  //4
  // This piecce of code has nothing to do with interceptor
  // This is for those who need to know how to refresh the token using REST API
  static Future<void> refreshToken() async {
    print('refresh token hit');
    final storage = FlutterSecureStorage();
    try {
      RefreshTokenResponse response =
          await RefreshTokenService.refreshTokenRequest();
      print(response.accessToken);
      //Here we are updating our token on local storage
      await storage.write(
          key: Constants.accessTokenKey, value: response.accessToken);
    } catch (e) {
      print('catch on refresh');
      print(e);
    }
  }

  static FetchDataException(param0) {}

  static BadRequestException(param0) {}

  static InvalidInputException(param0) {}

  static UnauthorisedException(param0) {}
}
