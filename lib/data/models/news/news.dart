class NewsModel {
  List<News>? news;
  String? count;

  NewsModel({this.news, this.count});

  NewsModel.fromJson(Map<String, dynamic> json) {
    if (json['news'] != null) {
      news = <News>[];
      json['news'].forEach((v) {
        news!.add(new News.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.news != null) {
      data['news'] = this.news!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class News {
  String? id;
  String? title;
  String? slug;
  String? imageURL;
  String? previewImage;
  String? fullText;
  String? description;
  bool? active;
  Meta? meta;
  String? createdAt;
  String? updatedAt;
  String? formattedDate;

  News(
      {this.id,
        this.title,
        this.slug,
        this.imageURL,
        this.previewImage,
        this.fullText,
        this.description,
        this.active,
        this.meta,
        this.createdAt,
        this.updatedAt,
        this.formattedDate});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    imageURL = json['imageURL'];
    previewImage = json['preview_image'];
    fullText = json['full_text'];
    description = json['description'];
    active = json['active'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    formattedDate = json['formatted_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['imageURL'] = this.imageURL;
    data['preview_image'] = this.previewImage;
    data['full_text'] = this.fullText;
    data['description'] = this.description;
    data['active'] = this.active;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['formatted_date'] = this.formattedDate;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tags'] = this.tags;
    return data;
  }
}