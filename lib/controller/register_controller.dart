// ignore_for_file: avoid_print

import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/auth/signup.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToLogin();
  showPassword();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  late TextEditingController name;
  late TextEditingController phone;
  late TextEditingController address;

  bool isHidePassword = true;
  SignupData signupData = SignupData(Get.find());
  //List data = [];
  late StatusRequest statusRequest;
  final storage = const FlutterSecureStorage();
  MyServices myServices = Get.find();
  @override
  showPassword() {
    isHidePassword = isHidePassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    // var response = await signupData.pushData("Farah", "15975314785");
    // print("ALI controll $response");
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response =
          await signupData.pushData(name.text, phone.text, address.text);
      print(
          "=============================== AhmedController ${response['message']}");
      statusRequest = handlingData(response);
      if (StatusRequest.success == statusRequest) {
        if (response["message"] == "success") {
          ////////////////////////////////////////////
          myServices.sharedPreferences!
              .setString("id", response['users']['id'].toString());
          myServices.sharedPreferences!.setString("token", response['token']);
          myServices.sharedPreferences!
              .setString("name", response['users']['name']);
          myServices.sharedPreferences!
              .setString("phone", response['users']['phone']);
          myServices.sharedPreferences!
              .setString("address", response['users']['address']);
          //update();
          Get.offNamed(AppRoute.homeScreen,
              arguments: {"phone": phone.text, "name": name.text});
          Get.defaultDialog(title: "Warning".tr, middleText: "تم تسجيلك بنجاح");
          update();
        } else {
          Get.defaultDialog(
              title: "Warning".tr, middleText: "هذا الرقم موجود بالفعل");
          statusRequest = StatusRequest.failure;
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
      //Get.delete<SignUpControllerImp>();
    } else {}
  }

  @override
  goToLogin() {
    Get.offNamed(AppRoute.login);
  }

  @override
  void onInit() {
    name = TextEditingController();
    phone = TextEditingController();
    address = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    super.dispose();
  }
}
