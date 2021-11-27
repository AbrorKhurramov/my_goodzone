// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

import 'package:my_goodzone/data/models/popular/popular_response.dart';

FeaturedListResponse welcomeFromJson(String str) =>
    FeaturedListResponse.fromJson(json.decode(str));

String welcomeToJson(FeaturedListResponse data) => json.encode(data.toJson());

class FeaturedListResponse {
  FeaturedListResponse({
    required this.featuredLists,
  });

  List<FeaturedList> featuredLists;

  factory FeaturedListResponse.fromJson(Map<String, dynamic> json) =>
      FeaturedListResponse(
        featuredLists: List<FeaturedList>.from(
            json["featured_lists"].map((x) => FeaturedList.fromJson(x))),
      );

  Map<String, dynamic> toJson() =>
      {
        "featured_lists": List<dynamic>.from(
            featuredLists.map((x) => x.toJson())),
      };
}

class FeaturedList {
  FeaturedList({
    required this.id,
    required this.title,
    required this.slug,
    required this.products,
    required this.order,
    required this.createdAt,
    required this.lang,
    required this.active,
    required this.description,
  });

 late String id;
  late String title;
  late String slug;
  late List<Products> products;
  late String order;
  late String createdAt;
  late String lang;
  late bool active;
  late String description;


  FeaturedList.fromJson(Map<String, dynamic> json) {
    id:
    json["id"]
    ;
    title: json["title"];
    slug: json["slug"];
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }

    order: json["order"];
    createdAt: json["created_at"];
    lang: json["lang"];
    active: json["active"];
    description: json["description"];
    }

  Map<String, dynamic> toJson() =>
      {
        "id": id,
        "title": title,
        "slug": slug,
        "products": List<dynamic>.from(products.map((x) => x)),
        "order": order,
        "created_at": createdAt,
        "lang": lang,
        "active": active,
        "description": description,
      };
}
