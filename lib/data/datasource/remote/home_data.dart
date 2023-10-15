// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/core/constant/api_const.dart';
import 'package:doors/core/class/my_api.dart';

class HomeData {
  MyApi myApi;
  HomeData(
    this.myApi,
  );
  getData() async {
    var response = await myApi.getData(AppLink.categoryURL);
    return response.fold((l) => l, (r) => r);
  }
}
