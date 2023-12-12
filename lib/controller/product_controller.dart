import 'package:doors/controller/home_controller.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/product_data.dart';
import 'package:doors/data/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

abstract class ProductController extends GetxController {
  intialData();
  changeSubCate(int val, int subcatVal);
  getProducts(int subcategoryid);
  goToProductDetails(Product productModel);
}

class ProductControllerImp extends SearchMixController {
  List subcategories = [];
  //int? selectedSubCate;
  //int? subcategoryid;
  ProductData productData = ProductData(Get.find());
  List products = [];
  // List favorites = [];
  late FlutterSecureStorage storage = const FlutterSecureStorage();
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;

  @override
  void onInit() {
    search = TextEditingController();
    intialData();
    super.onInit();
  }

  intialData() {
    //subcategories = Get.arguments['subcategories'];
    //selectedSubCate = Get.arguments['selectedSubCate'];
    //subcategoryid = Get.arguments['subcategoryid'];
    getProducts(1);
  }

  // changeSubCate(val, subcatVal) {
  //   //selectedSubCate = val;
  //   //subcategoryid = subcatVal;
  //   //getProducts(subcategoryid!);
  //   update();
  // }

  getProducts(subcategoryid) async {
    products.clear();
    statusRequest = StatusRequest.loading;
//myServices.sharedPreferences.getString("id")!
    var response = await productData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        List dataproduct = response["products"];
        products.addAll(dataproduct);
        print("ok product $products");
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
