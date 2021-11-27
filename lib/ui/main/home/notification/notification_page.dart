import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/notification/notification_controller.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';

class NotificationPage extends GetView<NotificationController> {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            '123456789 test',
            style: TextStyle(fontSize: 22, color: AppColors.black),
          ),
        ),
      ),
    );
  }
}
