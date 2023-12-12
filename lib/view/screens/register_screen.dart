// ignore_for_file: prefer_const_constructors

import 'package:doors/controller/register_controller.dart';
import 'package:doors/core/class/handling_data_view.dart';
import 'package:doors/core/class/statusrequest.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/core/functions/valid_input.dart';
import 'package:doors/view/widgets/custom_button_auth.dart';
import 'package:doors/view/widgets/custom_text_body_auth.dart';
import 'package:doors/view/widgets/custom_text_form_auth.dart';
import 'package:doors/view/widgets/custom_text_sign.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColor.white,
        centerTitle: true,
        title: Text(
          'تسجيل دخول',
        ),
        backgroundColor: AppColor.indigo,
        elevation: 0.0,
      ),
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => HandlingDataView(
          statusRequest: StatusRequest.success,
          widget: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Form(
              key: controller.formState,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CustomTextBodyAuth(text: "اهلا بك"),
                  const SizedBox(height: 10),
                  const CustomTextBodyAuth(text: 'ادخل الاسم ورقم الموبايل'),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextFormAuth(
                    valid: (val) {
                      return validInput(val!, 3, 100, "name");
                    },
                    myController: controller.name,
                    iconData: Icons.person_outline,
                    hinttext: "ادخل الاسم",
                    icontext: "الاسم",
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
                  CustomTextFormAuth(
                      isNumber: false,
                      valid: (val) {
                        return validInput(val!, 5, 50, "address");
                      },
                      myController: controller.address,
                      hinttext: "مثال : بغداد - المنصور",
                      icontext: "العنوان",
                      iconData: Icons.home),

                  CustomButtonAuth(
                      text: "التالي",
                      onPressed: () {
                        controller.signUp();
                      }),
                  const SizedBox(
                    height: 30,
                  ),
                  //////////test/////////////
                  CustomTextSign(
                      textOne: " هل لديك حساب ",
                      textTwo: "دخول",
                      onTap: () {
                        controller.goToLogin();
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
