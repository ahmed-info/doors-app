import 'package:get/get.dart';

validInput(String value, int min, int max, String type) {
  if (type == "name") {
    if (value.isEmpty || value.isNumericOnly) {
      return "ادخل الاسم بشكل صحيح";
    }
  }
  if (type == "address") {
    if (value.isEmpty || value.isNumericOnly) {
      return "ادخل العنوان بشكل صحيح";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(value)) {
      return "not valid Email".tr;
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(value)) {
      return "not valid phone number".tr;
    }
  }
  if (type == "name") {
    if (value.isEmpty) {
      return "can't be Empty".tr;
    }
  }

  if (type == "address") {
    if (value.isEmpty) {
      return "can't be Empty".tr;
    }
  }
  if (value.length < min) {
    return "can't be less than $min".tr;
  }

  if (value.length > max) {
    return "can't be more than $max".tr;
  }
}
