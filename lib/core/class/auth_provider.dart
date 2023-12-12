import 'package:doors/data/model/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  late UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String? name,
    String? phone,
  }) async {
    try {
      // UserModel user = await MyApi().registerRequest(
      //   name: name,
      //   phone: phone,
      // );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // Future<bool> login({
  //   String email,
  //   String password,
  // }) async {
  //   try {
  //     UserModel user = await AuthService().login(
  //       email: email,
  //       password: password,
  //     );

  //     _user = user;
  //     return true;
  //   } catch (e) {
  //     print(e);
  //     return false;
  //   }
  // }
}
