import 'package:doors/core/constant/app_link.dart';
import 'package:doors/data/model/slide.dart';
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
  var response = await _myApi.getData(AppLink.catsSubsSlides);
  return response;
}
