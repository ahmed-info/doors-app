class OrderModel {
  int? orderId;
  int? orderUserid;
  String? orderAddress;
  int? orderPricedelivery;
  int? orderPrice;
  int? orderTotalprice;
  String? createdAt;
  String? updatedAt;

  OrderModel(
      {this.orderId,
      this.orderUserid,
      this.orderAddress,
      this.orderPricedelivery,
      this.orderPrice,
      this.orderTotalprice,
      this.createdAt,
      this.updatedAt});

  OrderModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderUserid = json['order_userid'];
    orderAddress = json['order_address'];
    orderPricedelivery = json['order_pricedelivery'];
    orderPrice = json['order_price'];
    orderTotalprice = json['order_totalprice'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_userid'] = this.orderUserid;
    data['order_address'] = this.orderAddress;
    data['order_pricedelivery'] = this.orderPricedelivery;
    data['order_price'] = this.orderPrice;
    data['order_totalprice'] = this.orderTotalprice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
