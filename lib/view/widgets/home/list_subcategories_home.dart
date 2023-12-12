import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/home_controller.dart';
import 'package:doors/controller/subcategory_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListSubCategoriesHome extends GetView<SubcategoryControllerImp> {
  const ListSubCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SubcategoryControllerImp>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: SizedBox(
                height: 120,
                child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                          width: 10,
                        ),
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.subcategories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          controller.changeSubCate(
                              controller.subcategories[index]['subID']);
                          Get.rawSnackbar(
                              title: "ملاحظة",
                              message:
                                  "${controller.subcategories[index]['subID']}");
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: AppColor.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: AppColor.indigo, width: 1)),
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              width: 80,
                              height: 80,
                              child: CachedNetworkImage(
                                imageUrl:
                                    "${controller.subcategories[index]['image']}",
                              ),
                            ),
                            Text(controller.subcategories[index]['subTitle'])
                          ],
                        ),
                      );
                    }),
              ),
            ));
  }
}
