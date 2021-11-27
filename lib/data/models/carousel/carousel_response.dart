class CaruselResponse {
  List<Promos>? promos;
  int? count;

  CaruselResponse({this.promos, this.count});

  CaruselResponse.fromJson(Map<String, dynamic> json) {
    if (json['promos'] != null) {
      promos = <Promos>[];
      json['promos'].forEach((v) {
        promos!.add(new Promos.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.promos != null) {
      data['promos'] = this.promos!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Promos {
  String? id;
  String? title;
  String? slug;
  String? previewText;
  String? previewImage;
  String? startTime;
  String? endTime;
  String? createdAt;
  String? updatedAt;
  String? formattedStartDate;
  String? formattedEndDate;
  String? formattedDate;
  String? lang;
  bool? active;

  Promos(
      {this.id,
        this.title,
        this.slug,
        this.previewText,
        this.previewImage,
        this.startTime,
        this.endTime,
        this.createdAt,
        this.updatedAt,
        this.formattedStartDate,
        this.formattedEndDate,
        this.formattedDate,
        this.lang,
        this.active});

  Promos.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    previewText = json['preview_text'];
    previewImage = json['preview_image'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    formattedStartDate = json['formatted_start_date'];
    formattedEndDate = json['formatted_end_date'];
    formattedDate = json['formatted_date'];
    lang = json['lang'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['preview_text'] = this.previewText;
    data['preview_image'] = this.previewImage;
    data['start_time'] = this.startTime;
    data['end_time'] = this.endTime;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['formatted_start_date'] = this.formattedStartDate;
    data['formatted_end_date'] = this.formattedEndDate;
    data['formatted_date'] = this.formattedDate;
    data['lang'] = this.lang;
    data['active'] = this.active;
    return data;
  }
}
