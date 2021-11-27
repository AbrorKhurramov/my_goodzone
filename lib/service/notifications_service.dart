import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/routes/app_routes.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) await Firebase.initializeApp();
  print("_firebaseMessagingBackgroundHandler: ${message.data.toString()}");
  flutterLocalNotificationsPlugin.show(
      message.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          androidChannel.id,
          androidChannel.name,
          channelDescription:androidChannel.description,
          importance: Importance.max,
          playSound: true,
          icon: '@mipmap/ic_launcher',
        ),
        iOS: IOSNotificationDetails(
          presentSound: true,
          presentAlert: true,
          presentBadge: true,
          subtitle: message.notification!.title,
          sound: 'default',
        ),
      ),
      payload: message.data['screen']);
}

final AndroidNotificationChannel androidChannel = AndroidNotificationChannel(
  'sample channel', // id
  'Application received', // title
  description:'This channel is used for showing notifications about applications',
  // description
  importance: Importance.max,
);

class NotificationsService {
  NotificationsService._();

  static NotificationsService _instance = NotificationsService._();

  static NotificationsService get getInstance => _instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    var token = await FirebaseMessaging.instance.getToken();
    print("FCM_TOKEN: $token");
    if (Platform.isIOS)
      await FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    AndroidInitializationSettings androidNotificationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidNotificationSettings,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (payload) {
      Get.toNamed(Routes.MAIN);
     // return Future.value();
    });

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen((remoteMessage) {
      if (Platform.isAndroid) {
        print("message notification: ${remoteMessage.notification.toString()}");
        print("message data: ${remoteMessage.data.toString()}");
        flutterLocalNotificationsPlugin.show(
            remoteMessage.hashCode,
            remoteMessage.notification?.title ?? '',
            remoteMessage.notification?.body ?? '',
            NotificationDetails(
              android: AndroidNotificationDetails(
                androidChannel.id,
                androidChannel.name,
                channelDescription:
                androidChannel.description,
                playSound: true,
                fullScreenIntent: true,
                showWhen: true,
                importance: Importance.high,
                icon: '@mipmap/ic_launcher',
                priority: Priority.high,
              ),
              iOS: IOSNotificationDetails(
                presentSound: true,
                presentAlert: true,
                presentBadge: true,
                subtitle: remoteMessage.notification!.title,
                sound: 'default',
              ),
            ));
      }
    });
    await Future.delayed(Duration(seconds: 3));
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      final page = event.data['page'];
      if (page == 'notification_page') {
        Get.toNamed(Routes.NOTIFICATION);
      } else if (page == 'product_detail_page') {
        Get.toNamed(Routes.PRODUCT_DETAIL);
      }
      print(event.data.toString() + " ============>");
    });
  }
}
