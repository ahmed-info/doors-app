// ignore_for_file: prefer_const_constructors

import 'package:doors/controller/login_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/core/functions/valid_input.dart';
import 'package:doors/view/widgets/custom_button_auth.dart';
import 'package:doors/view/widgets/custom_text_body_auth.dart';
import 'package:doors/view/widgets/custom_text_form_auth.dart';
import 'package:doors/view/widgets/custom_text_sign.dart';
import 'package:get/get.dart';

class LogingScreen extends StatelessWidget {
  const LogingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'دخول',
        ),
        backgroundColor: AppColor.indigo,
        elevation: 0.0,
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: StatusRequest.success,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formStateLogin,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextBodyAuth(text: "اهلا بك"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(text: 'ادخل رقم الموبايل'),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                      isNumber: true,
                      valid: (val) {
                        return validInput(val!, 11, 11, "phone");
                      },
                      myController: controller.phone,
                      hinttext: "مثال : 07812345678",
                      icontext: "موبايل",
                      iconData: Icons.phone_outlined),

                  CustomButtonAuth(
                      text: "التالي",
                      onPressed: () {
                        print("click login");
                        controller.doLogin();
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  //////////test/////////////
                  CustomTextSign(
                      textOne: "ليس لديك حساب",
                      textTwo: "تسجيل الدخول",
                      onTap: () {
                        controller.goToRegister();
                      }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
