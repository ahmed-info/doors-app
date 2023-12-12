import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/data/datasource/remote/home_data.dart';
import 'package:doors/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class HomeController extends SearchMixController {
  getData();
  getSearchData();
  goToSubCategory(int categoryid);
  goToProductDetails(Product productModel);
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  List slides = [];
  // List categories = [];
  List categories = [];
//  List subcategories = [];
  List products = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        categories.addAll(response["categories"]);
        //subcategories.addAll(response["subcategories"]);
        slides.addAll(response["slides"]);
        print("111111111111111111111111");
        //print(subcategories);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    search = TextEditingController();
    getData();
    super.onInit();
  }

  @override
  goToProductDetails(productModel) {
    Get.toNamed(AppRoute.productDetails,
        arguments: {"productModel": productModel});
  }

  @override
  goToSubCategory(categoryid) {
    Get.toNamed(AppRoute.subcategory, arguments: {
      "categoryid": categoryid,
    });
  }
}

class SearchMixController extends GetxController {
  TextEditingController? search;
  bool isSearch = false;
  HomeData homeData = HomeData(Get.find());
  late StatusRequest statusRequest;
  List<Product> productModel = [];

  checkSearch(val) {
    if (val == "") {
      isSearch = false;
    }
    update();
  }

  getSearchData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.searchData(search!.text);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        productModel.clear();
        List responseProducts = response['products'];
        productModel.addAll(responseProducts.map((e) => Product.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  onSearchProduct() {
    isSearch = true;
    getSearchData();
    update();
  }
}
