class RandomJokeResponse {
  Categories? categories;
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
    categories = Categories.fromJson(json["categories"]);
    createdAt = json['created_at'];
    iconUrl = json['icon_url'];
    id = json['id'];
    updatedAt = json['updated_at'];
    url = json['url'];
    value = json['value'];
  }
}

class Categories {
  List<String>? categories;

  Categories.fromJson(dynamic json) {
    categories =
        json != null ? json.cast<String>() : [];
  }
}
