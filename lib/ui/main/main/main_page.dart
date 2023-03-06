import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/main_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';
import 'package:my_goodzone/ui/main/catalog/catalog_page.dart';
import 'package:my_goodzone/ui/main/favourite/favourites_page.dart';
import 'package:my_goodzone/ui/main/home/home_page.dart';
import 'package:my_goodzone/ui/main/orders/orders_page.dart';
import 'package:my_goodzone/ui/main/profile/authentication_page.dart';
import 'package:my_goodzone/ui/main/profile/profile_page.dart';

class MainPage extends GetView<MainController> {
  MainPage({Key? key}) : super(key: key);

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
            AuthenticationPage(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: AppColors.black,
          selectedItemColor: AppColors.red,
          onTap: (pos) {
            controller.setMenu(BottomMenu.values[pos]);
          } ,
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
          items: [
            BottomNavigationBarItem(
              label: 'Главный',
              icon: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SvgPicture.asset("assets/flutterassets/ic_menu_home.svg",color: controller.bottomMenu.index==0?Colors.red:Colors.black,)),
            ),
            BottomNavigationBarItem(
              label: 'Каталог',
              icon: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SvgPicture.asset("assets/flutterassets/ic_menu_search.svg",color: controller.bottomMenu.index==1?Colors.red:Colors.black,)),
            ),
            BottomNavigationBarItem(
              label: 'Корзина',
              icon: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SvgPicture.asset("assets/flutterassets/ic_menu_shopping.svg",color: controller.bottomMenu.index==2?Colors.red:Colors.black,)),
            ),
            BottomNavigationBarItem(
              label: 'Избранное',
              icon: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SvgPicture.asset("assets/flutterassets/ic_menu_favorites.svg",color: controller.bottomMenu.index==3?Colors.red:Colors.black,)),
            ),
            BottomNavigationBarItem(
              label: 'Профиль',
              icon: Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: SvgPicture.asset("assets/flutterassets/ic_menu_profile.svg",color: controller.bottomMenu.index==4?Colors.red:Colors.black,)),
            ),
          ],
        ),
      ),
    );
  }


}
