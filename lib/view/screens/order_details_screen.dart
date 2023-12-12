// ignore_for_file: prefer_const_constructors

import 'package:doors/controller/orderdetails_controller.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    OrderDetailsController controller = Get.put(OrderDetailsController());
    var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);

    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.white,
          title: Text(
            "تفاصيل الطلب",
            style: TextStyle(color: AppColor.indigo),
          ),
          centerTitle: true,
        ),
        body: GetBuilder<OrderDetailsController>(
          builder: (controller) => Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Table(
                            children: [
                              TableRow(children: [
                                Text(
                                  "الصنف",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.bronze),
                                ),
                                Text(
                                  "الكمية",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.bronze),
                                ),
                                Text(
                                  "القيمة",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: AppColor.bronze),
                                ),
                              ]),
                              ...List.generate(
                                controller.orderViewModel.length,
                                (index) => TableRow(children: [
                                  Text(
                                    controller.orderViewModel[index].title! +
                                        "  " +
                                        controller.orderViewModel[index].size!,
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    controller
                                        .orderViewModel[index].countProduct
                                        .toString(),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    formatter.format(double.parse(controller
                                        .orderViewModel[index].productPrice!)),
                                    textAlign: TextAlign.center,
                                  ),
                                ]),
                              ),
                            ],
                          ),
                          Container(
                              padding: EdgeInsets.only(
                                  top: 15, bottom: 10, left: 10, right: 10),
                              child: Text(
                                "سعر الطلب: ${formatter.format(controller.orderModel.orderPrice)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(
                                "سعر التوصيل: ${formatter.format(controller.orderModel.orderPricedelivery)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                          Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 10),
                              child: Text(
                                "السعر الكلي: ${formatter.format(controller.orderModel.orderTotalprice)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Card(
                      child: Container(
                    child: ListTile(
                      title: Text("العنوان:"),
                      subtitle: Text("${controller.orderModel.orderAddress}"),
                    ),
                  )),
                ],
              )),
        ));
  }
}
