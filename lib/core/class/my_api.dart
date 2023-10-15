// ignore_for_file: avoid_print

import 'package:dartz/dartz.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/functions/check_internet.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyApi {
  Future<Either<StatusRequest, Map>> getData(String linkurl) async {
    try {
      if (await checkInternet()) {
        var response = await http.get(Uri.parse(linkurl));
        if (response.statusCode == 200 || response.statusCode == 201) {
          Map responsebody = jsonDecode(response.body);
          print(responsebody);
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

      return Left(StatusRequest.serverFailure);
    }
  }

  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error Catch $e");
    }
  }

  // postRequest(String url, Map data) async {
  //   try {
  //     var response = await http.post(Uri.parse(url), body: data);
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
