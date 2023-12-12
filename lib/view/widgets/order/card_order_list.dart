import 'package:doors/controller/order_controller.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/ordermodel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

// ignore: must_be_immutable
class CardOrderList extends StatelessWidget {
  OrderModel orderModel;
  CardOrderList({
    Key? key,
    required this.orderModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderController controller = Get.put(OrderController());
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("رقم الطلب: ${orderModel.orderId}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold)),
                Text(Jiffy.parse(orderModel.createdAt!).fromNow()),
              ],
            ),
            const Divider(),
            Text("سعر الطلب: ${orderModel.orderPrice}"),
            Text("سعر التوصيل ${orderModel.orderPricedelivery}"),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("السعر الكلي: ${orderModel.orderTotalprice}",
                    style: const TextStyle(
                        color: AppColor.bronze, fontWeight: FontWeight.bold)),
                MaterialButton(
                  onPressed: () {
                    controller.goToOrderDetails(orderModel);
                  },
                  color: AppColor.bronze,
                  textColor: AppColor.white,
                  child: const Text(
                    "التفاصيل",
                    style: TextStyle(fontSize: 18),
                  ),
                )
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
