// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/app_link.dart';
import 'package:doors/core/class/my_api.dart';

class SubcategoryData {
  MyApi myApi;
  SubcategoryData(
    this.myApi,
  );
  getData(int id) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.subcategoryURL}/$id');
    //response = await myApi.getData('${AppLink.subcategoryWithProduct}/$id');
    print("test subcategory update $response");

    return response.fold((l) => l, (r) => r);
  }

  getProductbySubcategory(int id) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.productsBySubcategory}/$id');
    //response = await myApi.getData('${AppLink.subcategoryWithProduct}/$id');
    print("get product by subcategoryid $response");

    return response.fold((l) => l, (r) => r);
  }

  getProductbyCategory(int id) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.subcategoryWithProduct}/$id');
    print("get product with subcategory    $response");

    return response.fold((l) => l, (r) => r);
  }
  // getDataProduct(String id) async {
  //   var response =
  //       await myApi.postData(AppLink.productURL, {"id": id.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }
}
