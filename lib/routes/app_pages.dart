import 'package:get/get.dart';
import 'package:my_goodzone/bindings/home/notification_binding.dart';
import 'package:my_goodzone/bindings/home/product_detail_binding.dart';
import 'package:my_goodzone/bindings/main_bindings.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/home/notification/notification_page.dart';
import 'package:my_goodzone/ui/main/home/product_detail/product_detail_page.dart';
import 'package:my_goodzone/ui/main/main/main_page.dart';
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
      name: Routes.NOTIFICATION,
      page: () => const NotificationPage(),
      binding: NotificationBinding(),
    ),

    GetPage(
      name: Routes.PRODUCT_DETAIL,
      page: () =>  ProductDetailPage(),
      binding: ProductDetailBinding(),
    ),

  ];
}
