// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/favorite_controller.dart';
import 'package:doors/data/model/productview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:doors/controller/product_controller.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/product.dart';

class CustomListProduct extends StatelessWidget {
  final Product productModel;

  const CustomListProduct({
    Key? key,
    required this.productModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);

    return InkWell(
      onTap: () => controller.goToProductDetails(productModel),
      child: Card(
        color: AppColor.greyLight,
        child: Padding(
          padding: const EdgeInsets.all(1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(22)),
                    child: SizedBox(
                        width: Get.width,
                        height: 200,
                        child: CachedNetworkImage(
                          imageUrl: productModel.image1!,
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Text(
                  productModel.title!,
                  //"titleeeeee",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      formatter.format(double.parse(productModel.price!)),
                      style: const TextStyle(
                          color: AppColor.greyDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3.5,
                          fontFamily: "sans"),
                    ),
                    Text(
                      formatter
                          .format(double.parse(productModel.priceDiscount!)),
                      style: const TextStyle(
                          color: AppColor.bronze,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "sans"),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
