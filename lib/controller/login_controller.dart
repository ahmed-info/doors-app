// ignore_for_file: avoid_print

import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/auth/login_data.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class LoginController extends GetxController {
  doLogin();
  goToRegister();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formStateLogin = GlobalKey<FormState>();

  late TextEditingController phone;

  LoginData loginData = LoginData(Get.find());
  //List data = [];
  late StatusRequest statusRequest;
  final storage = const FlutterSecureStorage();
  MyServices myServices = Get.find();

  @override
  doLogin() async {
    print("before validate");
    if (formStateLogin.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      print("before login");
      var response = await loginData.pushData(phone.text);
      print("after login");
      print(
          "=============================== controller ${response['message']}");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["message"] == "success") {
          print("hahahahahah");
          ////////////////////////////////////////////
          myServices.sharedPreferences!
              .setString("id", response['user']['id'].toString());
          String myid = myServices.sharedPreferences!.getString("id")!;
          print("myid ============ $myid");
          myServices.sharedPreferences!.setString("token", response['token']);
          myServices.sharedPreferences!
              .setString("name", response['user']['name']);
          myServices.sharedPreferences!
              .setString("phone", response['user']['phone']);
          myServices.sharedPreferences!
              .setString("address", response['user']['address']);
          Get.offNamed(AppRoute.homeScreen, arguments: {"phone": phone.text});
          Get.rawSnackbar(title: "ملاحظة", message: "تم تسجيلك بنجاح");
        } else {
          Get.defaultDialog(
              title: "Warning".tr, middleText: "هذا الرقم غير موجود");
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      //Get.delete<SignUpControllerImp>();
    } else {}
  }

  @override
  void onInit() {
    phone = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    phone.dispose();
    super.dispose();
  }

  @override
  goToRegister() {
    Get.offNamed(AppRoute.register);
  }
}
