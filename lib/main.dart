// ignore_for_file: prefer_const_constructors

import 'package:doors/bindings/initialbindings.dart';
import 'package:doors/core/localization/changelocal.dart';
import 'package:doors/core/localization/translation.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/routes.dart';
import 'package:doors/view/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: "select language".tr,
      locale: controller.language,
      initialBinding: InitialBindings(),
      getPages: routes,
    );
  }
}
