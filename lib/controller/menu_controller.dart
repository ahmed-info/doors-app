import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/menu_data.dart';
import 'package:doors/data/model/category.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class MenuController extends GetxController {
  getData();
  goToRegister();
  goToLogin();
  goToLogout();
  checkIsLogin();
}

class MenuControllerImp extends MenuController {
  MenuData menuData = MenuData(Get.find());
  List<CategoryModel> categories = [];
  late StatusRequest statusRequest;
  var storage = const FlutterSecureStorage();
  MyServices myServices = Get.find();
  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await menuData.getData();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        List responsecategories = response["categories"];
        categories
            .addAll(responsecategories.map((e) => CategoryModel.fromJson(e)));
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  goToRegister() {
    Get.offNamed(AppRoute.register);
  }

  @override
  goToLogin() {
    Get.toNamed(AppRoute.login);
  }

  @override
  goToLogout() async {
    statusRequest = StatusRequest.loading;
    var response = await menuData.logout();

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        print("logout============ ");
        myServices.sharedPreferences!.remove("token");
        myServices.sharedPreferences!.remove("id");
        myServices.sharedPreferences!.remove("name");
        Get.toNamed(AppRoute.homeScreen);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
  }

  @override
  bool checkIsLogin() {
    if (myServices.sharedPreferences!.getString("token") != null) {
      return true;
    }
    return false;
  }
}
