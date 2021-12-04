import 'package:my_goodzone/base/base_controller.dart';

class MyOrdersController extends BaseController {

  int count = 1;



  void increase(){
    count++;
    update();
  }
  void decrease(){
    count--;
    update();
  }



}
