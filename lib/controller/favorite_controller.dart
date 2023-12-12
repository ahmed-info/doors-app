import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/favorite_data.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  FavoriteData favoriteData = FavoriteData(Get.find());
  Map isFavorite = {};
  late StatusRequest statusRequest;
  MyServices myServices = Get.find();

  setFavorite(id, val) {
    isFavorite[id] = val;
    update();
  }

  addfavorite(int productId) async {
    statusRequest = StatusRequest.loading;
    var response = await favoriteData.addFav(
        int.parse(myServices.sharedPreferences!.getString("id")!), productId);
    print("response========== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        update();
        Get.rawSnackbar(
            title: "ملاحظة".tr, message: "تم اضافة المنتج الى المفضلة");
      } else {
        Get.defaultDialog(
            title: "ملاحظة".tr, middleText: "مشكلة في الاضافة الى المفضلة");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  removeFavorite(int productId) async {
    statusRequest = StatusRequest.loading;

    var response = await favoriteData.removeFav(
        productId, int.parse(myServices.sharedPreferences!.getString("id")!));
    print("response========== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        update();
        Get.rawSnackbar(
            title: "ملاحظة".tr, message: "تم الغاء المنتج من قائمة المفضلة");
      } else {
        Get.defaultDialog(
            title: "ملاحظة".tr, middleText: "مشكلة في حذف المنتج من المفضلة");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  bool checkIsLogin() {
    if (myServices.sharedPreferences!.getString("id") == null) {
      Get.defaultDialog(
        content: const Text("سجل الدخول اولا"),
        textCancel: "لا",
        textConfirm: "نعم",
        onConfirm: () {
          Get.toNamed(AppRoute.register);
        },
      );
      return false;
    }
    return true;
  }
}
