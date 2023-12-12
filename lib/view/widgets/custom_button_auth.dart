// ignore_for_file: prefer_const_constructors, file_names

import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtonAuth({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        onPressed: onPressed,
        color: AppColor.indigo,
        textColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 14),
        child: Text(text),
      ),
    );
  }
}
