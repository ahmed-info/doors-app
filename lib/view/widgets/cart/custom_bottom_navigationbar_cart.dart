// ignore_for_file: prefer_const_constructors

import 'package:doors/core/constant/colors.dart';
import 'package:doors/view/widgets/cart/button_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class BottomNavgationBarCart extends StatelessWidget {
  final double price;
  final int shipping;
  final double totalprice;
  final void Function()? onPress;
  const BottomNavgationBarCart(
      {Key? key,
      required this.price,
      required this.shipping,
      required this.totalprice,
      required this.onPress})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("السعر", style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(formatter.format(price),
                    style: TextStyle(fontSize: 16)))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("التوصيل", style: TextStyle(fontSize: 16))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(formatter.format(shipping),
                    style: TextStyle(fontSize: 16)))
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text("السعر الكلي",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.indigo))),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(formatter.format(totalprice),
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColor.indigo)))
          ],
        ),
        SizedBox(height: 10),
        CustomButtonCart(
          textbutton: "Place Order",
          onPressed: onPress,
        )
      ],
    );
  }
}
