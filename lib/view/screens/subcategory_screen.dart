import 'package:doors/controller/subcategory_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/product.dart';
import 'package:doors/view/widgets/custom_appbar.dart';
import 'package:doors/view/widgets/home/list_subcategories_home.dart';
import 'package:doors/view/widgets/product/custom_list_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoryScreen extends StatelessWidget {
  const SubCategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SubcategoryControllerImp controller = Get.put(SubcategoryControllerImp());
    return Scaffold(
      backgroundColor: AppColor.smoke,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            CustomAppBar(
                mycontroller: controller.search!,
                onPressedSearch: () {
                  controller.onSearchProduct();
                },
                onChanged: (val) {
                  controller.checkSearch(val);
                },
                titleappbar: "ابحث عن المنتجات"),
            const SizedBox(
              height: 20,
            ),
            const ListSubCategoriesHome(),
            Container(
                child: GetBuilder<SubcategoryControllerImp>(
              builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 0.6),
                      itemBuilder: (BuildContext context, index) {
                        controller.products[index];
                        return CustomListProduct(
                          productModel:
                              Product.fromJson(controller.products[index]),
                        );
                      })),
            ))
          ],
        ),
      ),
    );
  }
}
