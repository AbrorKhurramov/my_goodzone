class BrandResponse {
 late List<Brands> brands;
  String? count;

  BrandResponse({required this.brands, this.count});

  BrandResponse.fromJson(Map<String, dynamic> json) {
    if (json['brands'] != null) {
      brands = <Brands>[];
      json['brands'].forEach((v) {
        brands.add(Brands.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['brands'] = brands.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

class Brands {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? previewText;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? order;

  Brands(
      {this.id,
        this.name,
        this.slug,
        this.active,
        this.previewText,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt,
        this.order});

  Brands.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    previewText = json['preview_text'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['active'] = active;
    data['preview_text'] = previewText;
    data['description'] = description;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['order'] = order;
    return data;
  }
}
