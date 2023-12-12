import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/order_data.dart';
import 'package:doors/data/model/ordermodel.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  OrderData orderData = OrderData(Get.find());
  late StatusRequest statusRequest;
  List<OrderModel> orders = [];
  MyServices myServices = Get.find();
  goToOrderDetails(OrderModel orderModel) {
    Get.toNamed(AppRoute.orderDetails, arguments: {"ordermodel": orderModel});
  }

  initialData() async {
    getOrders();
  }

  getOrders() async {
    orders.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderData
        .getOrdersByUserid(myServices.sharedPreferences!.getString("id")!);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        List listdata = response["orders"];
        orders.addAll(listdata.map((e) => OrderModel.fromJson(e)));
        print("ok orders $orders");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
