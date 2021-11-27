import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_goodzone/core/theme/app_colors.dart';

class CustomMapTextField extends StatelessWidget {
  final String? labelText;
  final bool? showError;

  final TextEditingController? controller;
  final bool? autoFocus;
  final Function(String value)? onChanged;
  final TextInputType? keyboardType;
  final String? prefixText;
  final String? errorText;
  final Color? backgroundColor;
  final TextInputAction? inputAction;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final String? hintText;
  final BuildContext? context;
  final Function onTap;
  final Widget? prefixIcon;

  CustomMapTextField({
    Key? key,
    this.labelText,
    this.showError,
    this.controller,
    this.autoFocus,
    this.onChanged,
    this.keyboardType,
    this.prefixText,
    this.errorText,
    this.inputAction,
    this.currentFocus,
    this.nextFocus,
    this.hintText,
    this.context,
    required this.onTap,
    this.prefixIcon,
    this.backgroundColor = const Color(0xFFF5F5F5),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      controller: controller,
      focusNode: currentFocus,
      onTap: () => onTap(),
      autofocus: autoFocus ?? false,
      textCapitalization: TextCapitalization.sentences,
      onChanged: onChanged,
      onFieldSubmitted: (term) {},
      textInputAction: inputAction,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        filled: true,
        hintText: hintText,
        fillColor: backgroundColor,
        hintStyle: TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        prefixIcon: prefixIcon,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.assets, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.assets, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        errorText: showError ?? false ? errorText : null,
      ),
      cursorColor: AppColors.assets,
      keyboardType: keyboardType,
    );
  }
}
