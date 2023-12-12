// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/home_controller.dart';
import 'package:doors/controller/menu_controller.dart';
import 'package:doors/controller/product_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/product.dart';
import 'package:doors/view/widgets/custom_appbar.dart';
import 'package:doors/view/widgets/home/list_categories_home.dart';
import 'package:doors/view/widgets/product/custom_list_product.dart';
import 'package:doors/view/widgets/slidehome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  static int _selectedIndex = 0;
  bool isLoading = false;
  PageController pageController = PageController();
  //ScrollController _scrollController = ScrollController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  @override
  void initState() {
    Get.put(MenuControllerImp());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    Get.put(ProductControllerImp());

    return GetBuilder<HomeControllerImp>(
        builder: (controller) => Container(
              decoration: BoxDecoration(
                  color: AppColor.smoke,
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(50))),
              padding: EdgeInsets.all(8),
              child: PageView(
                children: [
                  Column(
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
                      Expanded(
                        child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              // mainAxisSize: MainAxisSize.min,
                              //crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SlideHome(key: null),
                                Text(
                                  "Women Collection",
                                  style: TextStyle(),
                                ),
                                ListCategoriesHome(),
                                SizedBox(
                                  height: 10,
                                ),
                                //SlideCategory(key: null),
                                Container(
                                    child: GetBuilder<ProductControllerImp>(
                                  builder: (controller) => HandlingDataView(
                                      statusRequest: controller.statusRequest,
                                      widget: GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          itemCount: controller.products.length,
                                          gridDelegate:
                                              const SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  childAspectRatio: 0.6),
                                          itemBuilder:
                                              (BuildContext context, index) {
                                            return CustomListProduct(
                                              productModel: Product.fromJson(
                                                  controller.products[index]),
                                            );
                                          })),
                                ))
                              ],
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}

class ListProductSearch extends GetView<HomeControllerImp> {
  final List<Product> listModel;
  const ListProductSearch({super.key, required this.listModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: listModel.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              print("check print model ${controller.productModel[index]}");
              controller.goToProductDetails(controller.productModel[index]);
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                          child: CachedNetworkImage(
                        imageUrl: listModel[index].image1!,
                      )),
                      Expanded(
                          flex: 2,
                          child: ListTile(
                            title: Text(listModel[index].title!),
                            subtitle: Text(listModel[index].price!),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
