class ProductView {
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
  int? subID;
  String? subTitle;
  String? image;

  ProductView(
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
      this.subID,
      this.subTitle,
      this.image});

  ProductView.fromJson(Map<String, dynamic> json) {
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
    subID = json['subID'];
    subTitle = json['subTitle'];
    image = json['image'];
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
    data['subID'] = this.subID;
    data['subTitle'] = this.subTitle;
    data['image'] = this.image;
    return data;
  }
}
