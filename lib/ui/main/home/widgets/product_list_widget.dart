import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/home/widgets/item_loading.dart';

class ProductListWidget extends StatefulWidget {
  final int type;

  const ProductListWidget({Key? key, required this.type}) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  //FavouriteController favouriteController = Get.find<FavouriteController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        height: 250,
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredList.isEmpty ? 4 : controller.getFeatureProducts(widget.type).length,
            itemBuilder: (context, index) {
              return
                controller.featuredList.isEmpty?
                const ItemLoadingCard()
                    :
                Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  color: Colors.white,
                  boxShadow:  [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      offset: const Offset(0.0, 0.5), //(x,y)
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                margin: const EdgeInsets.all(6),
                child: GestureDetector(
                  onTap: () {
                    var product = controller.getFeatureProducts(widget.type)[index];
                    Get.toNamed(
                      Routes.PRODUCT_DETAIL,
                      arguments: [product.slug, product.id, product.image, product.name, product.category!.name, product.price!.oldPrice],
                    );
                  },
                  child: Column(
                    // mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, right: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            StreamBuilder(
                                stream: LocalSource.getInstance().getAllFavouriteProducts(),
                                builder: (context, AsyncSnapshot<List<FavouriteProduct>>? snapshot) {
                                  var checkFav = false;
                                  (snapshot?.data)?.forEach((element) {
                                    if (controller.getFeatureProducts(widget.type)[index].id.toString() == element.id) {
                                      checkFav = true;
                                    }
                                  });
                                  return GestureDetector(
                                    onTap: () {
                                      if (!checkFav) {
                                        FavouriteProduct pro = FavouriteProduct(
                                            id: controller.getFeatureProducts(widget.type)[index].id.toString(),
                                            image: controller.getFeatureProducts(widget.type)[index].image.toString(),
                                            name: controller.getFeatureProducts(widget.type)[index].name.toString(),
                                            category: controller.getFeatureProducts(widget.type)[index].category!.name.toString(),
                                            slug: controller.getFeatureProducts(widget.type)[index].slug.toString(),
                                            price: controller.getFeatureProducts(widget.type)[index].price!.price.toString());
                                        LocalSource.getInstance().insertProduct(pro);
                                        setState(() {
                                          checkFav = true;
                                          controller.update();
                                        });
                                      } else {
                                        LocalSource.getInstance().removeProduct(controller.getFeatureProducts(widget.type)[index].id.toString());
                                        setState(() {
                                          checkFav = false;
                                          controller.update();
                                        });
                                      }
                                    },
                                    child: Container(
                                      height: 27,
                                      width: 27,
                                      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.grey.withOpacity(0.2)),
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
                        height: 130,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: controller.getFeatureProducts(widget.type)[index].image!,
                            width: double.infinity,
                            height: double.infinity,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, right: 8),
                        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                          Text(
                            controller.getFeatureProducts(widget.type)[index].category!.name.toString(),
                            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 3),
                          Text(
                            controller.getFeatureProducts(widget.type)[index].name!,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 10),
                          Text(
                              widget.type == 1
                                                  ? "${controller.prices[index].oldPrice!} Сум"
                                                  : widget.type == 2
                                                      ? "${controller.recPrice[index].oldPrice!} Сум"
                                                      : "${controller.featPrice[index].oldPrice!} Сум",
                            style: const TextStyle(fontSize: 15, color: Colors.red, fontWeight: FontWeight.bold),
                          )
                        ]),
                      )
                    ],
                  ),
                ),
              );

            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 6,
              );
            },
          ),
        ),
      ),
    );
  }

  Icon favorite(bool value) {
    if (value == false) {
      return const Icon(
        Icons.favorite,
        color: Colors.grey,
      );
    } else {
      return const Icon(
        Icons.favorite,
        color: Colors.red,
      );
    }
  }
}
