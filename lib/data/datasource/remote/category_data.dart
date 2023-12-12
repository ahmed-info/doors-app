// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/app_link.dart';
import 'package:doors/core/class/my_api.dart';

class CategoryData {
  MyApi myApi;
  CategoryData(
    this.myApi,
  );
  getData() async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.categoryURL}');
    print("test category up $response");

    return response.fold((l) => l, (r) => r);
  }

  // getDataProduct(String id) async {
  //   var response =
  //       await myApi.postData(AppLink.productURL, {"id": id.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }
}
