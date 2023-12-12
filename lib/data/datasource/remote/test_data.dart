// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/core/constant/app_link.dart';
import 'package:doors/core/class/my_api.dart';

class TestData {
  MyApi myApi;
  TestData(
    this.myApi,
  );
  getData() async {
    var response = await myApi.getData(AppLink.catsSubsSlides);
    return response.fold((l) => l, (r) => r);
  }
}
