import 'package:dartz/dartz.dart';
import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/app_link.dart';

class CartData {
  MyApi myApi;
  CartData(this.myApi);
  addCart(
    int productId,
    int userId,
    String size,
    String colorName,
    int qty,
    String image,
  ) async {
    var response = await myApi.callApi(AppLink.cartStore, {
      "user_id": userId.toString(),
      "product_id": productId.toString(),
      "size": size,
      "colorName": colorName,
      "qty": qty.toString(),
      "image": image,
    });

    return response.fold((l) => l, (r) => r);
  }

  addCartCollection(
    int productId,
    int userId,
    String size,
    String colorName,
    int qty,
    String image,
  ) async {
    var response = await myApi.callApi(AppLink.cartStoreCollection, {
      "user_id": userId.toString(),
      "product_id": productId.toString(),
      "size": size,
      "colorName": colorName,
      "qty": qty.toString(),
      "image": image,
    });

    return response.fold((l) => l, (r) => r);
  }

  removeCart(int productId, int userId, String size, String colorName) async {
    print(
        "ok data product ${productId} user ${userId} size ${size} colorName ${colorName}");
    var response = await myApi.delete(
        AppLink.removeCart, productId, userId, size, colorName);
    return response.fold((l) => l, (r) => r);
  }

  getFavoriteData(String userId) async {
    var response = await myApi.getData('${AppLink.allCart}/$userId');
    return response.fold((l) => l, (r) => r);
  }

  getCountProduct(int prodID, int userid) async {
    late Either<StatusRequest, Map<dynamic, dynamic>> response;

    response =
        await myApi.getData('${AppLink.getCountProduct}/$prodID/$userid');
    return response.fold((l) => l, (r) => r);
  }

  viewCart(String? userid) async {
    var response = await myApi.getData('${AppLink.cartView}/$userid');
    print("test userid $response");

    return response.fold((l) => l, (r) => r);
  }
}
