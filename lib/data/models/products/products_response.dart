class ProductDetail {
  Product? product;

  ProductDetail({this.product});

  ProductDetail.fromJson(Map<String, dynamic> json) {
    product =
    json['product'] != null ? Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (product != null) {
      data['product'] = product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? slug;
  CategoryDetail? category;
  dynamic additionalCategories;
  List<RelatedProducts>? relatedProducts;
  Brand? brand;
  String? previewText;
  String? description;
  bool? active;
  dynamic properties;
  List<Prices>? prices;
  Price? price;
  String? image;
  List<String>? gallery;
  dynamic averageRate;
  String? reviewsCount;
  Meta? meta;
  String? externalId;
  String? code;
  String? createdAt;
  String? updatedAt;
  InStock? inStock;

  Product(
      {this.id,
        this.name,
        this.slug,
        this.category,
        this.additionalCategories,
        this.relatedProducts,
        this.brand,
        this.previewText,
        this.description,
        this.active,
        this.properties,
        this.prices,
        this.price,
        this.image,
        this.gallery,
        this.averageRate,
        this.reviewsCount,
        this.meta,
        this.externalId,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.inStock});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null
        ? CategoryDetail.fromJson(json['category'])
        : null;
    additionalCategories = json['additional_categories'];
    relatedProducts = <RelatedProducts>[];
    if (json['related_products'] != null) {
      json['related_products'].forEach((v) {
        relatedProducts!.add(RelatedProducts.fromJson(v));
      });
    }
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    previewText = json['preview_text'];
    description = json['description'];
    active = json['active'];
    properties = json['properties'];
    prices = <Prices>[];
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    image = json['image'];
    gallery = [];
    if (json['gallery'] != null) gallery = json['gallery'].cast<String>();
    averageRate = json['average_rate'];
    reviewsCount = json['reviews_count'];
    meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
    externalId = json['external_id'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inStock = json['in_stock'] != null
        ? InStock.fromJson(json['in_stock'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['additional_categories'] = additionalCategories;
    if (relatedProducts != null) {
      data['related_products'] =
          relatedProducts!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['preview_text'] = previewText;
    data['description'] = description;
    data['active'] = active;
    data['properties'] = properties;
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    if (price != null) {
      data['price'] = price!.toJson();
    }
    data['image'] = image;
    data['gallery'] = gallery;
    data['average_rate'] = averageRate;
    data['reviews_count'] = reviewsCount;
    if (meta != null) {
      data['meta'] = meta!.toJson();
    }
    data['external_id'] = externalId;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (inStock != null) {
      data['in_stock'] = inStock!.toJson();
    }
    return data;
  }
}

class CategoryDetail {
  String? id;
  String? name;
  String? slug;
  Parent? parent;
  bool? active;
  String? order;
  String? image;

  CategoryDetail(
      {this.id,
        this.name,
        this.slug,
        this.parent,
        this.active,
        this.order,
        this.image});

  CategoryDetail.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent =
    json['parent'] != null ? Parent.fromJson(json['parent']) : null;
    active = json['active'];
    order = json['order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (parent != null) {
      data['parent'] = parent!.toJson();
    }
    data['active'] = active;
    data['order'] = order;
    data['image'] = image;
    return data;
  }
}

class Parent {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  String? image;
  String? createdAt;
  String? updatedAt;

  Parent(
      {this.id,
        this.name,
        this.slug,
        this.active,
        this.description,
        this.order,
        this.image,
        this.createdAt,
        this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['active'] = active;
    data['description'] = description;
    data['order'] = order;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class RelatedProducts {
  String? id;
  String? name;
  String? slug;
  CategoryDetail? category;
  Brand? brand;
  String? previewText;
  bool? active;
  Price? price;
  List<Prices>? prices;
  String? image;
  String? externalId;
  String? code;
  String? createdAt;
  String? updatedAt;
  InStock? inStock;

  RelatedProducts(
      {this.id,
        this.name,
        this.slug,
        this.category,
        this.brand,
        this.previewText,
        this.active,
        this.price,
        this.prices,
        this.image,
        this.externalId,
        this.code,
        this.createdAt,
        this.updatedAt,
        this.inStock});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    prices = <Prices>[];
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null
        ? CategoryDetail.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    previewText = json['preview_text'];
    active = json['active'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      json['prices'].forEach((v) {
        prices!.add(Prices.fromJson(v));
      });
    }
    image = json['image'];
    externalId = json['external_id'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inStock = json['in_stock'] != null
        ? InStock.fromJson(json['in_stock'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['preview_text'] = previewText;
    data['active'] = active;
    if (price != null) {
      data['price'] = price!.toJson();
    }
    if (prices != null) {
      data['prices'] = prices!.map((v) => v.toJson()).toList();
    }
    data['image'] = image;
    data['external_id'] = externalId;
    data['code'] = code;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (inStock != null) {
      data['in_stock'] = inStock!.toJson();
    }
    return data;
  }
}

class Brand {
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

  Brand(
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

  Brand.fromJson(Map<String, dynamic> json) {
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

class Price {
  String? price;
  String? oldPrice;

  Price({this.price, this.oldPrice});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['price'] = price;
    data['old_price'] = oldPrice;
    return data;
  }
}

class Prices {
  String? id;
  String? type;
  String? price;
  String? oldPrice;

  Prices({this.id, this.type, this.price, this.oldPrice});

  Prices.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    price = json['price'];
    oldPrice = json['old_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = type;
    data['price'] = price;
    data['old_price'] = oldPrice;
    return data;
  }
}

class InStock {
  bool? samarkand;
  bool? tashkentCity;

  InStock({this.samarkand, this.tashkentCity});

  InStock.fromJson(Map<String, dynamic> json) {
    samarkand = json['samarkand'];
    tashkentCity = json['tashkent_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['samarkand'] = samarkand;
    data['tashkent_city'] = tashkentCity;
    return data;
  }
}

class Meta {
  String? title;
  String? description;
  String? tags;

  Meta({this.title, this.description, this.tags});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['tags'] = tags;
    return data;
  }
}
