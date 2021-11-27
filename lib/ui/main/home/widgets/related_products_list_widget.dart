import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_goodzone/controller/main/home/product_detail/product_detail_controller.dart';
import 'package:my_goodzone/data/models/products/products_response.dart';
import 'package:my_goodzone/routes/app_routes.dart';

class RelatedProductsListWidget extends StatefulWidget {
  final RelatedProducts relatedProduct;

  const RelatedProductsListWidget({Key? key,required this.relatedProduct}) : super(key: key);

  @override
  State<RelatedProductsListWidget> createState() => _RelatedProductsListWidgetState();
}

class _RelatedProductsListWidgetState extends State<RelatedProductsListWidget> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailController>(
      builder: (controller) => SizedBox(
        height: 220,
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: controller.relatedProducts.length,
            itemBuilder: (context, index) =>

            Card(
              child: InkWell(
                onTap: () {

                  Get.toNamed(Routes.PRODUCT_DETAIL,arguments: [widget.relatedProduct.slug,widget.relatedProduct.id]);
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
                                  widget.relatedProduct.image!,
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
                              widget.relatedProduct.category!.name.toString(),
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
                              widget.relatedProduct.name!,
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
                            "",
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
