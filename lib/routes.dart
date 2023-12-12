import 'package:doors/core/constant/routes.dart';
import 'package:doors/view/screens/cart_screen.dart';
import 'package:doors/view/screens/contact_us.dart';
import 'package:doors/view/screens/home_screen.dart';
import 'package:doors/view/screens/login_screen.dart';
import 'package:doors/view/screens/menu_screen.dart';
import 'package:doors/view/screens/myfavorite_screen.dart';
import 'package:doors/view/screens/onboarding.dart';
import 'package:doors/view/screens/order_details_screen.dart';
import 'package:doors/view/screens/pending_orders.dart';
import 'package:doors/view/screens/product_details.dart';
import 'package:doors/view/screens/product_screen.dart';
import 'package:doors/view/screens/register_screen.dart';
import 'package:doors/view/screens/subcategory_screen.dart';
import 'package:doors/view/test.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> routes = [
  GetPage(name: '/', page: () => const HomeScreen()),
  //GetPage(name: '/', page: () => const ProductDetails()),
  GetPage(name: AppRoute.test, page: () => const Test()),
  GetPage(name: AppRoute.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.menu, page: () => const MenuScreen()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(name: AppRoute.contactus, page: () => const ContactUs()),
  GetPage(name: AppRoute.subcategory, page: () => const SubCategoryScreen()),
  GetPage(name: AppRoute.product, page: () => const ProductScreen()),
  GetPage(name: AppRoute.productDetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.register, page: () => const RegisterScreen()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyfavoriteScreen()),
  GetPage(name: AppRoute.cart, page: () => const CartScreen()),
  GetPage(name: AppRoute.login, page: () => const LogingScreen()),
  GetPage(name: AppRoute.orderDetails, page: () => const OrderDetailsScreen()),
  GetPage(name: AppRoute.pendingOrders, page: () => const PendingOrderScreen()),
];
// Map<String, Widget Function(BuildContext)> routess = {
//   AppRoute.test: (context) => const Test(),
//   AppRoute.home: (context) => const HomePage(),
//   AppRoute.menu: (context) => const Menu(),
//   AppRoute.onboarding: (context) => const OnBoarding(),
//   AppRoute.contactus: (context) => const ContactUs(),
// };
