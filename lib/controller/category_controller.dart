import 'package:doors/controller/home_controller.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/category_data.dart';
import 'package:doors/data/datasource/remote/product_data.dart';
import 'package:doors/data/datasource/remote/subcategory_data.dart';
import 'package:doors/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CategoryController extends GetxController {
  intialData();
  changeSubCate(int val, int subcatVal);
  getProducts(int subcategoryid);
  getCategories();
  getSubCategories(int categoryid);
  goToProductDetails(Product productModel);
  goToSubCategory(List roots, int selectedSubCate, int categoryid);
}

class CategoryControllerImp extends SearchMixController {
  //List<Subcategory> subcategories = [];
  int? selectedSubCate;
  int? subcategoryid;
  CategoryData categoryData = CategoryData(Get.find());
  SubcategoryData subcategoryData = SubcategoryData(Get.find());
  ProductData productData = ProductData(Get.find());
  List categories = [];
  List subcategories = [];
  List products = [];
  List favorites = [];
  // ignore: overridden_fields
  MyServices myServices = Get.find();

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    getCategories();
  }

  changeSubCate(val, subcatVal) {
    selectedSubCate = val;
    subcategoryid = subcatVal;
    getProducts(subcategoryid!);
    update();
  }

  getCategories() async {
    categories.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response = await categoryData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        categories.addAll(response["categories"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  getProducts(subcategoryid) async {
    products.clear();
    statusRequest = StatusRequest.loading;
    var response = await productData.getData();
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

  goToSubCategory(int categoryid) {
    Get.toNamed(AppRoute.subcategory, arguments: {
      //   "subcategories": subcategories,
      //   "selectedSubCate": selectedSubCate,
      "categoryid": categoryid,
    });
    Get.toNamed(AppRoute.subcategory);
  }

  goToProductDetails(productModel) {
    Get.toNamed(AppRoute.productDetails,
        arguments: {"productModel": productModel});
  }
}
