
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/data/datasource/remote/home_data.dart';
import 'package:get/get.dart';

abstract class HomeController extends GetxController {
  initialData();
  getData();
}

class HomeControllerImp extends HomeController {
  HomeData homeData = HomeData(Get.find());
  List data = [];
  List categories = [];
  List subcategories = [];
  List products = [];
  late StatusRequest statusRequest;

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeData.getData();

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

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  initialData() {
    throw UnimplementedError();
  }
}
