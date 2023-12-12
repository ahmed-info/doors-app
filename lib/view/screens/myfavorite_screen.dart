import 'package:doors/controller/myfavorite_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/view/widgets/product/custom_list_myfavorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyfavoriteScreen extends StatelessWidget {
  const MyfavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MyfavoriteController());

    return Container(
        decoration: const BoxDecoration(
            color: AppColor.smoke,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
        child: GetBuilder<MyfavoriteController>(
          builder: (controller) => ListView(
            padding: const EdgeInsets.all(8),
            children: [
              // const CustomAppBar(titleappbar: "ابحث عن المنتجات"),
              const SizedBox(height: 20),
              HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.myfavorites.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (BuildContext context, int index) {
                        return CustomListMyfavorite(
                            myFavoriteModel: controller.myfavorites[index]);
                      }))
            ],
          ),
        ));
  }
}
