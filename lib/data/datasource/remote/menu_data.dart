// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/core/constant/app_link.dart';
import 'package:doors/core/class/my_api.dart';

class MenuData {
  MyApi myApi;
  MenuData(
    this.myApi,
  );
  getData() async {
    var response = await myApi.getData(AppLink.catsSubsSlides);
    return response.fold((l) => l, (r) => r);
  }

  logout() async {
    var response = await myApi.logout(AppLink.logoutURL);
    return response.fold((l) => l, (r) => r);
  }
}
