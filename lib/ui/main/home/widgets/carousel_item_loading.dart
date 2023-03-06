import 'package:flutter/material.dart';
import 'package:my_goodzone/core/constants/constants.dart';
import 'package:shimmer/shimmer.dart';

class CarouselItemLoadingCard extends StatelessWidget {
  const CarouselItemLoadingCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
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
      ),
    );
  }
}