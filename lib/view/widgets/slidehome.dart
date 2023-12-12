// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:doors/core/constant/app_link.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SlideHome extends StatefulWidget {
  const SlideHome({required key}) : super(key: key);
  //var response = await dio.get(AppConstants.serverSlides);
  //var images = AppConstants.serverSlides["data"][0]["images"];

  @override
  State<SlideHome> createState() => _SlideHomeState();
}

// var len = AppConstants().dataOffline["data"] as List;

class _SlideHomeState extends State<SlideHome> {
  late final PageController pageController;
  int pageNo = 0;
  Timer? carouselTimer;
  bool isLoading = false;

  Timer getTimer() {
    return Timer.periodic(Duration(seconds: 3), (timer) {
      if (pageNo == slides.length - 1) {
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

    pageController = PageController(initialPage: 0, viewportFraction: 0.85);
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

      return isLoading ==true
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
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
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                          "Hello you tapp at ${index + 1} ")));
                            },
                            onPanDown: (d) {
                              carouselTimer?.cancel();
                              carouselTimer = null;
                            },
                            onPanCancel: () {
                              carouselTimer = getTimer();
                            },
                            child: Container(
                              margin: EdgeInsets.all(12),
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image:
                                          CachedNetworkImageProvider(slides[index]['image'])),
                                  borderRadius: BorderRadius.circular(24)),
                            ),
                          ),
                        );
                      },
                      itemCount: slides.length,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                          slides.length,
                          (index) => Container(
                                margin: EdgeInsets.all(2),
                                child: Icon(
                                  Icons.circle,
                                  size: 12,
                                  color: pageNo == index
                                      ? Colors.indigoAccent
                                      : Colors.grey,
                                ),
                              )),
                    ),
                  ),
                ],
              ));
    
  }

  List<dynamic> slides = [];

  void fetchSlides() async {
    isLoading = true;
    setState(() {});
    String url = AppLink.slideUrl;
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    isLoading = false;
    setState(() {
      slides = json["data"];
    });
  }
}
