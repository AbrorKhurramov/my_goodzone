
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:my_goodzone/controller/main/home/home_controller.dart';
import 'package:my_goodzone/controller/main/my_orders/my_orders_controller.dart';
import 'package:my_goodzone/data/data_source/local_source.dart';
import 'package:my_goodzone/data/floor/entity/basket_products.dart';

class OrderItemWidget extends StatelessWidget {
  OrderItemWidget({
    Key? key,
    required this.homeController,
    required this.controller,
    required this.snapshot,
    required this.index,
  }) : super(key: key);

  final HomeController homeController;
  final MyOrdersController controller;
  int index;
  AsyncSnapshot<List<BasketProduct>>? snapshot;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                  height: 100,
                  width: 100,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      snapshot!.data?[index].image??"",
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.fill,
                    ),

                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: Text(snapshot!.data?[index].name??"",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontWeight: FontWeight.bold,
                          fontSize: 18),
                      maxLines: 2,
                    ),
                  ),
                  Text('${snapshot!.data?[index].price} Сум',
                    style: const TextStyle(color: Colors.red,fontSize: 16,fontWeight: FontWeight.bold), ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          LocalSource.getInstance().updateQuantity(product: snapshot!.data![index],isMinus: true);
                          homeController.update();
                          controller.update();

                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Colors.grey.withOpacity(0.15),
                          ),
                          width: 30,
                          height: 30,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: const Icon(FontAwesomeIcons.minus,size: 15),
                          ),
                        ),
                      ),
                      Padding(padding: const EdgeInsets.all(10),
                          child: Text(snapshot!.data![index].quantity.toString(),style: const TextStyle(fontSize: 20),)),
                      GestureDetector(
                        onTap: (){
                          LocalSource.getInstance().updateQuantity(product: snapshot!.data![index],isMinus: false);
                          homeController.update();
                          controller.update();
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color:Colors.grey.withOpacity(0.15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: const Icon(FontAwesomeIcons.plus,size: 15),
                          ),
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 10),
                ],
              )
            ],
          ),
          Container(
            height: 1,
            width: MediaQuery.of(context).size.width,
            color: Colors.black12,
          ),
        ],
      ),
    );
  }
}