import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';

class SizeWidget extends StatelessWidget {
  final String text;
  final bool isActive;
  final void Function() ontap;
  const SizeWidget({
    super.key,
    required this.text,
    required this.ontap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        margin: const EdgeInsets.only(left: 15),
        decoration: BoxDecoration(
            border:
                isActive == false ? Border.all(color: AppColor.black) : null,
            color: isActive == true ? AppColor.indigo : AppColor.white,
            borderRadius: BorderRadius.circular(5)),
        child: Text(
          text,
          style: TextStyle(
              fontSize: 20,
              color: isActive == true ? AppColor.white : AppColor.black),
        ),
      ),
    );
  }
}
