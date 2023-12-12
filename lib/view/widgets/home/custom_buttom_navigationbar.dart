// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButtonNavigationbar extends StatelessWidget {
  final void Function() onPressed;
  final String textButton;
  final IconData icon;
  bool active = false;

  CustomButtonNavigationbar({
    Key? key,
    required this.onPressed,
    required this.textButton,
    required this.icon,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        child: Column(
          children: [
            Icon(
              icon,
              size: 32,
              color: active == true ? AppColor.white : AppColor.greyDark,
            ),
            Text(
              textButton,
              style: TextStyle(
                  color: active == true ? AppColor.white : AppColor.greyDark,fontSize: 20),
            )
          ],
        ));
  }
}
