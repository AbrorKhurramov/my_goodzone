import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) =>
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CarouselSlider(
                items: [
                  for(int i=0;i<controller.banners.length;i++)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          controller.banners[i].image!,
                          //controller.banner[i].image!,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                ],

                options: CarouselOptions(
                  height: 200,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration:
                  const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
      //     Visibility(
      //   visible: controller.banners.isNotEmpty,
      //   child: Container(
      //     height: width * 88 / 112,
      //     margin: EdgeInsets.only(left: 12, top: 12),
      //     child: ListView.builder(
      //         physics: BouncingScrollPhysics(),
      //         itemCount: controller.banners.length,
      //         scrollDirection: Axis.horizontal,
      //         itemBuilder: (context, index) {
      //           var banner = controller.banners[index];
      //           return BannerItem(
      //             banner: banner,
      //             onTap:
      //                 () {} /*=>
      //                   Get.toNamed(Routes.BANNER_DETAIL, arguments: banner)*/
      //             ,
      //           );
      //         }),
      //   ),
      // ),
    );
  }
}
