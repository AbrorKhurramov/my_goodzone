import 'package:my_goodzone/base/base_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/provider/web_socket.dart';

class MainController extends BaseController {

  BottomMenu _bottomMenu = BottomMenu.HOME;

  @override
  void onInit() {
    var token = LocalSource.getInstance().getAccessToken();
    WebSocketSource.getInstance(token: token);
    super.onInit();
  }

  void setMenu(BottomMenu menu) {
    _bottomMenu = menu;
    update();
  }

  BottomMenu get bottomMenu => _bottomMenu;
}

enum BottomMenu { HOME, MY_ORDERS, PROFILE }
