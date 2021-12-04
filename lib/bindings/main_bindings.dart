import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/catalog/search_controller.dart';
import 'package:my_goodzone/controller/main/favourite/favourite_controller.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/main_controller.dart';
import 'package:my_goodzone/controller/main/my_orders/my_orders_controller.dart';
import 'package:my_goodzone/controller/main/news/news_controller.dart';
import 'package:my_goodzone/controller/main/profile/profile_controller.dart';
import 'package:my_goodzone/controller/splash/splash_controller.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/repository/catalog/catalog_repository.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';
import 'package:my_goodzone/data/repository/news/news_repository.dart';

class MainBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut<FavouriteController>(() => FavouriteController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
    Get.lazyPut<SearchController>(() => SearchController(catalogRepository: CatalogRepository(apiClient: ApiClient.getInstance())));
    Get.lazyPut<NewsController>(() => NewsController(newsRepository: NewsRepository(apiClient: ApiClient.getInstance())));
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiClient: ApiClient.getInstance()),
      ),

      fenix: true,
    );
  }
}
