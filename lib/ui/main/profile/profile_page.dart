import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/profile/profile_controller.dart';
import 'package:my_goodzone/core/custom_widgets/appbars/sample_app_bar.dart';
import 'package:my_goodzone/core/plugins/device_info_plugin.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SampleAppBar(
        title: 'Profile',
        leading: SizedBox.shrink(),
        action: IconButton(
          icon: Icon(Icons.call),
          onPressed: () async {
            final res = await DeviceInfoPlugin.getDeviceInfo();
            print(res.toString() + ' =======');
          },
        ),
      ),
      body: Container(),
    );
  }
}
