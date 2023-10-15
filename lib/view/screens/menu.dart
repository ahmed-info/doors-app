// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/data/model/category.dart';
import 'package:doors/network/api_request.dart';
import 'package:doors/view/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          color: const Color.fromARGB(255, 230, 230, 230),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "ahmed razzaq",
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 6),
                    margin: const EdgeInsets.only(right: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black),
                    child: InkWell(
                      onTap: () {},
                      child: const Text("مشاهدة الملف الشخصي",
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  )
                ],
              ),
              Image.asset(
                "assets/images/avatar.png",
                width: 85,
              )
            ],
          ),
        ),
        SizedBox(
          height: 110,
          child: FutureBuilder(
              future: getAllCategories(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  List<Category> categories = snapshot.data!;
                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {},
                        child: ListTile(
                          trailing: Text(categories[index].title!),
                          leading: const Icon(Icons.arrow_back_ios),
                          onTap: () {},
                        ),
                      );
                    },
                  );
                }
              }),
        ),
        ListTile(
          trailing: Text("تسجيل الدخول"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
        ListTile(
          trailing: Text("طلباتي"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
        ListTile(
          trailing: Text("اتصل بنا"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
      ],
    );
  }
}
