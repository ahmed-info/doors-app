import 'package:get/get.dart';

class MyTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        "en": {
          "select language": "select language",
          "home": "home",
          "menu": "menu",
          "basket": "basket",
        },
        "ar": {
          "select language": "اختر اللغة",
          "home": "الرئيسية",
          "menu": "القائمة",
          "basket": "السلة",
        },
      };
}
