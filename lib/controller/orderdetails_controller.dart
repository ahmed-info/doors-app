import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/data/datasource/remote/order_data.dart';
import 'package:doors/data/model/ordermodel.dart';
import 'package:doors/data/model/orderviewmodel.dart';
import 'package:get/get.dart';

class OrderDetailsController extends GetxController {
  late OrderModel orderModel;
  List<OrderViewModel> orderViewModel = [];
  OrderData orderData = OrderData(Get.find());
  late StatusRequest statusRequest;
  getOrders(String orderId) async {
    orderViewModel.clear();
    statusRequest = StatusRequest.loading;
    var response = await orderData.getOrderDetails(orderId);

    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        List listdata = response["orderviews"];
        orderViewModel.addAll(listdata.map((e) => OrderViewModel.fromJson(e)));
        print("ok order view model Details $orderViewModel");
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    orderModel = Get.arguments['ordermodel'];
    getOrders(orderModel.orderId.toString());
    super.onInit();
  }
}
