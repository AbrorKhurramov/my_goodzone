// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ShopDetail shopDetailFromJson(String str) => ShopDetail.fromJson(json.decode(str));

String shopDetailToJson(ShopDetail data) => json.encode(data.toJson());

class ShopDetail {
  List<ShopElement>? shops;
  ShopDetail({
    this.shops,
  });



  ShopDetail.fromJson(Map<String, dynamic> json) {
    shops = List<ShopElement>.from(json["shops"].map((x) => ShopElement.fromJson(x)));
  }

  Map<String, dynamic> toJson() => {
    "shops": List<dynamic>.from(shops!.map((x) => x.toJson())),
  };
}

class ShopElement {
  ShopElement({
     this.shop,
     this.quantity,
  });

  Shop? shop;
  int? quantity;

   ShopElement.fromJson(Map<String, dynamic> json) {
     shop =
     Shop.fromJson(json["shop"])
     ;
     quantity = json["quantity"];
     }

  Map<String, dynamic> toJson() => {
    "shop": shop!.toJson(),
    "quantity": quantity,
  };
}

class Shop {
  Shop({
  this.id,
  this.name,
  this.slug,
  this.phone,
  this.workingHours,
  this.address,
  this.address2,
  this.active,
  this.previewText,
  this.image,
  this.loc,
  this.externalId,
  });

  String? id;
  String? name;
  String? slug;
  String? phone;
  String? workingHours;
  String? address;
  String? address2;
  bool? active;
  String? previewText;
  String? image;
  Loc? loc;
  String? externalId;

   Shop.fromJson(Map<String, dynamic> json) {
     id = json["id"];
    name = json["name"];
    slug = json["slug"];
    phone = json["phone"];
    workingHours = json["working_hours"];
    address =json["address"];
    address2 =json["address2"];
    active = json["active"];
    previewText = json["preview_text"];
    image = json["image"];
    externalId =json["external_id"];
       }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "phone": phone,
    "working_hours": workingHours,
    "address": address,
    "address2": address2,
    "active": active,
    "preview_text": previewText,
    "image": image,
    "loc": loc!.toJson(),
    "external_id": externalId,
  };
}

class Loc {
  Loc({
     this.long,
     this.lat,
  });

  double? long;
  double? lat;

  Loc.fromJson(Map<String, dynamic> json){
    long =
    json["long"].toDouble();
    lat =
    json["lat"].toDouble();
  }

  Map<String, dynamic> toJson() => {
    "long": long,
    "lat": lat,
  };
}
