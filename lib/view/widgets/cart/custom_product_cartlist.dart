// ignore_for_file: prefer_const_constructors

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/controller/cart_controller.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItemsCartList extends StatelessWidget {
  final String name;
  final String price;
  final String count;
  final String imagename;
  final String size;
  final String colorName;
  final void Function()? onAdd;
  final void Function()? onRemove;
  const CustomItemsCartList({
    Key? key,
    required this.name,
    required this.price,
    required this.count,
    required this.imagename,
    required this.onAdd,
    required this.onRemove,
    required this.size,
    required this.colorName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      builder: (controller) => Card(
        child: Row(children: [
          Expanded(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl: imagename,
                height: 90,
              )),
          Expanded(
              flex: 3,
              child: ListTile(
                trailing: Column(
                  children: [
                    Text(size),
                    SizedBox(
                      height: 5,
                    ),
                    Text(colorName)
                  ],
                ),
                title: Text(name, style: TextStyle(fontSize: 15)),
                subtitle: Text(price,
                    style: TextStyle(color: AppColor.indigo, fontSize: 17)),
              )),
          Expanded(
              child: Column(
            children: [
              SizedBox(
                  height: 35,
                  child: IconButton(onPressed: onAdd, icon: Icon(Icons.add))),
              SizedBox(
                  height: 30,
                  child: Text(
                    count,
                    style: TextStyle(fontFamily: "sans"),
                  )),
              SizedBox(
                  height: 25,
                  child:
                      IconButton(onPressed: onRemove, icon: Icon(Icons.remove)))
            ],
          ))
        ]),
      ),
    );
  }
}
