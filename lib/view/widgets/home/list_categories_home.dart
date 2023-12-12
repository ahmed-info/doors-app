import 'package:doors/controller/home_controller.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ListCategoriesHome extends GetView<HomeControllerImp> {
  const ListCategoriesHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 10,
              ),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                controller
                    .goToSubCategory(controller.categories[index]['cateID']);
              },
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.white,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(color: AppColor.indigo, width: 1)),
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    width: 80,
                    height: 80,
                    child: SvgPicture.network(
                      "${controller.categories[index]['image']}",
                      // color: AppColor.white,
                    ),
                  ),
                  Text(controller.categories[index]['title'])
                ],
              ),
            );
          }),
    );
  }
}
