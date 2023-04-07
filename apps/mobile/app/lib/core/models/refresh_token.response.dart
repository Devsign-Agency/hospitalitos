import 'dart:convert';

RefreshTokenResponse loginResponseFromJson(String str) => RefreshTokenResponse.fromJson(json.decode(str));

String loginResponseToJson(RefreshTokenResponse data) => json.encode(data.toJson());

class RefreshTokenResponse {
    RefreshTokenResponse({
        required this.accessToken,
    });

    String accessToken;

    factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => RefreshTokenResponse(
        accessToken: json['accessToken'],
    );

    Map<String, dynamic> toJson() => {
        'accessToken': accessToken,
    };
}

