// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/myfavorite_controller.dart';
import 'package:doors/data/model/myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doors/core/constant/colors.dart';

class CustomListMyfavorite extends GetView<MyfavoriteController> {
  final MyFavoriteModel myFavoriteModel;

  const CustomListMyfavorite({
    Key? key,
    required this.myFavoriteModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //ProductControllerImp controller = Get.put(ProductControllerImp());

    return InkWell(
      //onTap: () => controller.goToProductDetails(productModel),
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
                          imageUrl: myFavoriteModel.image1!,
                          fit: BoxFit.fill,
                        )),
                  ),
                  // GetBuilder<FavoriteController>(builder: (controller) {
                  //   print("check map ${controller.isFavorite}");
                  //   return IconButton(
                  //     onPressed: () async {
                  //       if (controller.checkIsLogin()) {
                  //         if (controller.isFavorite[productModel.prodID] == 1) {
                  //           controller.setFavorite(productModel.prodID, 0);
                  //           controller.deleteFavorite(productModel.prodID!);
                  //         } else {
                  //           controller.setFavorite(productModel.prodID, 1);
                  //           controller.addfavorite(productModel.prodID!);
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
                  myFavoriteModel.title!,
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
                      myFavoriteModel.price!,
                      style: const TextStyle(
                          color: AppColor.bronze,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          fontFamily: "sans"),
                    ),
                    IconButton(
                        onPressed: () {
                          controller.deleteFavorite(myFavoriteModel.favID!);
                        },
                        icon: const Icon(
                          Icons.delete,
                          size: 30,
                          color: AppColor.indigo,
                        ))
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
