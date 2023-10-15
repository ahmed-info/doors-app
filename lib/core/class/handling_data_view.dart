// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/core/constant/imageasset.dart';
import 'package:flutter/material.dart';

import 'package:doors/core/class/statusrequest.dart';
import 'package:lottie/lottie.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataView({
    Key? key,
    required this.statusRequest,
    required this.widget,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppAsset.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offlineFailure
            ? Center(
                child: Lottie.asset(AppAsset.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverFailure
                ? const Center(child: Text("server Failure..."))
                : statusRequest == StatusRequest.failure
                    ? Lottie.asset(AppAsset.notfound)
                    : widget;
  }
}
