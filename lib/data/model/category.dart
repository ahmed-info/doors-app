class CategoryModel {
  int? cateID;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;

  CategoryModel(
      {this.cateID, this.title, this.image, this.createdAt, this.updatedAt});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    cateID = json['cateID'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateID'] = cateID;
    data['title'] = title;
    data['image'] = image;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
