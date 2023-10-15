import 'package:doors/core/constant/api_const.dart';
import 'package:doors/data/model/category.dart';
import 'package:doors/data/model/product.dart';
import 'package:doors/data/model/slide.dart';
import 'package:doors/data/model/subcategory.dart';
import 'package:doors/core/class/my_api.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// List<dynamic> categories = [];
List<dynamic> subcategories = [];
List<dynamic> products = [];
List<dynamic> slides = [];

Future<List<Slide>> fetchSlides() async {
  String url = AppLink.slideUrl;
  final uri = Uri.parse(url);
  final response = await http.get(uri);

  if (response.statusCode == 200) {
    slides = jsonDecode(response.body) as List<dynamic>;
    return jsonDecode(response.body);
  } else if (response.statusCode == 404) {
    return throw Exception("not found");
  } else {
    return throw Exception("can not get Slide");
  }
}

MyApi _myApi = MyApi();
getCategory() async {
  var response = await _myApi.getRequest(AppLink.categoryURL);
  return response;
}

Future<List<Category>> fetchCategories2() async {
  String url = AppLink.categoryURL;
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    //categories = jsonDecode(response.body) as List<dynamic>;

    return jsonDecode(response.body);
  } else if (response.statusCode == 404) {
    return throw Exception("not found");
  } else {
    return throw Exception("can not get Category");
  }
}

Future<List<Category>> getAllCategories() async {
  String url = AppLink.categoryURL;
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    //categories = jsonDecode(response.body) as List<dynamic>;

    var responsebody = jsonDecode(response.body);
    var dataCategory = responsebody['data'];
    List<Category> cate = [];
    for (var jsonCategory in dataCategory) {
      Category category =
          Category(title: jsonCategory['title'], image: jsonCategory['image']);
      cate.add(category);
    }
      return cate;
  } else if (response.statusCode == 404) {
    return throw Exception("not found");
  } else {
    return throw Exception("can not get Category");
  }
}

Future<List<Subcategory>> fetchSubcategories() async {
  String url = AppLink.subcategoryURL;
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    subcategories = jsonDecode(response.body) as List<dynamic>;
    return jsonDecode(response.body);
  } else if (response.statusCode == 404) {
    return throw Exception("not found");
  } else {
    return throw Exception("can not get Sub Category");
  }
}

Future<List<Product>> fetchProducts() async {
  String url = AppLink.productURL;
  final uri = Uri.parse(url);
  final response = await http.get(uri);
  if (response.statusCode == 200) {
    products = jsonDecode(response.body) as List<dynamic>;
    return jsonDecode(response.body);
  } else if (response.statusCode == 404) {
    return throw Exception("not found");
  } else {
    return throw Exception("can not get Product");
  }
}
//////////////api //////////////////


