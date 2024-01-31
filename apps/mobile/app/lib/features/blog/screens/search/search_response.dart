// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

List<SearchResponse> searchResponseFromJson(String str) => List<SearchResponse>.from(json.decode(str).map((x) => SearchResponse.fromJson(x)));

String searchResponseToJson(List<SearchResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SearchResponse {
    int id;
    String title;
    String url;
    Type type;
    Type subtype;
    Links links;

    SearchResponse({
        required this.id,
        required this.title,
        required this.url,
        required this.type,
        required this.subtype,
        required this.links,
    });

    factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
        id: json["id"],
        title: json["title"],
        url: json["url"],
        type: typeValues.map[json["type"]]!,
        subtype: typeValues.map[json["subtype"]]!,
        links: Links.fromJson(json["_links"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "url": url,
        "type": typeValues.reverse[type],
        "subtype": typeValues.reverse[subtype],
        "_links": links.toJson(),
    };
}

class Links {
    List<Self> self;
    List<About> about;
    List<About> collection;

    Links({
        required this.self,
        required this.about,
        required this.collection,
    });

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        self: List<Self>.from(json["self"].map((x) => Self.fromJson(x))),
        about: List<About>.from(json["about"].map((x) => About.fromJson(x))),
        collection: List<About>.from(json["collection"].map((x) => About.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "self": List<dynamic>.from(self.map((x) => x.toJson())),
        "about": List<dynamic>.from(about.map((x) => x.toJson())),
        "collection": List<dynamic>.from(collection.map((x) => x.toJson())),
    };
}

class About {
    String href;

    About({
        required this.href,
    });

    factory About.fromJson(Map<String, dynamic> json) => About(
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
    };
}

class Self {
    bool embeddable;
    String href;

    Self({
        required this.embeddable,
        required this.href,
    });

    factory Self.fromJson(Map<String, dynamic> json) => Self(
        embeddable: json["embeddable"],
        href: json["href"],
    );

    Map<String, dynamic> toJson() => {
        "embeddable": embeddable,
        "href": href,
    };
}

enum Type {
    POST
}

final typeValues = EnumValues({
    "post": Type.POST
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
