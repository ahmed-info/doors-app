import 'package:doors/controller/order_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/view/widgets/order/card_order_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingOrderScreen extends GetView<OrderController> {
  const PendingOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: AppColor.black,
          ),
          onPressed: () => Get.back(),
        ),
        title: const Text(
          "طلبات قيد الانتظار",
          style: TextStyle(color: AppColor.black),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: GetBuilder<OrderController>(
            builder: (controller) => HandlingDataView(
                  statusRequest: controller.statusRequest,
                  widget: ListView.builder(
                    itemCount: controller.orders.length,
                    itemBuilder: (context, index) => CardOrderList(
                      orderModel: controller.orders[index],
                    ),
                  ),
                )),
      ),
    );
  }
}
