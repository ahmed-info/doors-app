import 'package:doors/core/class/statusrequest.dart';

handlingData(response) {
  if (response is StatusRequest) {
    print("$response ================response===============");
    return response;
  } else {
    return StatusRequest.success;
  }
}
