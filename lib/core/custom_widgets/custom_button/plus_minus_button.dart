import 'package:bouncing_widget/bouncing_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';

class PlusMinusButton extends StatelessWidget {
  final Function() onTap;
  final bool isMinus;
  final double size;
  final Color? backgroundColor;
  final Color? iconColor;

  PlusMinusButton({
    Key? key,
    required this.onTap,
    this.isMinus = false,
    this.size = 44,
    this.backgroundColor,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BouncingWidget(
      onPressed: onTap,
      duration: Duration(milliseconds: 100),
      scaleFactor: 1.8,
      child: Container(
        height: size,
        width: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: backgroundColor ?? Color(0xFFF6F8FB),
        ),
        child: Center(
          child: Icon(
            isMinus ? Icons.remove : Icons.add,
            color: iconColor ?? AppColors.lightGrey,
          ),
        ),
      ),
    );
  }
}
