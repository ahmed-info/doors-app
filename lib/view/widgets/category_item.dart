// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';


class CategoryItem extends StatelessWidget {
  final Map<String, dynamic> category;
  final Function? press;

  const CategoryItem({
    Key? key,
    required this.category,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          width: 160,
          decoration: const BoxDecoration(
              color: Colors.purple,
              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
          child: ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox.fromSize(
              size: Size.fromRadius(15), // Image radius
              child: Image.network(category['image'], fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(15))),
          width: 160,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Text(
              category['title'],
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black54, fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
