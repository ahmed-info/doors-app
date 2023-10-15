import 'package:doors/core/constant/routes.dart';
import 'package:doors/view/screens/contact_us.dart';
import 'package:doors/view/screens/home_page.dart';
import 'package:doors/view/screens/menu.dart';
import 'package:doors/view/screens/onboarding.dart';
import 'package:doors/view/test.dart';
import 'package:doors/view/test_view.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const HomePage()),
  GetPage(name: AppRoute.test, page: () => const Test()),
  GetPage(name: AppRoute.home, page: () => const HomePage()),
  GetPage(name: AppRoute.menu, page: () => const Menu()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
];
// Map<String, Widget Function(BuildContext)> routess = {
//   AppRoute.test: (context) => const Test(),
//   AppRoute.home: (context) => const HomePage(),
//   AppRoute.menu: (context) => const Menu(),
//   AppRoute.onboarding: (context) => const OnBoarding(),
//   AppRoute.contactus: (context) => const ContactUs(),
// };
