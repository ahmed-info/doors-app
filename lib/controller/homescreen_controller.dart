import 'package:doors/controller/order_controller.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/view/screens/cart_screen.dart';
import 'package:doors/view/screens/home_page.dart';
import 'package:doors/view/screens/menu_screen.dart';
import 'package:doors/view/screens/pending_orders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeScreenController extends GetxController {
  changePage(int i);
}

class HomeScreenControllerImp extends HomeScreenController {
  int currentPage = 0;
  MyServices myServices = Get.find();
  OrderController orderController = Get.put(OrderController());
  List<Widget> listPage = [
    const HomePage(),
    const PendingOrderScreen(),
    //const MyfavoriteScreen(),
    const CartScreen(),
    const MenuScreen()
  ];
  TextEditingController? search;
  bool isSearch = false;
  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  onSearchProduct() {
    isSearch = true;
    update();
  }

  @override
  changePage(i) {
    if (myServices.sharedPreferences!.getString("token") == null &&
        (i == 1 || i == 2)) {
      Get.defaultDialog(
        title: 'تنويه',
        content: const Text("سجل الدخول اولا"),
        textCancel: "لا",
        textConfirm: "نعم",
        onConfirm: () {
          Get.toNamed(AppRoute.login);
        },
      );
      i = 0;
    }
    currentPage = i;
    update();
  }
}
