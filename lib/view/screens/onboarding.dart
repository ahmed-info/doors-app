import 'package:doors/data/datasource/static/static.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            itemCount: onBoardingList.length,
            itemBuilder: (context, i) => Column(
                  children: [
                    Text(
                      onBoardingList[i].title!,
                      style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(height: 80),
                    Image.asset(onBoardingList[i].image!),
                    const SizedBox(height: 80),
                    Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          onBoardingList[i].body!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(height: 2),
                        )),
                  ],
                )),
      ),
    );
  }
}
