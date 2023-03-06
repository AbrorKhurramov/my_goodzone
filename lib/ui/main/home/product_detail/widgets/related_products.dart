import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/products.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/home/widgets/item_loading.dart';
import 'package:my_goodzone/ui/main/home/widgets/title_widget.dart';
class RelatedProducts extends StatelessWidget {

  RelatedProducts({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ProductDetailController controller;
  @override
  Widget build(BuildContext context) {
    return    Column(
      children: [
        TitleWidget(title: "Сопутствующие товары", onClick: (){}),
        SizedBox(
          height: 250,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: controller.isLoading?3:controller.relatedProducts.length,
            itemBuilder: (context, index) {

              return
                controller.isLoading?
                const ItemLoadingCard()
                  :
                Container(
                width: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
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
                      SizedBox(
                        height: 130,
                        child: Center(
                          child: CachedNetworkImage(
                            imageUrl: controller.relatedProducts[index].image.toString(),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
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
    );
  }
}
