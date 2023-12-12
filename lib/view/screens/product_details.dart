// ignore_for_file: prefer_const_constructors, void_checks

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/cart_controller.dart';
import 'package:doors/controller/productdetails_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/view/widgets/product_details.dart/count_and_title.dart';
import 'package:doors/view/widgets/product_details.dart/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ProductDetails extends GetView<ProductDetailsControllerImp> {
  const ProductDetails({super.key});

  @override
  Widget build(BuildContext context) {
    ProductDetailsControllerImp controller =
        Get.put(ProductDetailsControllerImp());
    var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);
    CartController cartController = Get.put(CartController());
    return Scaffold(
      bottomNavigationBar: GetBuilder<CartController>(builder: (context) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  if (controller.size == null) {
                    Get.rawSnackbar(
                      message: "اختر القياس",
                    );
                    return;
                  }
                  if (controller.colorName == null) {
                    Get.rawSnackbar(
                      message: "اختر اللون",
                    );
                    return;
                  }

                  cartController.refreshPage();
                  controller.checkProduct();
                  cartController.refreshPage();
                  //controller.customAdd();
                },
                child: Container(
                  color: AppColor.indigo,
                  height: 80,
                  child: const Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("اضافة الى السلة",
                            style:
                                TextStyle(fontSize: 22, color: AppColor.white)),
                        Icon(
                          IconData(0xe59c, fontFamily: 'MaterialIcons'),
                          color: AppColor.white,
                          size: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: AppColor.bronze,
                height: 80,
                child: Align(
                    alignment: Alignment.center,
                    child: GetBuilder<ProductDetailsControllerImp>(
                      builder: (controller) => Text(
                        formatter.format(controller.myprice),
                        style: TextStyle(fontSize: 20, color: AppColor.white),
                      ),
                    )),
              ),
            ),
          ],
        );
      }),
      body: GetBuilder<ProductDetailsControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: ListView(
            children: [
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      color: AppColor.indigo,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: Get.width / 8,
                    right: Get.width / 8,
                    child: Hero(
                      tag: controller.productModel.prodID!,
                      child: CachedNetworkImage(
                        imageUrl: controller.productModel.image1!,
                        height: 250,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CountAndTitle(
                        onAdd: () {
                          controller.add();
                        },
                        onRemove: () {
                          controller.remove();
                        },
                        title: controller.productModel.title!,
                        count: controller.countProduct),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "${controller.productModel.description} ${controller.productModel.description} ${controller.productModel.description} ${controller.productModel.description} ${controller.productModel.description}",
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "القياس:*",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    const SizedBox(height: 10),
                    GetBuilder<ProductDetailsControllerImp>(
                      builder: (controller) => Row(
                        children: [
                          ...List.generate(
                            controller.productattrs.length,
                            (index) => SizeWidget(
                              isActive: controller.size ==
                                      controller.productattrs[index]['size']
                                  ? true
                                  : false,
                              text: controller.productattrs[index]['size'],
                              ontap: () {
                                controller.chooseSize(
                                    controller.productattrs[index]['size']);
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "اللون:*",
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                    Row(
                      children: [
                        ...List.generate(
                          controller.productattrs.length,
                          (index) => SizeWidget(
                            isActive: controller.colorName ==
                                    controller.productattrs[index]['colorName']
                                ? true
                                : false,
                            text: controller.productattrs[index]['colorName'],
                            ontap: () {
                              controller.image =
                                  controller.productattrs[index]['image'];
                              controller.chooseColor(
                                  controller.productattrs[index]['colorName']);
                            },
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
