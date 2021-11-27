
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';

class BrandsWidget extends StatelessWidget {
  const BrandsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder:(controller) => SizedBox(
        height: 80,
        width: 120,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.brands.length,
          itemBuilder: (context, index) {
            return ClipRRect(
              child: SizedBox(
                  height: 80,
                  width: 120,
                  child: Image.network(controller.brands[index].image.toString())),
              borderRadius: BorderRadius.circular(16),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(width: 10);
          },
        ),
      ),
    );
  }
}
