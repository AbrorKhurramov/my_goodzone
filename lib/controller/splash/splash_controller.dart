import 'package:my_goodzone/base/base_controller.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/routes/app_routes.dart';

class SplashController extends BaseController {
  @override
  void onInit() {
    Future.delayed(Duration(milliseconds: 3000), () {
      Get.offNamed(Routes.MAIN);
    });
    super.onInit();
  }
}
