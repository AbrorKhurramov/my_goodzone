import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSearchButton extends StatelessWidget {
  final Function()? onTap;
  final String text;

  const CustomSearchButton({Key? key, this.onTap, this.text = 'Поиск'})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: onTap,
      child: Ink(
        height: 42,
        decoration: BoxDecoration(
          color: Color(0xFFF8F6FA),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        child: Row(
          children: [
            SvgPicture.asset(
              'assets/svg/ic_search.svg',
              height: 24,
              width: 24,
              color: Color(0xFF818C99),
            ),
            SizedBox(width: 8),
            Text(
              text,
              style: TextStyle(
                color: Color(0xFF818C99),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
