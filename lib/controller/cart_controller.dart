import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/cart_data.dart';
import 'package:doors/data/datasource/remote/order_data.dart';
import 'package:doors/data/model/cartmodel.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  CartData cartData = CartData(Get.find());
  OrderData orderData = OrderData(Get.find());
  MyServices myServices = Get.find();
  late StatusRequest statusRequest;
  List<CartModel> cartviews = [];
  double priceOrder = 0.0;
  int orderPricedelivery = 5000;
  double orderTotalPrice = 0;
  int totalCountProduct = 0;
  goToPlaceOrder() {
    if (cartviews.isEmpty) {
      return Get.snackbar("تنبيه", "السلة فارغة");
    } else {
      Get.toNamed(AppRoute.pendingOrders);
    }
  }

  onAdd(int productId, String size, String colorName, int qty,
      String image) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCart(
        productId,
        int.parse(myServices.sharedPreferences!.getString("id")!),
        size,
        colorName,
        qty,
        image);
    print("response==|||======== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        update();
        Get.rawSnackbar(title: "ملاحظة", message: "تم اضافة المنتج الى السلة");
      } else {
        Get.defaultDialog(
            title: "ملاحظة", middleText: "مشكلة في الاضافة الى السلة");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  onRemove(int productId, String size, String colorName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.removeCart(
        productId,
        int.parse(myServices.sharedPreferences!.getString("id")!),
        size,
        colorName);
    print("response========== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        update();
        Get.rawSnackbar(
            title: "ملاحظة".tr, message: "تم الغاء المنتج من قائمة السلة");
      } else {
        Get.defaultDialog(
            title: "ملاحظة".tr, middleText: "مشكلة في حذف المنتج من المفضلة");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  view() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.viewCart(
      myServices.sharedPreferences!.getString("id")!,
    );
    update();
    print("my id////   ${myServices.sharedPreferences!.getString("id")!}");
    print("response=//========= $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        List dataResponse = response['cartviews'];
        Map dataResponseTotal = response['total'];
        cartviews.clear();
        cartviews.addAll(dataResponse.map((e) => CartModel.fromJson(e)));
        priceOrder = double.parse(dataResponseTotal['totalprice']);
        totalCountProduct = int.parse(dataResponseTotal['totalcount']);
        statusRequest = StatusRequest.success;

        update();
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  resetValueCart() {
    totalCountProduct = 0;
    priceOrder = 0.0;
    cartviews.clear();
  }

  refreshPage() {
    resetValueCart();
    view();
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

  String sumOrder() {
    orderTotalPrice = orderPricedelivery + priceOrder;
    return orderTotalPrice.toString();
  }

  insertOrder() async {
    if (cartviews.isEmpty) {
      return Get.snackbar("تنبيه", "السلة فارغة");
    }

    Map order = {
      'order_userid': myServices.sharedPreferences!.getString("id")!,
      'order_address': myServices.sharedPreferences!.getString("address")!,
      'order_pricedelivery': orderPricedelivery.toString(),
      'order_price': priceOrder.toString(),
      'order_totalprice': sumOrder(),
    };
    statusRequest = StatusRequest.loading;
    var response = await orderData.addOrder(order);
    print("response order $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        print("successssssssssssssss");
        Get.snackbar("اضافة", "تم اضافة الطلب");
        Get.toNamed(AppRoute.pendingOrders);
      } else {
        Get.defaultDialog(title: "ملاحظة", middleText: "مشكلة في اضافة الطلب");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
  }

  @override
  void onInit() {
    view();
    super.onInit();
  }
}
