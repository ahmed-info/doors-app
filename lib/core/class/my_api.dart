// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/functions/check_internet.dart';
import 'package:doors/core/services/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApi {
  MyServices myServices = Get.find();

  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));

        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          //print(responsebody);
          return Right(responsebody);
        } else {
          print("===============failure===========");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print("===============catch===========");

      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> delete(
    String linkurl,
    int param1, [
    int? param2,
    String? param3,
    String? param4,
  ]) async {
    try {
      if (await checkInternet()) {
        var response = await http
            .delete(Uri.parse('$linkurl/$param1/$param2/$param3/$param4'));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          //print(responsebody);
          return Right(responsebody);
        } else {
          print("===============failure===========");
          return const Left(StatusRequest.serverFailure);
        }
      } else {
        return const Left(StatusRequest.offlineFailure);
      }
    } catch (_) {
      print("===============catch===========");

      return const Left(StatusRequest.serverFailure);
    }
  }

  Future<Either<StatusRequest, Map>> callApi(String linkurl, Map data) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), body: data);
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  Future<Either<StatusRequest, Map>> logout(String linkurl) async {
    if (await checkInternet()) {
      var response = await http.post(Uri.parse(linkurl), headers: {
        'Content-Type': 'application/json',
        "Accept": "application/json",
        'Authorization':
            'Bearer ${myServices.sharedPreferences!.getString("token")}',
      });
      print(response.statusCode);

      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);

        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverFailure);
      }
    } else {
      return const Left(StatusRequest.offlineFailure);
    }
  }

  // Future<UserModel> registerRequest({
  //   String? name,
  //   String? phone,
  // }) async {
  //   var url = AppRoute.register;
  //   var headers = {'Content-Type': 'application/json'};
  //   var body = jsonEncode({
  //     'name': name,
  //     'phone': phone,
  //   });

  //   var response = await http.post(
  //     Uri.parse(url),
  //     headers: headers,
  //     body: body,
  //   );

  //   print(response.body);

  //   if (response.statusCode == 200) {
  //     var data = jsonDecode(response.body);
  //     print("user=========== $data");
  //     print("user=========== ${data[0]}");
  //     UserModel user = UserModel.fromJson(data['users']);

  //     return user;
  //   } else {
  //     throw Exception('Gagal Register');
  //   }
  // }

  // postRequest(String url, Map data) async {
  //   if (await checkInternet()) {
  //     var response = await http.post(Uri.parse(url), body: data);
  //     if (response.statusCode == 200) {
  //       var responsebody = jsonDecode(response.body);
  //       return responsebody;
  //     } else {
  //       return StatusRequest.serverFailure;
  //     }
  //   } else {
  //     return StatusRequest.offlineFailure;
  //   }
  // }

  // getRequest(String url) async {
  //   try {
  //     var response = await http.get(Uri.parse(url));
  //     if (response.statusCode == 200) {
  //       var responsebody = jsonDecode(response.body);
  //       return responsebody;
  //     } else {
  //       print("Error ${response.statusCode}");
  //     }
  //   } catch (e) {
  //     print("Error Catch $e");
  //   }
  // }
}
