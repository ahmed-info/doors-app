class Categorysubcategory {
  int? cateID;
  String? title;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? subcategoryName;
  String? subcategoryImage;

  Categorysubcategory(
      {this.cateID,
      this.title,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.subcategoryName,
      this.subcategoryImage});

  Categorysubcategory.fromJson(Map<String, dynamic> json) {
    cateID = json['cateID'];
    title = json['title'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    subcategoryName = json['subcategoryName'];
    subcategoryImage = json['subcategoryImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cateID'] = this.cateID;
    data['title'] = this.title;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['subcategoryName'] = this.subcategoryName;
    data['subcategoryImage'] = this.subcategoryImage;
    return data;
  }
}
