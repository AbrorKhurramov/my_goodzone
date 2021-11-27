import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:my_goodzone/controller/main/main_controller.dart';
import 'package:my_goodzone/controller/splash/splash_controller.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';

class MainBindings extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
    Get.lazyPut(() => MainController(), fenix: true);
    Get.lazyPut<HomeController>(
      () => HomeController(
        repository: HomeRepository(apiClient: ApiClient.getInstance()),
      ),
      fenix: true,
    );
  }
}
