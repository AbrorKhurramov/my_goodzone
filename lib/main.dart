import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/app_database.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/routes/app_pages.dart';
import 'package:my_goodzone/routes/app_routes.dart';
//import 'package:my_goodzone/service/notifications_service.dart';
import 'package:my_goodzone/translations/app_translations.dart';
import 'bindings/main_bindings.dart';
import 'core/theme/app_theme.dart';

void main() async {
  await GetStorage.init();
  await AppDatabase.init();
  final currentLocale = LocalSource.getInstance().getLocale();
  WidgetsFlutterBinding.ensureInitialized();
//  await NotificationsService.initialize();
  // FlutterBackgroundService.initialize(onStart);
  runApp(MyApp(currentLocale: currentLocale));
}

void onStart() {
  WidgetsFlutterBinding.ensureInitialized();
  final service = FlutterBackgroundService();
  service.onDataReceived.listen((event) {
    if (event!["action"] == "setAsForeground") {
      service.setForegroundMode(true);
      return;
    }
    if (event["action"] == "setAsBackground") {
      service.setForegroundMode(false);
    }
    if (event["action"] == "stopService") {
      service.stopBackgroundService();
    }
  });

  // bring to foreground
  service.setForegroundMode(true);
  Timer.periodic(const Duration(seconds: 1), (timer) async {
    if (!(await service.isServiceRunning())) timer.cancel();
    service.setNotificationInfo(
      title: "My App Service",
      content: "Updated at ${DateTime.now()}",
    );
    service.sendData(
      {"current_date": DateTime.now().toIso8601String()},
    );
  });
}

class MyApp extends StatelessWidget {
  final String currentLocale;

  const MyApp({Key? key, required this.currentLocale}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      gestures: const [GestureType.onTap],
      child: GetMaterialApp(
        navigatorKey: ApiClient.alice.getNavigatorKey(),
        theme: appThemeData,
        debugShowCheckedModeBanner: false,
        initialBinding: MainBindings(),
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        locale: Locale(currentLocale),
        translationsKeys: AppTranslations.translations,
        defaultTransition: Transition.rightToLeft,
        transitionDuration: const Duration(milliseconds: 100),
        onInit: () {},
      ),
    );
  }
}

class GlobalAppKey {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
}
