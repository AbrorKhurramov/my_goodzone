import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      builder: (controller) => Scaffold(
        body: Center(
          child:
              Image.asset('assets/images/logo.png',width: 300,height: 70,fit: BoxFit.fill),
        ),
      ),
    );
  }
}
