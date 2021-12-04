import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/favourite/favourite_controller.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:my_goodzone/controller/main/my_orders/my_orders_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/data/provider/api_client.dart';
import 'package:my_goodzone/data/repository/home/home_repository.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/home/widgets/title_widget.dart';

class ProductDetailPage extends GetView<ProductDetailController> {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FavouriteController favouriteController = Get.find();
    HomeController homeController = Get.find();
    MyOrdersController myOrdersController = Get.find();

    return GetBuilder<ProductDetailController>(
      init: Get.put(ProductDetailController(repository: HomeRepository(apiClient: ApiClient.getInstance())), tag: Get.arguments[0]),
      tag: Get.arguments[0],
      builder: (controller) {
        return           Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 1,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () => Get.back(),
          ),
          actions: [
            StreamBuilder(
                stream: LocalSource.getInstance().getAllFavouriteProducts(),
                builder: (context, AsyncSnapshot<List<FavouriteProduct>>? snapshot) {
                  var checkFav = false;
                  (snapshot?.data)?.forEach((element) {
                    if (controller.productDetail.product?.id.toString() == element.id) {
                      checkFav = true;
                    }
                  });
                  return IconButton(
                      icon: Icon(checkFav ? Icons.favorite : Icons.favorite_border, color: checkFav ? Colors.red : Colors.black),
                      onPressed: () {
                        if (!checkFav) {
                          FavouriteProduct pro = FavouriteProduct(
                              id: controller.productDetail.product!.id.toString(),
                              image: controller.images[controller.imgIndex].toString(),
                              category: controller.productDetail.product!.category.toString(),
                              slug: controller.productDetail.product!.slug.toString(),
                              name: controller.productDetail.product!.name.toString(),
                              price: controller.productDetail.product!.price!.price.toString());
                          LocalSource.getInstance().insertProduct(pro);
                          checkFav = true;
                        } else {
                          LocalSource.getInstance().removeProduct(controller.productDetail.product!.id.toString());
                          checkFav = false;
                        }

                        controller.update();
                        favouriteController.update();
                        homeController.update();
                      });
                }),
            const SizedBox(
              width: 10,
            )
          ],
          title: Center(
              child: Text(
                Get.arguments[4],
                style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ))),
      body: Stack(
        children: [
          NestedScrollView(
            controller: controller.scrollController,
            physics: const NeverScrollableScrollPhysics(),
            headerSliverBuilder: (context, isSlider) {
              return [
                SliverAppBar(
                  automaticallyImplyLeading: false,

                  collapsedHeight: 420,
                  expandedHeight: 420,
                  flexibleSpace: DetailBodyWidget(controller: controller),
                ),
                SliverPersistentHeader(
                  delegate: MyDelegate(
                    TabBar(
                      onTap: (index) {
                        controller.update();
                      },
                      controller: controller.tabController,
                      unselectedLabelColor: Colors.black38,
                      labelColor: Colors.red,
                      indicator: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      tabs: const [
                        Tab(
                          child: Text(
                            "О товаре",
                            style: TextStyle(
                              fontSize: 15,
                            ),
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
                      ],
                    ),
                  ),
                  floating: true,
                  pinned: true,
                ),
              ];
            },
            body: TabBarView(
              controller: controller.tabController,
              physics: const BouncingScrollPhysics(),
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Html(
                          style: {
                            "body": Style(
                              fontSize: const FontSize(16.0),
                            ),
                          },
                          data: controller.productDetail.product?.description ?? "",
                        ),
                        Column(
                          children: [
                            TitleWidget(title: "Сопутствующие товары", onClick: (){}),
                            SizedBox(
                              height: 290,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.relatedProducts.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    width: 180,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Colors.grey,
                                          offset: Offset(0.0, 0.5), //(x,y)
                                          blurRadius: 3.0,
                                        ),
                                      ],
                                    ),
                                    margin: const EdgeInsets.all(6),
                                    child: GestureDetector(
                                      onTap: () {
                                        var product = controller.relatedProducts[index];
                                        Get.toNamed(Routes.PRODUCT_DETAIL, arguments: [product.id, product.id, product.image, product.name, product.category!.name, product.price!.oldPrice],
                                            preventDuplicates: false);
                                      },
                                      child: Column(
                                        // mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(top: 5,right: 5),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.end,
                                              children: [
                                                StreamBuilder(
                                                    stream: LocalSource.getInstance().getAllFavouriteProducts(),
                                                    builder: (context, AsyncSnapshot<List<FavouriteProduct>>? snapshot) {
                                                      bool checkFav = false;
                                                      (snapshot?.data)?.forEach((element) {
                                                        if (controller.relatedProducts[index].id.toString() == element.id) {
                                                          checkFav = true;
                                                        }
                                                      });
                                                      return GestureDetector(
                                                        onTap: () {
                                                          if (!checkFav) {
                                                            FavouriteProduct pro = FavouriteProduct(
                                                                id: controller.relatedProducts[index].id.toString(),
                                                                image: controller.relatedProducts[index].image.toString(),
                                                                name: controller.relatedProducts[index].name.toString(),
                                                                category: controller.relatedProducts[index].category!.name.toString(),
                                                                slug: controller.relatedProducts[index].slug.toString(),
                                                                price: controller.relatedProducts[index].price!.price.toString());
                                                            LocalSource.getInstance().insertProduct(pro);

                                                            checkFav = true;
                                                            controller.update();
                                                          } else {
                                                            LocalSource.getInstance().removeProduct(controller.relatedProducts[index].id.toString());

                                                            checkFav = false;
                                                            controller.update();
                                                          }
                                                        },
                                                        child: Container(
                                                          height: 27,
                                                          width: 27,
                                                          decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.25)),
                                                          child: Icon(
                                                            Icons.favorite,
                                                            color: checkFav ? Colors.red : Colors.grey,
                                                            size: 20,
                                                          ),
                                                        ),
                                                      );
                                                    }),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            height: 170,
                                            child: Center(
                                              child: CachedNetworkImage(
                                                imageUrl: controller.relatedProducts[index].image.toString(),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            child: Padding(
                                              padding: const EdgeInsets.only(left: 8, right: 8),
                                              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                                Text(
                                                  controller.relatedProducts[index].category!.name.toString(),
                                                  style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
                                                  maxLines: 1,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 3),
                                                Text(
                                                  controller.relatedProducts[index].name.toString(),
                                                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                                                  maxLines: 2,
                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "${controller.relatedProducts[index].price!.price.toString()} Сум",
                                                  style: const TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
                                                )
                                              ]),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                separatorBuilder: (BuildContext context, int index) {
                                  return const SizedBox(
                                    width: 5,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 50),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 20, top: 5),
                  child: Column(
                    children: [
                      Row(
                        children: const [
                          SizedBox(width: 3),
                          Text(
                            "Mагазины",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: 70),
                          Text(
                            "Режим работы",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: 70),
                          Text(
                            "Наличие",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.shopDetail.shops
                                ?.map((e) =>
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Text(e.shop!.name.toString().replaceAll("GOODZONE", "")),
                                ))
                                .toList() ??
                                [],
                          ),
                          const SizedBox(width: 70),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.shopDetail.shops
                                ?.map((e) =>
                            const Padding(
                              padding: EdgeInsets.only(top: 5, bottom: 5),
                              child: Text("с 10-00 до 21-00 (без..."),
                            ))
                                .toList() ??
                                [],
                          ),
                          const SizedBox(width: 50),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: controller.shopDetail.shops
                                ?.map((e) =>
                                Padding(
                                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(shape: BoxShape.circle, color: e.quantity! > 0 ? Colors.red : Colors.black26),
                                      ),
                                      const SizedBox(
                                        width: 4,
                                      ),
                                      Text(e.quantity! > 0 ? "Мало" : "Нет"),
                                    ],
                                  ),
                                ))
                                .toList() ??
                                [],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Positioned(
                      bottom: 60,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            // basketController.setProduct(productDetailController.product);
                          },
                          child: Container(
                            child: Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.blue,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Оставить отзыв',
                                    style: TextStyle(color: Colors.blue, fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            height: 50,
                            width: 400,
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: StreamBuilder(
                    stream: LocalSource.getInstance().getAllBasketProducts(),
                    builder: (context, AsyncSnapshot<List<BasketProduct>>? snapshot) {
                      bool checkBas = false;

                      (snapshot?.data)?.forEach((element) {
                        if (controller.productDetail.product?.id.toString() == element.id) {
                          checkBas = true;
                        }
                      });

                      return GestureDetector(
                        onTap: () {
                          if (!checkBas) {
                            BasketProduct pro = BasketProduct(id: controller.productDetail.product!.id.toString(),
                                image: controller.images[controller.imgIndex].toString(),
                                name:controller.productDetail.product!.name.toString(),
                                price: controller.productDetail.product!.price!.price.toString(),
                                quantity: 1);
                            LocalSource.getInstance().insertBasketProduct(pro);
                            checkBas = true;
                          }
                          else {
                            Get.toNamed(Routes.BASKET,
                                arguments: [controller.productDetail.product!.slug, controller.productDetail.product!.id,controller.productDetail.product!.image,controller.productDetail.product!.name,controller.productDetail.product!.category!.name,controller.productDetail.product!.price!.oldPrice]
                            );
                          }

                          controller.update();
                          myOrdersController.update();
                          homeController.update();

                        },
                        child: Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:  [
                                const Icon(
                                  Icons.shopping_bag,
                                  color: Colors.white,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(checkBas? 'Перейти в корзину':"Добавить в корзину",
                                  style: const TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          height: 50,
                          width: 300,
                          decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        ),
                      );
                    }
                ),
              )
            ],
          )
        ],
      ),
    );
      }

    );
  }
}

class DetailBodyWidget extends GetView<ProductDetailController> {
  late ProductDetailController controller1;

  DetailBodyWidget({Key? key, required ProductDetailController controller}) : super(key: key) {
    controller1 = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: SizedBox(
                width: 200,
                child: CachedNetworkImage(
                  height: double.infinity,
                  fit: BoxFit.fill,
                  imageUrl:
                  controller1.images.isEmpty ? " " : controller1.images[controller1.imgIndex],
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
                height: 200,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 100,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: controller1.images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(top: 15, bottom: 15, left: 15),
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(width: 1, color: index == controller1.imgIndex ? Colors.black : Colors.transparent),
                          ),
                          child: Card(
                            margin: const EdgeInsets.all(0),
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
                                    imageUrl: controller1.images.isEmpty ? " " : controller1.images[index],
                                    errorWidget: (context, url, error) => const Icon(Icons.error),
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
                      Get.arguments[3],
                      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              '${Get.arguments[5]} Сум',
                              style: const TextStyle(color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 5,left: 10),
                            child: Text(
                              'Есть в наличии',
                              style: TextStyle(color: Colors.green, fontSize: 16,fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          RatingBar(
                            ignoreGestures: true,
                            initialRating: 0,
                            minRating: 0,
                            itemSize: 18,
                            direction: Axis.horizontal,
                            allowHalfRating: false,
                            itemCount: 5,
                            unratedColor: Colors.amber,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),

                            ratingWidget: RatingWidget(
                            full: const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            empty: const Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                            ),
                            half: const Icon(
                              Icons.star_border_outlined,
                              color: Colors.amber,
                            ),
                          ), onRatingUpdate: (double value) {

                          },
                          ),
                          const Text("Нет отзывы",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                          const SizedBox(width: 5),

                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
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
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      child: Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
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
