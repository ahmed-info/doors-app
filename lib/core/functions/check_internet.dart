import 'dart:io';


checkInternet() async {
  try {
    var result = await InternetAddress.lookup("instagram.com");

    if (result.isNotEmpty) {
      return true;
    }
  } on SocketException catch (_) {
    print("=========== socket failure=============");
    return false;
  }
}
