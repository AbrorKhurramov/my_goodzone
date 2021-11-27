import 'package:flutter/services.dart';

class DeviceInfoPlugin {
  DeviceInfoPlugin._();

  static const platform = const MethodChannel('uz.udevs.flutter/device_info');

  static Future<String?> getDeviceInfo() async {
    try {
      final res = await platform.invokeMethod('getDeviceInfo');
      return res.toString();
    } on PlatformException catch (e) {
      print("_getDeviceInfo==>${e.message}");
      return null;
    }
  }
}
