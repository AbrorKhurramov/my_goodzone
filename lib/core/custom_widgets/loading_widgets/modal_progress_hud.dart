library modal_progress_hud;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';

///
/// Wrap around any widget that makes an async call to show a modal progress
/// indicator while the async call is in progress.
///
/// The progress indicator can be turned on or off using [inAsyncCall]
///
/// The progress indicator defaults to a [CircularProgressIndicator] but can be
/// any kind of widget
///
/// The progress indicator can be positioned using [offset] otherwise it is
/// centered
///
/// The modal barrier can be dismissed using [dismissible]
///
/// The color of the modal barrier can be set using [color]
///
/// The opacity of the modal barrier can be set using [opacity]
///
/// HUD=Heads Up Display
///
class ModalProgressHUD extends StatelessWidget {
  final bool? inAsyncCall;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Offset? offset;
  final bool dismissible;
  final Widget child;

  const ModalProgressHUD({
    Key? key,
    this.inAsyncCall,
    this.opacity = 1,
    this.color = Colors.white,
    this.progressIndicator = const CircularProgressIndicator(color: AppColors.assets),
    this.offset,
    this.dismissible = false,
    required this.child,
  })  : assert(inAsyncCall != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = [];
    widgetList.add(child);
    if (inAsyncCall ?? false) {
      Widget layOutProgressIndicator;
      if (offset == null) {
        layOutProgressIndicator = Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator(color: AppColors.assets)
              : Theme(
                  data: ThemeData(
                    cupertinoOverrideTheme: const CupertinoThemeData(
                      brightness: Brightness.light,
                    ),
                  ),
                  child: const CupertinoActivityIndicator(
                      radius: 20, animating: true),
                ),
        );
      } else {
        layOutProgressIndicator = Center(
          child: Platform.isAndroid
              ? const CircularProgressIndicator(color: AppColors.assets)
              : const CupertinoActivityIndicator(radius: 20, animating: true),
        );
      }
      final modal = [
        Opacity(
          child: ModalBarrier(dismissible: dismissible, color: color),
          opacity: opacity,
        ),
        layOutProgressIndicator
      ];
      widgetList += modal;
    }
    return Stack(
      children: widgetList,
    );
  }
}
