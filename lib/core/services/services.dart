import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  SharedPreferences? sharedPreferences;
  FlutterSecureStorage? storage;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    storage = const FlutterSecureStorage();
    return this;
  }
}

initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
