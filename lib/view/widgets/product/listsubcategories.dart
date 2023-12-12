// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:doors/data/model/subcategory.dart';
import 'package:get/get.dart';

import 'package:doors/controller/product_controller.dart';
import 'package:doors/core/constant/consts.dart';

class ListSubcategories extends GetView<ProductControllerImp> {
  const ListSubcategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ProductControllerImp controller = Get.put(ProductControllerImp());
    return SizedBox(
      height: 100,
      child: ListView.separated(
        itemBuilder: (context, index) {
          return SubcategoryItem(
              i: index,
              subcategoriesModel:
                  Subcategory.fromJson(controller.subcategories[index]));
        },
        separatorBuilder: (context, index) => const SizedBox(
          width: 10,
        ),
        itemCount: controller.subcategories.length,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class SubcategoryItem extends GetView<ProductControllerImp> {
  final Subcategory subcategoriesModel;
  final int? i;
  const SubcategoryItem(
      {Key? key, required this.subcategoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //controller.changeSubCate(i!, subcategoriesModel.subID!);
      },
      child: Column(
        children: [
          GetBuilder<ProductControllerImp>(
            builder: (controller) => Container(
              padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
              // decoration: controller.selectedSubCate == i
              //     ? const BoxDecoration(
              //         border: Border(
              //           bottom: BorderSide(width: 3, color: AppColor.indigo),
              //         ),
              //       )
              //     : null,
              child: Text(
                "${subcategoriesModel.subTitle}",
                style: const TextStyle(fontSize: 20, color: AppColor.greyDark),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
