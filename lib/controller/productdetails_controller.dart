import 'package:doors/controller/cart_controller.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/routes.dart';
import 'package:doors/core/functions/handling_data_controller.dart';
import 'package:doors/core/services/services.dart';
import 'package:doors/data/datasource/remote/cart_data.dart';
import 'package:doors/data/datasource/remote/product_data.dart';
import 'package:doors/data/model/product.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

abstract class ProductDetailsController extends GetxController {}

class ProductDetailsControllerImp extends ProductDetailsController {
  late Product productModel;
  late StatusRequest statusRequest;
  int countProduct = 1;
  double myprice = 0;
  String? size;
  String image = "";
  String? colorName;
  int qty = 0;
  List productattrs = [];
  CartData cartData = CartData(Get.find());
  ProductData productData = ProductData(Get.find());
  MyServices myServices = Get.find();
  CartController cartController = Get.put(CartController());
  var formatter = NumberFormat.decimalPatternDigits(decimalDigits: 0);
  checkProduct() async {
    statusRequest = StatusRequest.loading;
    update();
    print("before check");
    var response = await productData.checkFoundProduct(
        size!, colorName!, countProduct.toString());
    print("after check");
    print("=============================== controller ${response['message']}");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        customAdd();
        cartController.refreshPage();
        Get.toNamed(AppRoute.cart);
        cartController.refreshPage();
      } else if (response["message"] == "product not found") {
        Get.rawSnackbar(title: "ملاحظة", message: "القياس او اللون غير متوفر");
        statusRequest = StatusRequest.success;
        update();
      } else if (response["message"] == "qty not found") {
        Get.rawSnackbar(
            title: "ملاحظة", message: "الكمية غير متوفرة, اختر كمية اقل");
        statusRequest = StatusRequest.success;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    //Get.delete<SignUpControllerImp>();
  }

  //CartController cartController = Get.put(CartController());
  double checkPrice() {
    if (double.parse(productModel.priceDiscount!) > 0) {
      return double.parse(productModel.priceDiscount!);
    } else {}
    return double.parse(productModel.price!);
  }

  initialData() async {
    statusRequest = StatusRequest.loading;
    productModel = Get.arguments['productModel'];
    myprice = checkPrice();
    //countProduct = await getcountProduct(productModel.prodID!);
    statusRequest = StatusRequest.success;
    productAttrs(productModel.prodID!);
    update();
  }

  getcountProduct(int prodID) async {
    statusRequest = StatusRequest.loading;
    var response = await cartData.getCountProduct(
      prodID,
      int.parse(myServices.sharedPreferences!.getString("id")!),
    );
    print("response========product details $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        int countProduct = 0;
        countProduct = response["count"];
        return countProduct;
      } else {
        statusRequest = StatusRequest.failure;
        print("errrrrrorrrr11111");
      }
    } else {
      statusRequest = StatusRequest.failure;
      print("errrrrrorrrr2222222222");
    }
  }

  productAttrs(int prodcutid) async {
    productattrs.clear();
    statusRequest = StatusRequest.loading;
    var response = await productData.getProductAttr(prodcutid);
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        print("OK Attr ${response["productattrs"]}");

        productattrs.addAll(response["productattrs"]);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }

  onAddmycartCollection(int productId, String size, String colorName, int qty,
      String image) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await cartData.addCartCollection(
        productId,
        int.parse(myServices.sharedPreferences!.getString("id")!),
        size,
        colorName,
        qty,
        image);
    print("response========== $response");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response["message"] == "success") {
        // update();
        Get.rawSnackbar(
            title: "ملاحظة".tr, message: "تم اضافة المنتج الى السلة");
      } else {
        Get.defaultDialog(
            title: "ملاحظة".tr, middleText: "مشكلة في الاضافة الى السلة");
        statusRequest = StatusRequest.failure;
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  chooseSize(String val) {
    size = val;
    update();
  }

  chooseColor(String val) {
    colorName = val;
    update();
  }
  // onRemove(int productId) async {
  //   statusRequest = StatusRequest.loading;
  //   update();
  //   var response = await cartData.removeCart(
  //       productId, int.parse(myServices.sharedPreferences!.getString("id")!));
  //   print("response========== $response");
  //   statusRequest = handlingData(response);
  //   if (StatusRequest.success == statusRequest) {
  //     if (response["message"] == "success") {
  //       update();
  //       // Get.rawSnackbar(
  //       //     title: "ملاحظة".tr, message: "تم الغاء المنتج من قائمة المفضلة");
  //     } else {
  //       Get.defaultDialog(
  //           title: "ملاحظة", middleText: "مشكلة في حذف المنتج من المفضلة");
  //       statusRequest = StatusRequest.failure;
  //     }
  //   } else {
  //     statusRequest = StatusRequest.failure;
  //   }
  //   update();
  // }

  add() {
    countProduct++;
    myprice = checkPrice() * countProduct;
    priceDetails(countProduct);
    update();
  }

  double priceDetails(int countprod) {
    if (double.parse(productModel.priceDiscount!) > 0) {
      return double.parse(productModel.priceDiscount!) * countprod;
    } else {
      return double.parse(productModel.price!) * countprod;
    }
  }

  customAdd() {
    onAddmycartCollection(
        productModel.prodID!, size!, colorName!, countProduct, image);
    update();
  }

  remove() {
    if (countProduct > 0) {
      //onRemove(productModel.prodID!);
      countProduct--;
      myprice = checkPrice() * countProduct;

      priceDetails(countProduct);
      update();
    }
  }
}
