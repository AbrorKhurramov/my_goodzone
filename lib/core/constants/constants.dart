import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Constants {
  // static const baseUrl = 'https://test.customer.api.delever.uz/v1/'; //test
  static const shipperId = !kDebugMode
      ? 'd4b1658f-3271-4973-8591-98a82939a664'
      : 'e2d30f35-3d1e-4363-8113-9c81fdb2a762';
  static const baseUrl = 'https://dev.goodzone.uz/v1/';
  static const androidPlatformID = "6bd7c2e3-d35e-47df-93ce-ed54ed53f95f";
  static const iosPlatformID = "f6631db7-09d0-4cd9-a03a-b7a590abb8c1";

  static const apiKey = '1d47efd1-f633-41db-a353-234f595d9c1a';
  static const yandexKey = 'https://geocode-maps.yandex.ru/1.x/';

  static const FINISHED_ORDERS = 'e665273d-5415-4243-a329-aee410e39465';
  static const webSocketUrl = 'wss://ws.car24.uz/ws';

  static const kPrimaryColor = Color(0xFFFF7643);
  static const kBackgroundColor = Color(0xFFFFFFFF);
  static const kSecondaryColor = Color(0xFF979797);
  static const kTextColor = Color(0xFF272727);
  static const kMenuColor = Color(0xFFFF7643);
  static const kShadowColor = Color(0xFFEDEDED);
  static const kAnimationDuration = Duration(milliseconds: 200);

  static const double kBorderRadius = 28;

}
