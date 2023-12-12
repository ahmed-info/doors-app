// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/controller/category_controller.dart';
import 'package:doors/data/model/category.dart';
import 'package:doors/network/api_request.dart';
import 'package:doors/view/widgets/categoryitem.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:doors/core/class/handling_data_view.dart';

class ListCategory extends StatelessWidget {
  final CategoryModel? categoryModel;
  const ListCategory({
    Key? key,
    this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoryControllerImp>(
        builder: (controller) => HandlingDataView(
              statusRequest: controller.statusRequest,
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FutureBuilder(
                  future: getCategory(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.categories.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.75),
                          itemBuilder: (context, index) {
                            controller.categories[index].cateID!;
                            return InkWell(
                              // onTap: () => controller.goToCategory(
                              //     controller.roots, index, ss),
                              child: CategoryItem(
                                  categoryModel: controller.categories[index]),
                            );
                          });
                    }
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const Text("no data found");
                  },
                ),
              ),
            ));
  }
}
