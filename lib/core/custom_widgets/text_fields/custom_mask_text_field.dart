// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:maxway_client_mobile/core/theme/app_colors.dart';
// import 'package:maxway_client_mobile/core/utils/mask_text_formatter.dart';
//
// class CustomMaskTextField extends StatelessWidget {
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
//   const CustomMaskTextField({
//     Key key,
//     this.labelText,
//     this.showError = false,
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
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(height: 16),
//         RichText(
//           text: TextSpan(
//             text: labelText,
//             style: TextStyle(
//               fontWeight: FontWeight.w600,
//               fontSize: 13,
//               color: clrAssets,
//             ),
//           ),
//         ),
//         SizedBox(
//           height: 4,
//         ),
//         TextFormField(
//           style: TextStyle(
//             fontSize: 17,
//             fontWeight: FontWeight.w400,
//             color: Colors.black,
//           ),
//           focusNode: currentFocus,
//           autofocus: autoFocus ?? false,
//           textInputAction: inputAction,
//           onFieldSubmitted: (term) {
//             fieldFocusChange(context, currentFocus, nextFocus);
//           },
//           onChanged: onChanged,
//           textAlignVertical: TextAlignVertical.center,
//           controller: controller,
//           inputFormatters: [
//             MaskedTextInputFormatter(mask: '## ### ## ##', separator: ' '),
//           ],
//           keyboardType: keyboardType,
//           decoration: InputDecoration(
//             contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
//             prefix: Text(
//               prefixText,
//               style: TextStyle(
//                 fontSize: 17.0,
//                 color: Colors.black,
//                 fontWeight: FontWeight.w400,
//               ),
//             ),
//             fillColor: Colors.white,
//             filled: true,
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: BorderSide(color: clrAssets, width: 1),
//             ),
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(color: clrWhite, width: 1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: BorderSide(color: clrRed, width: 1),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             /*    border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8.0),
//             borderSide: BorderSide(color: clrAssets, width: 1.8),
//           ),*/
//             errorText: showError ? errorText : null,
//           ),
//           cursorColor: clrAssets,
//         ),
//       ],
//     );
//   }
//
//   fieldFocusChange(
//       BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
//     if (currentFocus != null && nextFocus != null) {
//       // _controller.jumpTo(_controller.position.maxScrollExtent);
//       currentFocus.unfocus();
//       FocusScope.of(context).requestFocus(nextFocus);
//     }
//   }
// }
