class RandomJokeResponse {
  List<String>? categories;
  String? createdAt;
  String? iconUrl;
  String? id;
  String? updatedAt;
  String? url;
  String? value;

  RandomJokeResponse({
    this.categories,
    this.createdAt,
    this.iconUrl,
    this.id,
    this.updatedAt,
    this.url,
    this.value,
  });

  RandomJokeResponse.fromJson(dynamic json) {
    categories =
        json['categories'] != null ? json['categories'].cast<String>() : [];
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['categories'] = categories;
    map['created_at'] = createdAt;
    map['icon_url'] = iconUrl;
    map['id'] = id;
    map['updated_at'] = updatedAt;
    map['url'] = url;
    map['value'] = value;
    return map;
  }
}
