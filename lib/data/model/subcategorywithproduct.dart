class SubcategoryWithProduct {
  int? subID;
  int? categoryId;
  String? subTitle;
  String? image;
  String? createdAt;
  String? updatedAt;
  List<Products>? products;

  SubcategoryWithProduct(
      {this.subID,
      this.categoryId,
      this.subTitle,
      this.image,
      this.createdAt,
      this.updatedAt,
      this.products});

  SubcategoryWithProduct.fromJson(Map<String, dynamic> json) {
    subID = json['subID'];
    categoryId = json['category_id'];
    subTitle = json['subTitle'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subID'] = this.subID;
    data['category_id'] = this.categoryId;
    data['subTitle'] = this.subTitle;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? prodID;
  int? subcategoryId;
  String? title;
  String? description;
  String? image1;
  String? image2;
  String? image3;
  String? image4;
  String? image5;
  String? market;
  String? capacity;
  String? unit;
  int? quantity;
  int? salesCounter;
  int? showIsHome;
  bool? isBestSeller;
  int? selectForYou;
  bool? activeOrNot;
  int? supplierId;
  String? deliveryTime;
  String? sku;
  String? barcode;
  String? price;
  String? priceDiscount;
  String? originCountry;
  String? createdAt;
  String? updatedAt;
  int? favorite;

  Products(
      {this.prodID,
      this.subcategoryId,
      this.title,
      this.description,
      this.image1,
      this.image2,
      this.image3,
      this.image4,
      this.image5,
      this.market,
      this.capacity,
      this.unit,
      this.quantity,
      this.salesCounter,
      this.showIsHome,
      this.isBestSeller,
      this.selectForYou,
      this.activeOrNot,
      this.supplierId,
      this.deliveryTime,
      this.sku,
      this.barcode,
      this.price,
      this.priceDiscount,
      this.originCountry,
      this.createdAt,
      this.updatedAt,
      this.favorite});

  Products.fromJson(Map<String, dynamic> json) {
    prodID = json['prodID'];
    subcategoryId = json['subcategory_id'];
    title = json['title'];
    description = json['description'];
    image1 = json['image1'];
    image2 = json['image2'];
    image3 = json['image3'];
    image4 = json['image4'];
    image5 = json['image5'];
    market = json['market'];
    capacity = json['capacity'];
    unit = json['unit'];
    quantity = json['quantity'];
    salesCounter = json['salesCounter'];
    showIsHome = json['showIsHome'];
    isBestSeller = json['isBestSeller'];
    selectForYou = json['selectForYou'];
    activeOrNot = json['activeOrNot'];
    supplierId = json['supplier_id'];
    deliveryTime = json['deliveryTime'];
    sku = json['sku'];
    barcode = json['barcode'];
    price = json['price'];
    priceDiscount = json['priceDiscount'];
    originCountry = json['originCountry'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prodID'] = this.prodID;
    data['subcategory_id'] = this.subcategoryId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image1'] = this.image1;
    data['image2'] = this.image2;
    data['image3'] = this.image3;
    data['image4'] = this.image4;
    data['image5'] = this.image5;
    data['market'] = this.market;
    data['capacity'] = this.capacity;
    data['unit'] = this.unit;
    data['quantity'] = this.quantity;
    data['salesCounter'] = this.salesCounter;
    data['showIsHome'] = this.showIsHome;
    data['isBestSeller'] = this.isBestSeller;
    data['selectForYou'] = this.selectForYou;
    data['activeOrNot'] = this.activeOrNot;
    data['supplier_id'] = this.supplierId;
    data['deliveryTime'] = this.deliveryTime;
    data['sku'] = this.sku;
    data['barcode'] = this.barcode;
    data['price'] = this.price;
    data['priceDiscount'] = this.priceDiscount;
    data['originCountry'] = this.originCountry;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['favorite'] = this.favorite;
    return data;
  }
}
