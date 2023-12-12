import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/constant/app_link.dart';

class FavoriteData {
  MyApi myApi;
  FavoriteData(this.myApi);
  addFav(int userId, int productId) async {
    var response = await myApi.callApi(AppLink.addFavoriteURL,
        {"user_id": userId.toString(), "product_id": productId.toString()});

    return response.fold((l) => l, (r) => r);
  }

  removeFav(int productId, int userId) async {
    var response =
        await myApi.delete(AppLink.removerFavoriteURL, productId, userId);
    return response.fold((l) => l, (r) => r);
  }



  getFavoriteData(String userId) async {
    var response = await myApi.getData('${AppLink.favoriteURL}/$userId');

    return response.fold((l) => l, (r) => r);
  }
}
