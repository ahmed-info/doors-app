import 'package:flutter/material.dart';

class MyAppbar extends StatelessWidget {
  const MyAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  width: 140, image: AssetImage("assets/images/mainlogo.png")))
        ],
      ),
    );
  }
}
