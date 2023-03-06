import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/favourite/favourite_controller.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/routes/app_routes.dart';

class FavouritePage extends GetView<FavouriteController> {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.find();
    return GetBuilder<FavouriteController>(
        builder: (controller) => Scaffold(
            appBar: buildAppBar(),
            backgroundColor: Colors.grey.withOpacity(0.03),
            body: StreamBuilder(
                stream: LocalSource.getInstance().getAllFavouriteProducts(),
                builder: (context, AsyncSnapshot<List<FavouriteProduct>>? snapshot) {
                  return (snapshot!.data?.isEmpty??true)
                      ? Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset("assets/flutterassets/scene_12.png"),
                                const SizedBox(height: 50),
                                const Padding(
                                  padding: EdgeInsets.only(right: 28.0),
                                  child: Text("У вас еще нет избранное",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Padding(
                        padding: const EdgeInsets.only(top: 10,left: 8,right: 8),
                        child: GridView.builder(
                            itemCount: snapshot.data!.length,
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.7),
                            itemBuilder: (BuildContext context, int index) {
                              return buildFavouriteItem(snapshot, index, homeController, controller);
                            }),
                      );

                })));
  }

  Container buildFavouriteItem(AsyncSnapshot<List<FavouriteProduct>> snapshot, int index, HomeController homeController, FavouriteController controller) {
    return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow:  [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: const Offset(0.0, 0.5), //(x,y)
                                    blurRadius: 3.0,
                                  ),
                                ],
                              ),
                              margin: const EdgeInsets.all(8),
                              child: GestureDetector(
                                onTap: () {
                                  var product = snapshot.data![index];
                                  Get.toNamed(Routes.PRODUCT_DETAIL, arguments: [product.slug, product.id,product.image,product.name,product.category,product.price]);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    // mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Container(
                                            height: 27,
                                            width: 27,
                                            decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
                                            child: IconButton(
                                                padding: EdgeInsets.zero,
                                                icon: const Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  LocalSource.getInstance().removeProduct(snapshot.data![index].id.toString());
                                                  homeController.update();
                                                  controller.update();
                                                }),
                                          ),
                                        ],
                                      ),
                                      Flexible(
                                        flex: 5,
                                        child: Center(
                                          child: CachedNetworkImage(
                                            imageUrl: snapshot.data![index].image,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        flex: 3,
                                        child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                                        Text(
                                                                    snapshot.data![index].category,
                                                                    style: const TextStyle(
                                                                      fontSize: 12,
                                                                      fontWeight: FontWeight.w400,
                                                                      color: Colors.grey
                                                                    ),
                                                                    maxLines: 1,
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                          const SizedBox(height: 5),
                                          Text(
                                                                        snapshot.data![index].name,
                                                                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                                                                        maxLines: 2,
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                          const SizedBox(height: 10),
                                        Text(
                                                                    "${snapshot.data![index].price} Сум",
                                                                    style: const TextStyle(fontSize: 16, color: Colors.red, fontWeight: FontWeight.bold),
                                                                  )
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0.5,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: const Text(
        "Избраннoе",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
      ),
    );
  }
}
