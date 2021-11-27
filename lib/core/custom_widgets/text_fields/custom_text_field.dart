// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:maxway_client_mobile/core/theme/app_colors.dart';
//
// class CustomTextField extends StatelessWidget {
//   final String labelText;
//   final bool showError;
//
//   final TextEditingController controller;
//   final bool autoFocus;
//   final Function(String value) onChanged;
//   final TextInputType keyboardType;
//   final String prefixText;
//   final String errorText;
//   final TextInputAction inputAction;
//   final FocusNode currentFocus;
//   final FocusNode nextFocus;
//   final String hintText;
//   final BuildContext context;
//   final Function onTap;
//
//   CustomTextField({
//     Key key,
//     this.labelText,
//     this.showError,
//     this.controller,
//     this.autoFocus,
//     this.onChanged,
//     this.keyboardType,
//     this.prefixText,
//     this.errorText,
//     this.inputAction,
//     this.currentFocus,
//     this.nextFocus,
//     this.hintText,
//     this.context,
//     this.onTap,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         SizedBox(height: 12),
//         RichText(
//           text: TextSpan(
//             text: labelText,
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 14,
//               color: clrBlack2,
//             ),
//           ),
//         ),
//         SizedBox(height: 4),
//         TextFormField(
//           style: TextStyle(
//             fontSize: 14,
//             fontWeight: FontWeight.w400,
//             color: clrMainColor2,
//           ),
//           controller: controller,
//           focusNode: currentFocus,
//           onTap: onTap,
//           autofocus: autoFocus ?? false,
//           textCapitalization: TextCapitalization.sentences,
//           onChanged: onChanged,
//           onFieldSubmitted: (term) {},
//           textInputAction: inputAction,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 12),
//             filled: true,
//             hintText: hintText,
//             fillColor: clrWhite,
//             hintStyle: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w400,
//               color: clrBlack2,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: clrAssets, width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: Color(0xFFFFFFFF), width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: clrRed, width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: clrRed, width: 1),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             errorText: showError ?? false ? errorText : null,
//           ),
//           cursorColor: clrAssets,
//           keyboardType: keyboardType,
//         ),
//         SizedBox(height: 12),
//       ],
//     );
//   }
// }
