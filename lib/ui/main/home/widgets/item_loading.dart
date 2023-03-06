import 'package:flutter/material.dart';
import 'package:my_goodzone/core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class ItemLoadingCard extends StatelessWidget {
  const ItemLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(6),
      width: 170,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
        boxShadow:const [
          BoxShadow(
            color: Colors.grey,
            offset: Offset(0.0, 0.5), //(x,y)
            blurRadius: 3.0,
          ),
        ],
      ),
      child: Shimmer.fromColors(
        highlightColor: Constants.kBackgroundColor,
        baseColor: Colors.grey[300]??Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 5,
              child: Center(
                child: Container(
                  color: Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}