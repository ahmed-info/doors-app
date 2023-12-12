import 'package:doors/controller/homescreen_controller.dart';
import 'package:doors/core/constant/consts.dart';
import 'package:doors/view/widgets/home/custom_buttom_navigationbar.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, this.myappbar});
  final Widget? myappbar;
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return GetBuilder<HomeScreenControllerImp>(
      builder: (controller) => SafeArea(
        child: Scaffold(
          backgroundColor: AppColor.indigo,
          bottomNavigationBar: BottomAppBar(
            height: 80,
            color: AppColor.indigo,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: listBottomNavigationBar(controller),
                )
              ],
            ),
          ),
          // body: controller.listPage.elementAt(controller.currentPage),
          body: controller.listPage.elementAt(controller.currentPage),
        ),
      ),
    );
  }

  List<Widget> listBottomNavigationBar(HomeScreenControllerImp controller) {
    List<Widget> widgetlist = [
      CustomButtonNavigationbar(
          onPressed: () => controller.changePage(0),
          textButton: "الرئيسية",
          icon: Icons.home,
          active: controller.currentPage == 0 ? true : false),
      CustomButtonNavigationbar(
          onPressed: () => controller.changePage(1),
          textButton: "الطلبات",
          icon: Icons.pending_actions,
          active: controller.currentPage == 1 ? true : false),
      CustomButtonNavigationbar(
          onPressed: () => controller.changePage(2),
          textButton: "السلة",
          icon: Icons.shopping_basket,
          active: controller.currentPage == 2 ? true : false),
      CustomButtonNavigationbar(
          onPressed: () => controller.changePage(3),
          textButton: "القائمة",
          icon: Icons.menu,
          active: controller.currentPage == 3 ? true : false),
    ];
    //List<Widget> reversedlist = List.from(widgetlist.reversed);
    return widgetlist;
  }
}
