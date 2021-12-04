import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/main_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/ui/main/catalog/catalog_page.dart';
import 'package:my_goodzone/ui/main/favourite/favourites_page.dart';
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
          children: const [
            HomePage(),
            CatalogPage(),
            MyOrdersPage(),
            FavouritePage(),
            ProfilePage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.black,
          selectedItemColor: AppColors.red,
          onTap: (pos) => controller.setMenu(BottomMenu.values[pos]),
          currentIndex: controller.bottomMenu.index,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.customColor,
          selectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
          ),
          elevation: 8,
          items: const [
            BottomNavigationBarItem(
              label: 'Главный',
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: 'Каталог',
              icon: Icon(Icons.search),
            ),
            BottomNavigationBarItem(
              label: 'Корзина',
              icon: Icon(FontAwesomeIcons.shoppingCart),
            ),
            BottomNavigationBarItem(
              label: 'Избранное',
              icon: Icon(Icons.favorite),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Icon(Icons.person),
            ),
          ],
        ),
      ),
    );
  }


}
