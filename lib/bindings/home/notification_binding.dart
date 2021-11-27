import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/notification/notification_controller.dart';

class NotificationBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut(() => NotificationController());
  }
}
