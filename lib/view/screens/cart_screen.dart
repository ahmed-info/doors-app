// ignore_for_file: prefer_const_constructors
import 'package:doors/controller/cart_controller.dart';
import 'package:doors/controller/order_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/view/widgets/cart/appbar_cart.dart';
import 'package:doors/view/widgets/cart/custom_bottom_navigationbar_cart.dart';
import 'package:doors/view/widgets/cart/custom_product_cartlist.dart';
import 'package:doors/view/widgets/cart/top_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartController cartController = Get.put(CartController());
    var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);
    Get.put(OrderController());
    return Scaffold(
        bottomNavigationBar: GetBuilder<CartController>(
          builder: (controller) => BottomNavgationBarCart(
              onPress: () {
                controller.insertOrder();
              },
              price: cartController.priceOrder,
              shipping: 5000,
              totalprice: cartController.priceOrder + 5000),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) => HandlingDataView(
            statusRequest: controller.statusRequest,
            widget: ListView(
              children: [
                TopAppbarCart(
                  title: 'السلة',
                ),
                SizedBox(height: 10),
                TopCardCart(
                    message:
                        "You Have ${controller.totalCountProduct} Items in Your List"),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      ...List.generate(
                        cartController.cartviews.length,
                        (index) => CustomItemsCartList(
                            size: cartController.cartviews[index].size!,
                            colorName:
                                cartController.cartviews[index].colorName!,
                            onAdd: () async {
                              await cartController.onAdd(
                                cartController.cartviews[index].prodID!,
                                cartController.cartviews[index].size!,
                                cartController.cartviews[index].colorName!,
                                cartController.cartviews[index].qty!,
                                cartController.cartviews[index].image!,
                              );
                              cartController.refreshPage();
                            },
                            onRemove: () async {
                              print(
                                  "prodid ${cartController.cartviews[index].prodID!}");
                              print(
                                  "size ${cartController.cartviews[index].size!}");
                              print(
                                  "colorName ${cartController.cartviews[index].colorName!}");
                              await cartController.onRemove(
                                cartController.cartviews[index].prodID!,
                                cartController.cartviews[index].size!,
                                cartController.cartviews[index].colorName!,
                              );
                              cartController.refreshPage();
                            },
                            imagename:
                                "${cartController.cartviews[index].image}",
                            name: "${cartController.cartviews[index].title}",
                            price: formatter.format(double.parse(
                                cartController.cartviews[index].productPrice!)),
                            count:
                                "${cartController.cartviews[index].countProduct}"),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
