// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/subcategory_controller.dart';
import 'package:doors/data/model/subcategory.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:doors/core/constant/colors.dart';

class CustomListSubCategory extends StatelessWidget {
  final Subcategory subcategoryModel;

  const CustomListSubCategory({
    Key? key,
    required this.subcategoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SubcategoryControllerImp controller = Get.put(SubcategoryControllerImp());

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
                          imageUrl: subcategoryModel.image!,
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, right: 8),
                child: Text(
                  subcategoryModel.subTitle!,
                  //"titleeeeee",
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
