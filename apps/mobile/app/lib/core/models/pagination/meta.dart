// To parse this JSON data, do
//
//     final meta = metaFromJson(jsonString);

import 'dart:convert';

Meta metaFromJson(String str) => Meta.fromJson(json.decode(str));

String metaToJson(Meta data) => json.encode(data.toJson());

class Meta {
    int page;
    int take;
    int itemCount;
    int pageCount;
    bool hasPreviousPage;
    bool hasNextPage;

    Meta({
        required this.page,
        required this.take,
        required this.itemCount,
        required this.pageCount,
        required this.hasPreviousPage,
        required this.hasNextPage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        page: json['page'],
        take: json['take'],
        itemCount: json['itemCount'],
        pageCount: json['pageCount'],
        hasPreviousPage: json['hasPreviousPage'],
        hasNextPage: json['hasNextPage'],
    );

    Map<String, dynamic> toJson() => {
        'page': page,
        'take': take,
        'itemCount': itemCount,
        'pageCount': pageCount,
        'hasPreviousPage': hasPreviousPage,
        'hasNextPage': hasNextPage,
    };
}
