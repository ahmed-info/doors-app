// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/app_link.dart';
import 'package:doors/core/class/my_api.dart';

class ProductData {
  MyApi myApi;
  ProductData(
    this.myApi,
  );
  getData() async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.allproducts}');
    print("test userid $response");

    return response.fold((l) => l, (r) => r);
  }

  checkFoundProduct(
    String size,
    String colorName,
    String qty,
  ) async {
    print("link========== ${AppLink.checkFoundProduct}");
    var response = await myApi.callApi(AppLink.checkFoundProduct, {
      "size": size,
      "colorName": colorName,
      "qty": qty,
    });
    return response.fold((l) => l, (r) => r);
  }

  getProductAttr(int id) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;
    response = await myApi.getData('${AppLink.productattrs}/$id');
    //response = await myApi.getData('${AppLink.subcategoryWithProduct}/$id');
    print("get productAttr $response");

    return response.fold((l) => l, (r) => r);
  } // getDataProduct(String id) async {
  //   var response =
  //       await myApi.postData(AppLink.productURL, {"id": id.toString()});
  //   return response.fold((l) => l, (r) => r);
  // }
}
