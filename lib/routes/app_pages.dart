import 'package:get/get.dart';
import 'package:my_goodzone/bindings/home/notification_binding.dart';
import 'package:my_goodzone/bindings/main_bindings.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/catalog/catalog_page.dart';
import 'package:my_goodzone/ui/main/favourite/favourites_page.dart';
import 'package:my_goodzone/ui/main/home/home_page.dart';
import 'package:my_goodzone/ui/main/home/notification/notification_page.dart';
import 'package:my_goodzone/ui/main/home/product_detail/product_detail_page.dart';
import 'package:my_goodzone/ui/main/main/main_page.dart';
import 'package:my_goodzone/ui/main/orders/orders_page.dart';
import 'package:my_goodzone/ui/main/profile/profile_page.dart';
import 'package:my_goodzone/ui/news/news_page.dart';
import 'package:my_goodzone/ui/splash/splash_page.dart';

class AppPages {
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: () => const SplashPage()
    ),

    GetPage(
        name: Routes.MAIN,
        page: () => const MainPage(),
        binding: MainBindings()
    ),
GetPage(
        name: Routes.HOME,
        page: () => const HomePage(),
        binding: MainBindings()
    ),

    GetPage(
      name: Routes.NOTIFICATION,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () =>  const ProductDetailPage(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300)      // binding: ProductDetailBinding(),
    ),
GetPage(
      name: Routes.FAVOURITE,
      page: () =>   const FavouritePage(),
      binding: MainBindings(),
    ),GetPage(
      name: Routes.BASKET,
      page: () =>   const MyOrdersPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.CATALOG,
      page: () =>   const CatalogPage(),
      binding: MainBindings(),
    ),
    GetPage(
      name: Routes.NEWS,
      page: () =>   NewsPage(),
      binding: MainBindings(),
    ),
GetPage(
      name: Routes.PROFILE,
      page: () =>   const ProfilePage(),
      binding: MainBindings(),
    ),

  ];
}
