import 'package:doors/controller/product_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/product.dart';
import 'package:doors/view/screens/home_page.dart';
import 'package:doors/view/widgets/custom_appbar.dart';
import 'package:doors/view/widgets/product/custom_list_product.dart';
import 'package:doors/view/widgets/product/listsubcategories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
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
            const ListSubcategories(),
            GetBuilder<ProductControllerImp>(
              builder: (controller) => HandlingDataView(
                statusRequest: controller.statusRequest,
                widget: !controller.isSearch
                    ? GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.products.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 0.56),
                        itemBuilder: (BuildContext context, index) {
                          //controllerFav.setFavorite(controller.products[index]['prodID'], controller.products[index]['favorite']);
                          //controllerFav.isFavorite[controller.products[index]
                          //        ['prodID']] =
                          controller.products[index]['favorite'];
                          //controller.products[index]['favorite'];
                          return CustomListProduct(
                            productModel:
                                Product.fromJson(controller.products[index]),
                          );
                        })
                    : ListProductSearch(listModel: controller.productModel),
              ),
            )
          ],
        ),
      ),
    );
  }
}
