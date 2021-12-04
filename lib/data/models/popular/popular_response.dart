class PopularResponse {
  List<Products>? products;
  String? count;

  PopularResponse({this.products, this.count});

  PopularResponse.fromJson(Map<String, dynamic> json) {
    products = <Products>[];
    if (json['products'] != null) {
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Products {
  String? id;
  bool favorite=false;
  bool recFavorite=false;
  String? name;
  String? slug;
  ProductCategory? category;
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

  Products(
      {this.id,
        this.name,
        this.slug,
        this.favorite=false,
        this.recFavorite=false,
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

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'] != null
        ? ProductCategory.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? Brand.fromJson(json['brand']) : null;
    previewText = json['preview_text'];
    active = json['active'];
    price = json['price'] != null ? Price.fromJson(json['price']) : null;
    if (json['prices'] != null) {
      prices = <Prices>[];
      json['prices'].forEach((v) {
        prices!.add(new Prices.fromJson(v));
      });
    }
    image = json['image'];
    externalId = json['external_id'];
    code = json['code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    inStock = json['in_stock'] != null
        ? new InStock.fromJson(json['in_stock'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.brand != null) {
      data['brand'] = this.brand!.toJson();
    }
    data['preview_text'] = this.previewText;
    data['active'] = this.active;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    if (this.prices != null) {
      data['prices'] = this.prices!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['external_id'] = this.externalId;
    data['code'] = this.code;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.inStock != null) {
      data['in_stock'] = this.inStock!.toJson();
    }
    return data;
  }
}

class ProductCategory {
  String? id;
  String? name;
  String? slug;
  Parent? parent;
  bool? active;
  String? order;
  String? image;

  ProductCategory(
      {this.id,
        this.name,
        this.slug,
        this.parent,
        this.active,
        this.order,
        this.image});

  ProductCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent =
    json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    active = json['active'];
    order = json['order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['active'] = this.active;
    data['order'] = this.order;
    data['image'] = this.image;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['description'] = this.description;
    data['order'] = this.order;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['preview_text'] = this.previewText;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['order'] = this.order;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samarkand'] = this.samarkand;
    data['tashkent_city'] = this.tashkentCity;
    return data;
  }
}
