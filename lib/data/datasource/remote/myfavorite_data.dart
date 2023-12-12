import 'package:doors/core/class/my_api.dart';
import 'package:doors/core/constant/app_link.dart';

class MyfavoriteData {
  MyApi myApi;
  MyfavoriteData(
    this.myApi,
  );
  getMyfav(int userid) async {
    var response = await myApi.getData('${AppLink.allFavoriteURL}/$userid');
    print("Myfavorite =================== $response");
    return response.fold((l) => l, (r) => r);
  }

  deleteFav(int favid) async {
    var response = await myApi.delete(AppLink.deleteMyFavorite, favid);
    return response.fold((l) => l, (r) => r);
  }
}
