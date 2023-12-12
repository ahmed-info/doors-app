import 'package:doors/core/constant/colors.dart';
import 'package:flutter/material.dart';

class CountAndTitle extends StatelessWidget {
  final void Function() onAdd;
  final void Function() onRemove;
  final String title;
  final int count;
  const CountAndTitle(
      {super.key,
      required this.onAdd,
      required this.onRemove,
      required this.title,
      required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: Theme.of(context)
                .textTheme
                .headlineMedium!
                .copyWith(color: AppColor.indigo)),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppColor.indigo),
          child: Row(
            children: [
              IconButton(
                  onPressed: onAdd,
                  icon: Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.add))),
              Text(
                count.toString(),
                style: const TextStyle(fontSize: 20, color: AppColor.white),
              ),
              IconButton(
                  onPressed: onRemove,
                  icon: Container(
                      decoration: BoxDecoration(
                          color: AppColor.white,
                          borderRadius: BorderRadius.circular(5)),
                      child: const Icon(Icons.remove))),
            ],
          ),
        )
      ],
    );
  }
}
