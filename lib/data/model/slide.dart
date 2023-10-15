// ignore_for_file: prefer_collection_literals, unnecessary_new

class Slide {
  int? id;
  int? subcategoryId;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  Slide(
      {this.id,
      this.subcategoryId,
      this.title,
      required this.image,
      this.createdAt,
      this.updatedAt});

  Slide.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subcategoryId = json['subcategory_id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['subcategory_id'] = subcategoryId;
    data['title'] = title;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}