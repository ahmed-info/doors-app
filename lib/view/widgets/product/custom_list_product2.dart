// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/favorite_controller.dart';
import 'package:doors/data/model/productview.dart';
import 'package:doors/data/model/subcategorywithproduct.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:doors/controller/product_controller.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/product.dart';

class CustomListProduct2 extends StatelessWidget {
  final SubcategoryWithProduct subcategoryWithProductModel;

  const CustomListProduct2({
    Key? key,
    required this.subcategoryWithProductModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());

    return InkWell(
      onTap: () => controller.goToProductDetails(subcategoryWithProductModel),
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
                          imageUrl:
                              subcategoryWithProductModel.products![0].image1!,
                          fit: BoxFit.fill,
                        )),
                  ),
                  // GetBuilder<FavoriteController>(builder: (controller) {
                  //   //print("check map ${controller.isFavorite}");
                  //   return IconButton(
                  //     onPressed: () async {
                  //       if (controller.checkIsLogin()) {
                  //         if (controller.isFavorite[productModel.prodID] == 1) {
                  //           await controller.setFavorite(
                  //               productModel.prodID, 0);
                  //           await controller
                  //               .removeFavorite(productModel.prodID!);
                  //         } else {
                  //           await controller.setFavorite(
                  //               productModel.prodID, 1);
                  //           await controller.addfavorite(productModel.prodID!);
                  //         }
                  //       }
                  //     },
                  //     icon: Icon(
                  //       controller.isFavorite[productModel.prodID] == 1
                  //           ? Icons.favorite
                  //           : Icons.favorite_outline_outlined,
                  //       color: AppColor.greyDark,
                  //       size: 24,
                  //     ),
                  //   );
                  // })
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Text(
                  subcategoryWithProductModel.subTitle!,
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
                      subcategoryWithProductModel.image!,
                      style: const TextStyle(
                          color: AppColor.greyDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: TextDecoration.lineThrough,
                          decorationThickness: 3.5,
                          fontFamily: "sans"),
                    ),
                    Text(
                      subcategoryWithProductModel.subTitle!,
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
