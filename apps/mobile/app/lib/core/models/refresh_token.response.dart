import 'dart:convert';

RefreshTokenResponse refreshResponseFromJson(String str) => RefreshTokenResponse.fromJson(json.decode(str));

String refreshResponseToJson(RefreshTokenResponse data) => json.encode(data.toJson());

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

