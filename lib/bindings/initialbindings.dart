import 'package:doors/core/class/my_api.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(MyApi());
  }
}
