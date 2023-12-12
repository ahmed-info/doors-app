import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/constant/app_link.dart';

class SignupData {
  MyApi myApi;
  SignupData(this.myApi);
  pushData(String name, String phone, String address) async {
    var response = await myApi.callApi(AppLink.registerURL, {
      "name": name,
      "phone": phone,
      "address": address,
    });
    return response.fold((l) => l, (r) => r);
  }
}
