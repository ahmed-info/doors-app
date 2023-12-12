// ignore_for_file: public_member_api_docs, sort_constructors_first, prefer_const_constructors
import 'package:doors/controller/category_controller.dart';
import 'package:doors/data/model/category.dart';
import 'package:get/get.dart';

import 'package:doors/core/constant/consts.dart';

class ListCategories extends GetView<CategoryControllerImp> {
  const ListCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    CategoryControllerImp controller = Get.put(CategoryControllerImp());
    return Container(
      //color: AppColor.black,
      height: 200,
      child: ListView.separated(
        shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryItem(
              i: index,
              categoriesModel:
                  CategoryModel.fromJson(controller.categories[index]));
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

class CategoryItem extends GetView<CategoryControllerImp> {
  final CategoryModel categoriesModel;
  final int? i;
  const CategoryItem({Key? key, required this.categoriesModel, required this.i})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.changeSubCate(i, categoriesModel.cateID!);
      },
      child: Container(
        child: GetBuilder<CategoryControllerImp>(
          builder: (controller) => Container(
            height: 400,
            width: 400,
            color: AppColor.bronze,
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5),
            child: Text(
              "helllo",
              style: const TextStyle(fontSize: 20, color: AppColor.greyDark),
            ),
          ),
        ),
      ),
    );
  }
}
