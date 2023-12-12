// ignore_for_file: unnecessary_this

class Subcategory {
  int? subID;
  int? categoryId;
  String? subTitle;
  String? image;
  String? createdAt;
  String? updatedAt;

  Subcategory(
      {this.subID,
      this.categoryId,
      this.subTitle,
      this.image,
      this.createdAt,
      this.updatedAt});

  Subcategory.fromJson(Map<String, dynamic> json) {
    subID = json['subID'];
    categoryId = json['category_id'];
    subTitle = json['subTitle'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subID'] = this.subID;
    data['category_id'] = this.categoryId;
    data['subTitle'] = this.subTitle;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}