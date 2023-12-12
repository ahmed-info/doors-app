// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:doors/controller/menu_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/constant/colors.dart';
import 'package:doors/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuScreen extends GetView<MenuControllerImp> {
  const MenuScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuControllerImp controller = Get.find();
    MyServices myServices = Get.find();
    return Container(
      decoration: const BoxDecoration(
          color: AppColor.white,
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(50))),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            color: AppColor.smoke,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        myServices.sharedPreferences!.getString("name") == null
                            ? "مستخدم كضيف"
                            : myServices.sharedPreferences!.getString("name")!,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 7, horizontal: 6),
                      margin: const EdgeInsets.only(left: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.black),
                      child: InkWell(
                        onTap: () {},
                        child: const Text("مشاهدة الملف الشخصي",
                            textAlign: TextAlign.start,
                            style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                    )
                  ],
                ),
                Image.asset(
                  "assets/images/avatar.png",
                  width: 85,
                )
              ],
            ),
          ),
          GetBuilder<MenuControllerImp>(
              builder: (controller) => HandlingDataView(
                    statusRequest: controller.statusRequest,
                    widget: const Text("MENU"),
                  )),
          ListTile(
            leading:
                Text(controller.checkIsLogin() ? "تسجيل خروج" : "تسجيل دخول"),
            trailing: const Icon(Icons.logout),
            onTap: () {
              if (controller.checkIsLogin()) {
                controller.goToLogout();
              } else {
                controller.goToLogin();
              }
            },
          ),
          ListTile(
            leading: const Text("طلباتي"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          ListTile(
            leading: const Text("اتصل بنا"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
