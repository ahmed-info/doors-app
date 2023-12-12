import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/constant/app_link.dart';

class LoginData {
  MyApi myApi;
  LoginData(this.myApi);
  pushData(String phone) async {
    print("link========== ${AppLink.loginURL}");
    var response = await myApi.callApi(AppLink.loginURL, {
      "phone": phone,
    });
    return response.fold((l) => l, (r) => r);
  }
}
