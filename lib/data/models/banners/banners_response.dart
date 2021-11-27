

class BannerResponse {
  late List<Banners> banners;
  String? count;

  BannerResponse({required this.banners, this.count});

  BannerResponse.fromJson(Map<String, dynamic> json) {
    if (json['banners'] != null) {
      banners =<Banners>[];
      json['banners'].forEach((v) {
        banners.add(Banners.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['banners'] = banners.map((v) => v.toJson()).toList();
    data['count'] = count;
    return data;
  }
}

class Banners {
  String? id;
  String? title;
  Position? position;
  bool? active;
  String? image;
  String? url;
  String? description;
  String? createdAt;
  String? updatedAt;

  Banners(
      {this.id,
        this.title,
        this.position,
        this.active,
        this.image,
        this.url,
        this.description,
        this.createdAt,
        this.updatedAt});

  Banners.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    position = json['position'] != null
        ? Position.fromJson(json['position'])
        : null;
    active = json['active'];
    image = json['image'];
    url = json['url'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['active'] = active;
    data['image'] = image;
    data['url'] = url;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Position {
  String? id;
  String? title;
  String? slug;
  bool? active;
  String? size;
  String? description;
  String? createdAt;
  String? updatedAt;

  Position(
      {this.id,
        this.title,
        this.slug,
        this.active,
        this.size,
        this.description,
        this.createdAt,
        this.updatedAt});

  Position.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    active = json['active'];
    size = json['size'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['active'] = active;
    data['size'] = size;
    data['description'] = description;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
