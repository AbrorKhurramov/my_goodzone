

import 'package:flutter/material.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final Function() onClick;

  const TitleWidget({
    Key? key,
    required this.title,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          InkWell(
            onTap: onClick,
            child: Text(
              'все',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
