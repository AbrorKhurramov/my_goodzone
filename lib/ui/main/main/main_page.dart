import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/main_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/ui/main/home/home_page.dart';
import 'package:my_goodzone/ui/main/orders/orders_page.dart';
import 'package:my_goodzone/ui/main/profile/profile_page.dart';

class MainPage extends GetView<MainController> {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) => Scaffold(
        body: IndexedStack(
          index: controller.bottomMenu.index,
          children: [
            HomePage(),
            MyOrdersPage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.unselectedBottomNavItem,
          selectedItemColor: AppColors.assets,
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 8,
          items: [
            BottomNavigationBarItem(
              label: 'Asosiy',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Katalog',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Savat',
              icon: Icon(FontAwesomeIcons.shoppingCart),
            ),
            BottomNavigationBarItem(
              label: 'Sevimlilar',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Profil',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }

  _bottomNavigationBarItem(
      {required String activeIcon,
      required String icon,
      required String label}) {
    return BottomNavigationBarItem(
      icon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$icon.svg'),
      ),
      activeIcon: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: SvgPicture.asset('assets/svg/$activeIcon.svg'),
      ),
      label: label,
    );
  }
}
