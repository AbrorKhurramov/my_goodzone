import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/core/theme/app_text_style.dart';

class SampleAppBar extends StatelessWidget with PreferredSizeWidget {
  final Widget? titleWidget;
  final String? title;
  final Widget? action;
  final Widget? leading;
  final double? elevation;

  const SampleAppBar(
      {Key? key,
      this.titleWidget,
      this.title,
      this.action,
      this.leading,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: titleWidget ??
          Text(
            title!,
            style: AppTextStyles.appBarTitle,
          ),
      centerTitle: true,
      leading: leading ??
          IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: Get.back,
          ),
      elevation: elevation ?? 0,
      actions: [action ?? SizedBox.shrink()],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
