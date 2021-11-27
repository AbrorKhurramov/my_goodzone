import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/routes/app_routes.dart';
import 'package:my_goodzone/ui/main/home/product_detail/product_detail_page.dart';

class ProductListWidget extends StatefulWidget {
  final int type;

  const ProductListWidget({Key? key,required this.type}) : super(key: key);

  @override
  State<ProductListWidget> createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) => SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.featuredList.isEmpty?0:  widget.type == 1
                ? controller.featuredList[0].products.length
                : widget.type == 2
                    ? controller.featuredList[1].products.length
                    : controller.featuredList[2].products.length,
            itemBuilder: (context, index) =>
                // homeController.loading.value
                //     ? Center(
                //   child: CircularProgressIndicator(),
                // )
                //     :
                Card(
              child: InkWell(
                onTap: () {
                  var product = widget.type == 1
                      ? controller.featuredList[0].products[index]
                      : widget.type == 2
                      ? controller.featuredList[1].products[index]
                      : controller.featuredList[2].products[index];

                  Get.toNamed(Routes.PRODUCT_DETAIL,arguments: [product.slug,product.id]);
                  //Get.to(ProductPage(controller.popular[index]));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: SizedBox(
                                width: 150,
                                height: 120,
                                child: Image.network(
                                  widget.type == 1
                                      ? controller
                                      .featuredList[0].products[index].image!
                                      : widget.type == 2
                                          ? controller
                                      .featuredList[1].products[index].image!
                                          : controller
                                              .featuredList[2].products[index].image!,
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: InkWell(
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.grey,
                              ),
                              onTap: () {},
                            ),
                          )
                        ],
                        alignment: Alignment.topRight,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: SizedBox(
                            width: 150,
                            child: Text(
                              widget.type == 1
                                  ? controller
                                  .featuredList[0].products[index].category!.name
                                  .toString()
                                  : widget.type == 2
                                      ? controller
                                  .featuredList[1].products[index].category!.name
                                  .toString()
                                      : controller
                                          .featuredList[2].products[index].category!.name
                                          .toString(),
                              //homeController.itemItems.value[index].title,
                              //controller.popular[index].name!,
                              style: const TextStyle(
                                fontSize: 10,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8, top: 4, right: 8),
                        child: SizedBox(
                            width: 150,
                            child: Text(
                              widget.type == 1
                                  ? controller.featuredList[0].products[index].name!
                                  : widget.type == 2
                                      ? controller.featuredList[1].products[index].name!
                                      : controller.featuredList[2].products[index].name!,
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                          width: 150,
                          child: Text(
                            widget.type == 1
                                ? "${controller.prices[index].oldPrice!} Сум"
                                : widget.type == 2
                                    ? "${controller.recPrice[index].oldPrice!} Сум"
                                    : "${controller.featPrice[index].oldPrice!} Сум",
                            //"${homeController.itemItems.value[index].price.toString()} \$",
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.red,
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                ),
              ),
            ),
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                width: 8,
              );
            },
          ),
        ),
      ),
    );
  }
}
