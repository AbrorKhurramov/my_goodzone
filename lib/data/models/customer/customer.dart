class Customer {
  String? id;
  String? name;
  String? phone;
  bool? isBlocked;
  String? createdAt;
  String? updatedAt;
  String? accessToken;
  String? refreshToken;
  String? dateOfBirth;

  Customer({
    this.id,
    this.name,
    this.phone,
    this.isBlocked,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
    this.dateOfBirth,
    this.refreshToken,
  });

  Customer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    isBlocked = json['is_blocked'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    dateOfBirth = json['date_of_birth'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    // data['id'] = this.id;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['date_of_birth'] = this.dateOfBirth;
    // data['is_blocked'] = this.isBlocked;
    // data['created_at'] = this.createdAt;
    // data['updated_at'] = this.updatedAt;
    // data['access_token'] = this.accessToken;
    // data['refresh_token'] = this.refreshToken;
    return data;
  }
}
