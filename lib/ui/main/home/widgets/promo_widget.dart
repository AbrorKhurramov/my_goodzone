
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/ui/main/home/promo_detail/promo_detail_page.dart';

class PromoWidget extends StatelessWidget {
  const PromoWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
     builder:(controller) => SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.promos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
              const EdgeInsets.only(right: 10, left: 10, top: 5, bottom: 5),
              child: GestureDetector(
                onTap: () {

                  Get.to(DiscountPage(controller.promos[index]));
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: SizedBox(
                        width: 230,
                        height: 140,
                        child: Image.network(
                          //homeController.userList.value[index].previewImage.toString(),
                         // "assets/images/Capture.PNG",
                          controller.promos[index].previewImage!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                        height: 45,
                        width: 150,
                        child: Text(
                         // "Name",
                          //homeController.userList.value[index].title.toString(),
                          controller.promos[index].title!,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w500),
                        ))
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
