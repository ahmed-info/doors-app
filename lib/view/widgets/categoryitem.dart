// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/data/model/category.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryItem extends StatelessWidget {
  //final Map<String, dynamic> category;
  final CategoryModel categoryModel;
  void Function()? press;

  CategoryItem({
    Key? key,
    //required this.category,
    this.press,
    required this.categoryModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: press,
      child: Column(
        children: [
          Container(
            height: 180,
            width: 160,
            decoration: const BoxDecoration(
                color: Colors.purple,
                borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
              child: SizedBox.fromSize(
                size: const Size.fromRadius(15), // Image radius
                child: CachedNetworkImage(
                    imageUrl: categoryModel.image!,
                    height: 100,
                    fit: BoxFit.fill),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                color: AppColor.greyLight,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(15))),
            width: 160,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(
                categoryModel.title!,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColor.indigo, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
