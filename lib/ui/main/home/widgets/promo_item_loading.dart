import 'package:flutter/material.dart';
import 'package:my_goodzone/core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class PromoItemLoadingCard extends StatelessWidget {
  const PromoItemLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140, width: 230,
      padding: const EdgeInsets.only(right: 8, left: 8, top: 5, bottom: 5),
      child: Shimmer.fromColors(
        highlightColor: Constants.kBackgroundColor,
        baseColor: Colors.grey[300] ?? Colors.white,
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
