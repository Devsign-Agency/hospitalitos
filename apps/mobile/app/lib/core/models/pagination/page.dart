// To parse this JSON data, do
//
//     final page = pageFromJson(jsonString);

import 'dart:convert';
import './meta.dart';
import '../json_parseable.dart';

Page pageFromJson(String str) => Page.fromJson(json.decode(str));

String pageToJson(Page data) => json.encode(data.toJson());

class Page<T extends JSONParseable> {
    List<T> data;
    Meta meta;

    Page({
        required this.data,
        required this.meta,
    });

  factory Page.fromJson(Map<String, dynamic> json) => Page(
        data: List<T>.from(json['data'].map((x) =>  JSONParseable.fromJson(x))),
        meta: Meta.fromJson(json['meta']),
    );

    Map<String, dynamic> toJson() => {
        'data': List<dynamic>.from(data.map((x) => x.toJson())),
        'meta': meta.toJson(),
    };
}

class Datum {
    DateTime createdAt;
    DateTime updatedAt;
    String id;
    String name;

    Datum({
        required this.createdAt,
        required this.updatedAt,
        required this.id,
        required this.name,
    });

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        createdAt: DateTime.parse(json['createdAt']),
        updatedAt: DateTime.parse(json['updatedAt']),
        id: json['id'],
        name: json['name'],
    );

    Map<String, dynamic> toJson() => {
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
        'id': id,
        'name': name,
    };
}