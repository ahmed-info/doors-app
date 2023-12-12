// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:doors/core/constant/app_link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SlideCategory extends StatefulWidget {
  const SlideCategory({required key}) : super(key: key);
  //var response = await dio.get(AppConstants.serverSlides);
  //var images = AppConstants.serverSlides["data"][0]["images"];

  @override
  State<SlideCategory> createState() => _SlideCategoryState();
}

// var len = AppConstants().dataOffline["data"] as List;

class _SlideCategoryState extends State<SlideCategory> {
  late final PageController pageController;
  int pageNo = 0;
  Timer? carouselTimer;
  bool isLoading = false;

  Timer getTimer() {
    return Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageNo == categories.length - 1) {
        pageNo = 0;
      }
      pageController.animateToPage(pageNo,
          duration: Duration(seconds: 1), curve: Curves.easeInCirc);
      pageNo++;
    });
  }

  @override
  void initState() {
    fetchSlides();

    pageController = PageController(initialPage: 0, viewportFraction: 0.25);
    carouselTimer = getTimer();
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 150,
            child: Column(
              children: [
                SizedBox(
                  height: 120,
                  child: PageView.builder(
                    onPageChanged: (index) {
                      pageNo = index;
                      setState(() {});
                    },
                    controller: pageController,
                    itemBuilder: (_, index) {
                      return AnimatedBuilder(
                        animation: pageController,
                        builder: (context, child) {
                          return child!;
                        },
                        child: GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content:
                                    Text("Hello you tapp at ${index + 1} ")));
                          },
                          onPanDown: (d) {
                            carouselTimer?.cancel();
                            carouselTimer = null;
                          },
                          onPanCancel: () {
                            carouselTimer = getTimer();
                          },
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.all(12),
                                height: 30,
                                child: Text(categories[index]['title'],
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Icon(
                                  Icons.boy,
                                  size: 50,
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: categories.length,
                  ),
                ),
              ],
            ));
  }

  List<dynamic> categories = [];

  void fetchSlides() async {
    isLoading = true;
    setState(() {});
    String url = AppLink.catsSubsSlides;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    isLoading = false;
    setState(() {
      categories = json["categories"];
    });
  }
}
