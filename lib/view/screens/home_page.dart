// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:doors/controller/home_controller.dart';
import 'package:doors/core/constant/api_const.dart';
import 'package:doors/data/model/category.dart';
import 'package:doors/network/api_request.dart';
import 'package:doors/core/class/my_api.dart';
import 'package:doors/view/screens/menu.dart';
import 'package:doors/view/widgets/carousel.dart';
import 'package:doors/view/widgets/category_item.dart';
import 'package:doors/view/widgets/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  late Map<String, dynamic> mycate;
  static int _selectedIndex = 0;
  bool isLoading = false;
  PageController pageController = PageController();

  void onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    pageController.animateToPage(index,
        duration: Duration(microseconds: 1000), curve: Curves.easeIn);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(HomeControllerImp());
    return Scaffold(
      //backgroundColor: Colors.grey,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.grey,
                )),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.grey,
                )),
            const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Image(
                    width: 140,
                    image: AssetImage("assets/images/mainlogo.png")))
          ],
        ),
      ),
      body: PageView(
        controller: pageController,
        children: [
          Menu(),
          Container(
            color: Colors.blue,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleBar(
                mytitle: "تشكيلة متنوعة تناسب جميع الاذاق",
                mycolor: const Color.fromARGB(255, 176, 0, 0),
              ),
              TitleBar(mytitle: "توصيل مجاني لهذه المنتجات"),
              Carousel(key: null),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: FutureBuilder(
                          future: getCategory(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return GridView.builder(
                                  itemCount: snapshot.data['data'].length,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          childAspectRatio: 0.75),
                                  itemBuilder: (context, index) => CategoryItem(
                                        category: snapshot.data['data'][index],
                                      ));
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Text("sdfbg");
                          })))
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 18,
        unselectedFontSize: 16,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.menu,
              size: 28,
            ),
            label: "menu".tr,
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "basket".tr),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "home".tr),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.red,
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
    );
  }
}
