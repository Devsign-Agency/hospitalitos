import 'package:mobile_app/core/models/category.response.dart';

abstract class JSONParseable {

    static T fromJson<T extends JSONParseable>(Map<String, dynamic> json) {
      switch(T) {
        case Category: 
          return Category.fromJson(json) as T;
        default:
          return Category.fromJson(json) as T;
      }
    }

    Map<String, dynamic> toJson();
}