import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';

class ProductDetailPage extends GetView<ProductDetailController> {


  ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      initState: (state) {
        controller.getProductDetail(Get.arguments[0]);
        controller.getProductImages(Get.arguments[0]);
        controller.getRelatedProducts(Get.arguments[0]);
        controller.getShops(Get.arguments[1]);
      },
      builder: (controller) =>
          Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 1,
                actions: const [
                  Icon(Icons.favorite_border),
                  SizedBox(
                    width: 10,
                  )
                ],
                title: Center(
                    child: Text(
                      controller.productDetail.product?.category?.name ?? '',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ))),
            body: Stack(
              children: [
                NestedScrollView(
                  controller: controller.scrollController,
                  physics: const NeverScrollableScrollPhysics(),
                  headerSliverBuilder: (context,isSlider){
                    return [
                      SliverAppBar(
                        collapsedHeight: 400,
                        expandedHeight: 400,
                        flexibleSpace: DetailBodyWidget(controller: controller),
                      ),
                      SliverPersistentHeader(delegate: MyDelegate(
                        TabBar(
                          onTap: (index) {
                            controller.update();
                          },
                          controller: controller.tabController,
                          unselectedLabelColor: Colors.black38,
                          labelColor: Colors.red,
                          indicator: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(10)
                            ),
                          ),
                          tabs:  const [
                            Tab(
                              child: Text(
                                "О товаре",
                                style: TextStyle(fontSize: 15,),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "В магазинах",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                            Tab(
                              child: Text(
                                "Отзывы",
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ],),

                      ),
                        floating: true,
                        pinned: true,
                      ),

                    ];
                  }, body: TabBarView(
                  controller: controller.tabController,
                  physics: const BouncingScrollPhysics(),
                  children: [
                    ListView(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Html(
                            style: {
                              "body": Style(
                                fontSize:const FontSize(16.0),
                              ),
                            },
                            data: controller.productDetail.product
                                ?.description ?? "",
                          ),
                        ),

                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 10, right: 20, top: 5),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              SizedBox(width: 3),
                              Text("Mагазины",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 16
                              ),),
                              SizedBox(width: 70),
                              Text("Режим работы",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 16
                              ),),
                              SizedBox(width: 70),
                              Text("Наличие",style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 16
                              ),),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: controller.shopDetail.shops?.map((e) => Padding(

                                  padding: const EdgeInsets.only(top: 5,bottom: 5),
                                  child: Text(e.shop!.name.toString().replaceAll("GOODZONE", "")),
                                )).toList()??[],
                              ),
                              const SizedBox(width: 70),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:controller.shopDetail.shops?.map((e) => const Padding(

                                  padding: EdgeInsets.only(top: 5,bottom: 5),
                                  child: Text("с 10-00 до 21-00 (без..."),
                                )).toList()??[],
                              ),
                              const SizedBox(width: 50),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:controller.shopDetail.shops?.map((e) => Padding(
                                  padding: EdgeInsets.only(top: 5,bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: e.quantity!>0?Colors.red: Colors.black26
                                        ),
                                      ),
                                      SizedBox(
                                        width: 4,
                                      ),
                                      Text(e.quantity!>0?"Мало":"Нет"),
                                    ],
                                  ),
                                )).toList()??[],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Text("dataa"),
                  ],
                ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {
                          // basketController.setProduct(productDetailController.product);
                        },
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Добавить в корзину',
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
    );
  }

}

class DetailBodyWidget extends GetView<ProductDetailController> {
 late ProductDetailController controller1;
  DetailBodyWidget({
    Key? key,required ProductDetailController controller
  }) {
    this.controller1 = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                width: 200,
                child: CachedNetworkImage(
                  height: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl:
                  controller1.images.isEmpty ? " " : controller1
                      .images[controller1.imgIndex],
                  errorWidget: (context, url, error) =>
                  const Icon(Icons.error),
                ),
                height: 200,
              ),
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount:
                controller1.images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(top: 15,bottom: 15,left: 15),
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(width: 1,color: index==controller1.imgIndex? Colors.black:Colors.transparent),
                    ),
                    child: Card(
                      margin: EdgeInsets.all(0),
                      borderOnForeground: true,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            controller1.imgIndex = index;
                            controller1.update();
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: CachedNetworkImage(
                              imageUrl: controller1.images.isEmpty
                                  ? " "
                                  : controller1.images[index]
                              ,
                              errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                controller1.productDetail.product?.name ?? "",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                '${controller1.productDetail.product?.price?.price ??
                    ""} Сум',
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(
              height: 50,
            )
          ],
        ),


      ],
    );
  }
}
class MyDelegate extends SliverPersistentHeaderDelegate {
  MyDelegate(this.tabBar);

  final TabBar tabBar;

  @override
  Widget build(BuildContext context, double shrinkOffset,
      bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(left: 15,right: 15,top: 5),
          padding: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 244, 244, 244),
          ),
          child: tabBar),
    );
  }

  @override
  double get maxExtent => 60;

  @override
  double get minExtent => 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}