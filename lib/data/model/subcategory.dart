// ignore_for_file: unnecessary_this

class Subcategory {
  int? id;
  int? categoryId;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  Subcategory(
      {this.id,
      this.categoryId,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt});

  Subcategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_id'] = this.categoryId;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}