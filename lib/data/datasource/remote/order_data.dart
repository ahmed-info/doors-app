import 'package:dartz/dartz.dart';
import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/app_link.dart';

class OrderData {
  MyApi myApi;
  OrderData(this.myApi);
  addOrder(Map order) async {
    var response = await myApi.callApi(AppLink.orderStore, order);

    return response.fold((l) => l, (r) => r);
  }

  getOrdersByUserid(String userid) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.ordersByUserid}/$userid');
    print("get order by userid $response");

    return response.fold((l) => l, (r) => r);
  }

  getOrderDetails(String orderid) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.orderDetails}/$orderid');
    print("get order details $response");

    return response.fold((l) => l, (r) => r);
  }
}
