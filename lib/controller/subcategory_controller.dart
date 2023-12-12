import 'package:doors/controller/home_controller.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/product_data.dart';
import 'package:doors/data/datasource/remote/subcategory_data.dart';
import 'package:doors/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SubcategoryController extends GetxController {
  intialData();
  changeSubCate(int val);
  getProducts(int subcategoryid);
  goToProductDetails(Product productModel);
}

class SubcategoryControllerImp extends SearchMixController {
  //List<Subcategory> subcategories = [];
  List subcategories = [];

  // int? selectedSubCate;
  // int? categoryid;
  int? subcategoryid;
  SubcategoryData subcategoryData = SubcategoryData(Get.find());
  ProductData productData = ProductData(Get.find());
  List categories = [];
  //List subcategories = [];
  List products = [];
  int? categoryid;
  //late StatusRequest statusRequest;
  @override
  // ignore: overridden_fields
  StatusRequest statusRequest = StatusRequest.success;
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    //selectedSubCate = Get.arguments['selectedSubCate'];
    categoryid = Get.arguments['categoryid'];
    getSubcategory(categoryid!);
    productbyCategoryID(categoryid!);
  }

  changeSubCate(int val) {
    // selectedSubCate = val;
    subcategoryid = val;
    getProductbySubcategoryID(subcategoryid!);
    update();
  }

  getSubcategory(int categoryid) async {
    //subcategories.clear();
    subcategories.clear();
    statusRequest = StatusRequest.loading;
    var response = await subcategoryData.getData(categoryid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        print("OK SUB ${response["subcategories"]}");

        subcategories.addAll(response["subcategories"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  productbyCategoryID(int id) async {
    products.clear();
    statusRequest = StatusRequest.loading;
    var response = await subcategoryData.getProductbyCategory(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        products.addAll(response["products"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getProductbySubcategoryID(int id) async {
    products.clear();
    statusRequest = StatusRequest.loading;
    var response = await subcategoryData.getProductbySubcategory(id);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        products.addAll(response["products"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  goToProductDetails(productModel) {
    Get.toNamed(AppRoute.productDetails,
        arguments: {"productModel": productModel});
  }
}
