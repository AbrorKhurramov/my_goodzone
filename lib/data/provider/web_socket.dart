import 'package:my_goodzone/core/constants/constants.dart';
import 'package:web_socket_channel/io.dart';

class WebSocketSource {
  WebSocketSource._();

  static IOWebSocketChannel? _webSocketChannel;
  static WebSocketSource? instance;

  static WebSocketSource getInstance(
      {required String token, bool isConnect = false}) {
    if (isConnect) {
      instance = null;
      _webSocketChannel = null;
    }
    if (instance == null && _webSocketChannel == null) {
      instance = WebSocketSource._();
      instance!._init(token: token);
    }
    return instance!;
  }

  _init({required String token}) {
    if (token.isNotEmpty) {
      _webSocketChannel = IOWebSocketChannel.connect(
        '${Constants.webSocketUrl}?Authorization=$token',
      );
    }
    print('${Constants.webSocketUrl}?Authorization=$token');
  }

  IOWebSocketChannel get channel => _webSocketChannel!;
}
