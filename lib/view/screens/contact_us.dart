import 'package:flutter/material.dart';
class ContactUs extends StatelessWidget {
  const ContactUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
          trailing: Text("اتصل بنا"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
        ListTile(
          trailing: Text("اتصل بنا"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
        ListTile(
          trailing: Text("اتصل بنا"),
          leading: const Icon(Icons.arrow_back_ios),
          onTap: () {},
        ),
    ],);
  }
}