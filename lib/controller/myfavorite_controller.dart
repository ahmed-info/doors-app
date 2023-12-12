import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/myfavorite_data.dart';
import 'package:doors/data/model/myfavorite.dart';
import 'package:get/get.dart';

class MyfavoriteController extends GetxController {
  MyfavoriteData myfavoriteData = MyfavoriteData(Get.find());
  late StatusRequest statusRequest;
  List<MyFavoriteModel> myfavorites = [];
  MyServices myServices = Get.find();

  getMyfavorite() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await myfavoriteData
        .getMyfav(int.parse(myServices.sharedPreferences!.getString("id")!));
    update();
    print("response========== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      myfavorites.clear();
      if (response["message"] == "success") {
        myfavorites.clear();
        List listMyfavorite = response['myfavorites'];
        myfavorites
            .addAll(listMyfavorite.map((e) => MyFavoriteModel.fromJson(e)));
        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
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

  deleteFavorite(int favid) {
    myfavoriteData.deleteFav(favid);
    myfavorites.removeWhere((element) => element.favID == favid);

    update();
  }

  @override
  void onInit() async {
    myfavorites.clear();
    await getMyfavorite();
    super.onInit();
  }
}
