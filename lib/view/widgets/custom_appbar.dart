import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleappbar;
  final void Function()? onPressedIcon;
  final void Function()? onPressedSearch;
  final void Function(String)? onChanged;
  final TextEditingController? mycontroller;
  const CustomAppBar(
      {Key? key,
      required this.titleappbar,
      this.onPressedIcon,
      required this.onPressedSearch,
      required this.onChanged,
      required this.mycontroller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Row(children: [
        Expanded(
            child: Directionality(
          textDirection: TextDirection.rtl,
          child: TextFormField(
            controller: mycontroller,
            onChanged: onChanged,
            decoration: InputDecoration(
                suffixIcon: Container(
                  // ignore: prefer_const_constructors
                  margin: EdgeInsets.only(left: 7),
                  decoration: BoxDecoration(
                      color: AppColor.smoke,
                      borderRadius: BorderRadius.circular(7)),
                  child: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: onPressedSearch),
                ),
                hintText: titleappbar,
                hintStyle: const TextStyle(
                  fontSize: 18,
                ),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10)),
                filled: true,
                fillColor: AppColor.white),
          ),
        )),
        const SizedBox(width: 10),
        Container(
          decoration: BoxDecoration(
              color: AppColor.white, borderRadius: BorderRadius.circular(10)),
          width: 60,
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: IconButton(
              onPressed: onPressedIcon,
              icon: Icon(
                Icons.notifications_active_outlined,
                size: 30,
                color: Colors.grey[600],
              )),
        )
      ]),
    );
  }
}
